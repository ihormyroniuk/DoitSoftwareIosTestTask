//
//  AddNewUserHttpExchange.swift
//  DoitSoftwareTestApi
//
//  Created by Ihor Myroniuk on 25.12.2020.
//

import AFoundation

class AddNewUserHttpExchange: ApiHttpExchange<AddingNewUser, AddNewUserResult> {
    
    override func constructHttpRequest(data: AddingNewUser) throws -> Http.Request {
        let method = Http.Request.Method.post
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = "\(basePath)/users"
        let uri = try urlComponents.constructUrl()
        var headers: [String: String] = [:]
        headers[Http.HeaderField.contentType] = MediaType.Application.Json.template
        var jsonObject: JsonObject = JsonObject()
        jsonObject["email"] = data.email
        jsonObject["password"] = data.password
        let body = try JSONSerialization.data(jsonValue: jsonObject)
        let httpRequest = Http.Request(method: method, uri: uri, version: Http.Version.http1dot1, headers: headers, body: body)
        return httpRequest
    }
    
    override func parseHttpResponse(httpResponse: Http.Response) throws -> AddNewUserResult {
        let code = httpResponse.code
        if code == Http.Response.Code.created {
            let body = httpResponse.body ?? Data()
            let jsonValue = try JSONSerialization.json(data: body)
            let jsonObject = try jsonValue.object()
            let token = try jsonObject.string("token")
            let addedNewUser = AddedNewUser(token: token)
            return .addedNewUser(addedNewUser)
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
