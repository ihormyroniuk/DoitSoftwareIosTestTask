//
//  UpdateTaskHttpExchange.swift
//  DoitSoftwareTestApi
//
//  Created by Ihor Myroniuk on 26.12.2020.
//

import AFoundation

class UpdateTaskHttpExchange: ApiHttpExchange<UpdatingTask, UpdateTaskResult> {
    override func constructHttpRequest(data: UpdatingTask) throws -> Http.Request {
        let method = Http.Request.Method.put
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = "\(basePath)/tasks/\(data.id)"
        let uri = try urlComponents.constructUrl()
        var headers: [String: String] = [:]
        headers[Http.HeaderField.contentType] = MediaType.Application.Json.template
        headers["Authorization"] = "Bearer \(data.token)"
        var jsonObject: JsonObject = JsonObject()
        jsonObject["title"] = data.title
        if let double = data.dueBy?.timeIntervalSince1970 {
            jsonObject["dueBy"] = Int(double)
        }
        jsonObject["priority"] = data.priority?.rawValue
        let body = try JSONSerialization.data(jsonValue: jsonObject)
        let httpRequest = Http.Request(method: method, uri: uri, version: Http.Version.http1dot1, headers: headers, body: body)
        return httpRequest
    }
    
    override func parseHttpResponse(httpResponse: Http.Response) throws -> UpdateTaskResult {
        let code = httpResponse.code
        if code == Http.Response.Code.accepted {
            return .updatedTask
        } else if code == Http.Response.Code.unauthorized {
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
            let error = UnexpectedHttpResponseCodeError(code: code)
            throw error
        }
    }
}
