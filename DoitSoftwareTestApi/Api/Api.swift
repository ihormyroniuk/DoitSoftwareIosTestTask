//
//  Api.swift
//  DoitSoftwareTestApi
//
//  Created by Ihor Myroniuk on 25.12.2020.
//

import Foundation


import Foundation

class Api {
    private let scheme: String
    private let host: String
    
    init(scheme: String, host: String) {
        self.scheme = scheme
        self.host = host
    }
    
    func addNewUser() -> AddNewUserHttpExchange {
        let httpExchange = AddNewUserHttpExchange(scheme: scheme, host: host)
        return httpExchange
    }
    
    func authorizeUserByCredentials() -> AuthorizeUserByCredentialsHttpExchange {
        let httpExchange = AuthorizeUserByCredentialsHttpExchange(scheme: scheme, host: host)
        return httpExchange
    }
    
    func createTask() -> CreateTaskHttpExchange {
        let httpExchange = CreateTaskHttpExchange(scheme: scheme, host: host)
        return httpExchange
    }
    
    func getTasksList() -> GetTasksListHttpExchange {
        let httpExchange = GetTasksListHttpExchange(scheme: scheme, host: host)
        return httpExchange
    }
    
    func getTaskDetails() -> GetTaskDetailsHttpExchange {
        let httpExchange = GetTaskDetailsHttpExchange(scheme: scheme, host: host)
        return httpExchange
    }
    
    func deleteTask() -> DeleteTaskHttpExchange {
        let httpExchange = DeleteTaskHttpExchange(scheme: scheme, host: host)
        return httpExchange
    }
    
    func updateTask() -> UpdateTaskHttpExchange {
        let httpExchange = UpdateTaskHttpExchange(scheme: scheme, host: host)
        return httpExchange
    }
}
