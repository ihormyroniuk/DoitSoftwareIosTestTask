//
//  WebApiHttpExchange.swift
//  DoitSoftwareTestApi
//
//  Created by Ihor Myroniuk on 25.12.2020.
//

import AFoundation

class ApiHttpExchange<HttpRequestData, ParsedHttpResponse>: SchemeHostHttpExchange<HttpRequestData, ParsedHttpResponse> {
    let basePath: String = "/api"
}
