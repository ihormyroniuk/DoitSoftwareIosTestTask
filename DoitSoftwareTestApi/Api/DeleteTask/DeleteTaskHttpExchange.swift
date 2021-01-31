//
//  DeleteTaskHttpExchange.swift
//  DoitSoftwareTestApi
//
//  Created by Ihor Myroniuk on 26.12.2020.
//

import AFoundation

class DeleteTaskHttpExchange: ApiHttpExchange<GettingTaskDetails, DeleteTaskResult> {
    
    override func constructHttpRequest(data: GettingTaskDetails) throws -> HttpRequest {
        let method = HttpRequest.Method.delete
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
    
    override func parseHttpResponse(httpResponse: HttpResponse) throws -> DeleteTaskResult {
        let code = httpResponse.code
        if code == HttpResponse.Code.accepted {
            return .deletedTask
        } else if code == HttpResponse.Code.unauthorized {
            let body = httpResponse.body ?? Data()
            let jsonValue = try JSONSerialization.json(data: body)
            let jsonObject = try jsonValue.object()
            let message = try jsonObject.string("message")
            return .unauthorized(message)
        } else {
            let error = UnexpectedHttpResponseCodeError(code: code)
            throw error
        }
    }
    
}
