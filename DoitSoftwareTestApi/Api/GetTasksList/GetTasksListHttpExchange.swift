//
//  TasksListHttpExchange.swift
//  DoitSoftwareTestApi
//
//  Created by Ihor Myroniuk on 25.12.2020.
//

import AFoundation

class GetTasksListHttpExchange: ApiHttpExchange<GettingTasksList, GetTasksListResult> {
    override func constructHttpRequest(data: GettingTasksList) throws -> HttpRequest {
        let method = Http.Method.get
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = "\(basePath)/tasks"
        let pageUrlQueryItem = URLQueryItem(name: "page", value: "\(data.page)")
        let urlQeryItems: [URLQueryItem] = [pageUrlQueryItem]
        urlComponents.queryItems = urlQeryItems
        let uri = try urlComponents.constructUrl()
        var headers: [String: String] = [:]
        headers[Http.HeaderField.contentType] = MediaTypes.application.json.name
        headers["Authorization"] = "Bearer \(data.token)"
        let httpRequest = HttpRequest(method: method, uri: uri, version: Http.Version.http1dot1, headers: headers, body: nil)
        return httpRequest
    }
    
    override func parseHttpResponse(httpResponse: HttpResponse) throws -> GetTasksListResult {
        let code = httpResponse.code
        if code == Http.Code.ok {
            let body = httpResponse.body ?? Data()
            let jsonValue = try JSONSerialization.json(data: body)
            let jsonObject = try jsonValue.object()
            let tasksJsonArray = try jsonObject.array("tasks").arrayObjects()
            var tasks: [CreatedTask] = []
            for taskJsonObject in tasksJsonArray {
                let id = try taskJsonObject.number("id").int
                let title = try taskJsonObject.string("title")
                let dueByInt = try taskJsonObject.number("dueBy").double
                let dueBy = Date(timeIntervalSince1970: dueByInt)
                let priorityRawValue = try taskJsonObject.string("priority")
                let optionalPriority = TaskPriority(rawValue: priorityRawValue)
                guard let priority = optionalPriority else {
                    let error = UnexpectedError()
                    throw error
                }
                let task = CreatedTask(id: id, title: title, dueBy: dueBy, priority: priority)
                tasks.append(task)
            }
            let metaJsonObject = try jsonObject.object("meta")
            let current = try metaJsonObject.number("current").int
            let limit = try metaJsonObject.number("limit").int
            let count = try metaJsonObject.number("count").int
            let meta = Meta(current: current, limit: limit, count: count)
            let gettedTasksList = GettedTasksList(tasks: tasks, meta: meta)
            return .gettedTasksList(gettedTasksList)
        } else if code == Http.Code.unauthorized {
            let body = httpResponse.body ?? Data()
            let jsonValue = try JSONSerialization.json(data: body)
            let jsonObject = try jsonValue.object()
            let message = try jsonObject.string("message")
            return .unauthorized(message)
        } else {
            let error = UnexpectedHttpResponseStatusCodeError(code: code)
            throw error
        }
    }
}

