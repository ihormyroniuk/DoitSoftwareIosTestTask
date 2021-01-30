//
//  GetTaskDetailsHttpExchange.swift
//  DoitSoftwareTestApi
//
//  Created by Ihor Myroniuk on 26.12.2020.
//

import ASwift
import AFoundation

class GetTaskDetailsHttpExchange: ApiHttpExchange<GettingTaskDetails, GetTaskDetailsResult> {
    override func constructHttpRequest(data: GettingTaskDetails) throws -> HttpRequest {
        let method = Http.Method.get
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = "\(basePath)/tasks/\(data.task)"
        let uri = try urlComponents.constructUrl()
        var headers: [String: String] = [:]
        headers[Http.HeaderField.contentType] = MediaType.Application.Json.template
        headers["Authorization"] = "Bearer \(data.token)"
        let httpRequest = HttpRequest(method: method, uri: uri, version: Http.Version.http1dot1, headers: headers, body: nil)
        return httpRequest
    }
    
    override func parseHttpResponse(httpResponse: HttpResponse) throws -> GetTaskDetailsResult {
        let code = httpResponse.code
        if code == Http.Code.ok {
            let body = httpResponse.body ?? Data()
            let jsonValue = try JSONSerialization.json(data: body)
            let jsonObject = try jsonValue.object()
            let taskJsonObject = try jsonObject.object("task")
            let id = try taskJsonObject.number("id").int()
            let title = try taskJsonObject.string("title")
            let dueByInt = try taskJsonObject.number("dueBy").double()
            let dueBy = Date(timeIntervalSince1970: dueByInt)
            let priorityRawValue = try taskJsonObject.string("priority")
            let optionalPriority = TaskPriority(rawValue: priorityRawValue)
            guard let priority = optionalPriority else {
                let error = UnexpectedError()
                throw error
            }
            let createdTask = CreatedTask(id: id, title: title, dueBy: dueBy, priority: priority)
            return .gettedTaskDetails(createdTask)
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
