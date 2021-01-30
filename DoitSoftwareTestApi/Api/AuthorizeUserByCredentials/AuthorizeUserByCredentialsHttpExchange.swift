//
//  AuthorizeUserByCredentialsHttpExchange.swift
//  DoitSoftwareTestApi
//
//  Created by Ihor Myroniuk on 25.12.2020.
//

import AFoundation

class AuthorizeUserByCredentialsHttpExchange: ApiHttpExchange<AddingNewUser, AuthorizeUserByCredentialsResult> {
    override func constructHttpRequest(data: AddingNewUser) throws -> HttpRequest {
        let method = Http.Method.post
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = "\(basePath)/auth"
        let uri = try urlComponents.constructUrl()
        var headers: [String: String] = [:]
        headers[Http.HeaderField.contentType] = MediaType.Application.Json.template
        var jsonObject: JsonObject = JsonObject()
        jsonObject["email"] = data.email
        jsonObject["password"] = data.password
        let body = try JSONSerialization.data(jsonValue: jsonObject)
        let httpRequest = HttpRequest(method: method, uri: uri, version: Http.Version.http1dot1, headers: headers, body: body)
        return httpRequest
    }
    
    override func parseHttpResponse(httpResponse: HttpResponse) throws -> AuthorizeUserByCredentialsResult {
        let code = httpResponse.code
        if code == Http.Code.ok {
            let body = httpResponse.body ?? Data()
            let jsonValue = try JSONSerialization.json(data: body)
            let jsonObject = try jsonValue.object()
            let token = try jsonObject.string("token")
            let addedNewUser = AddedNewUser(token: token)
            return .authorizeUserByCredentials(addedNewUser)
        } else if code == Http.Code.forbidden {
            let body = httpResponse.body ?? Data()
            let jsonValue = try JSONSerialization.json(data: body)
            let jsonObject = try jsonValue.object()
            let message = try jsonObject.string("message")
            return .wrongCredentials(message)
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
