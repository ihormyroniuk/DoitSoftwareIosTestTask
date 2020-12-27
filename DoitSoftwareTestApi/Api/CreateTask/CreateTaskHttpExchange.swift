//
//  CreateTaskHttpExchange.swift
//  DoitSoftwareTestApi
//
//  Created by Ihor Myroniuk on 25.12.2020.
//

import AFoundation

class CreateTaskHttpExchange: ApiHttpExchange<CreatingTask, CreateTaskResult> {
    override func constructHttpRequest(data: CreatingTask) throws -> HttpRequest {
        let method = Http.Method.post
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = "\(basePath)/tasks"
        let uri = try urlComponents.constructUrl()
        var headers: [String: String] = [:]
        headers[Http.HeaderField.contentType] = MediaTypes.application.json.name
        headers["Authorization"] = "Bearer \(data.token)"
        var jsonObject: JsonObject = JsonObject()
        jsonObject["title"] = data.title
        jsonObject["dueBy"] = Int(data.dueBy.timeIntervalSince1970)
        jsonObject["priority"] = data.priority.rawValue
        let body = try JSONSerialization.data(jsonValue: jsonObject)
        let httpRequest = HttpRequest(method: method, uri: uri, version: Http.Version.http1dot1, headers: headers, body: body)
        return httpRequest
    }
    
    override func parseHttpResponse(httpResponse: HttpResponse) throws -> CreateTaskResult {
        let code = httpResponse.code
        if code == Http.Code.created {
            let body = httpResponse.body ?? Data()
            let jsonValue = try JSONSerialization.json(data: body)
            let jsonObject = try jsonValue.object()
            let taskJsonObject = try jsonObject.object("task")
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
            let createdTask = CreatedTask(id: id, title: title, dueBy: dueBy, priority: priority)
            return .createdTaskResult(createdTask)
        } else if code == Http.Code.unauthorized {
            let body = httpResponse.body ?? Data()
            let jsonValue = try JSONSerialization.json(data: body)
            let jsonObject = try jsonValue.object()
            let message = try jsonObject.string("message")
            return .unauthorized(message)
        } else if code == 422 {
            let body = httpResponse.body ?? Data()
            let jsonValue = try JSONSerialization.json(data: body)
            let jsonObject = try jsonValue.object()
            let message = try jsonObject.string("message")
            return .validationFailed(message)
        } else {
            let error = UnexpectedHttpResponseStatusCodeError(code: code)
            throw error
        }
    }
}
