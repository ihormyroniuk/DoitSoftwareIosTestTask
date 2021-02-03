//
//  UrlSessionSharedInteractor.swift
//  DoitSoftwareTestApi
//
//  Created by Ihor Myroniuk on 25.12.2020.
//

import ASwift
import AFoundation

class UrlSessionSharedInteractor: Interactor {
    
    private let session = URLSession.shared
    private let api: Api
    
    public init(scheme: String, host: String) {
        let api = Api(scheme: scheme, host: host)
        self.api = api
    }
    
    public func addNewUser(addingNewUser: AddingNewUser, completionHandler: @escaping (Result<AddNewUserResult, DataTaskError>) -> ()) {
        let httpExchange = api.addNewUser()
        session.dataTask(httpExchange: httpExchange, data: addingNewUser, completionHandler: completionHandler)
    }
    
    func authorizeUserByCredentials(authorizingUserByCredentials: AddingNewUser, completionHandler: @escaping (Result<AuthorizeUserByCredentialsResult, DataTaskError>) -> ()) {
        let httpExchange = api.authorizeUserByCredentials()
        session.dataTask(httpExchange: httpExchange, data: authorizingUserByCredentials, completionHandler: completionHandler)
    }
    
    func createTask(creatingTask: CreatingTask, completionHandler: @escaping (Result<CreateTaskResult, DataTaskError>) -> ()) {
        let httpExchange = api.createTask()
        session.dataTask(httpExchange: httpExchange, data: creatingTask, completionHandler: completionHandler)
    }
    
    func getTasksList(gettingTasksList: GettingTasksList, completionHandler: @escaping (Result<GetTasksListResult, DataTaskError>) -> ()) {
        let httpExchange = api.getTasksList()
        session.dataTask(httpExchange: httpExchange, data: gettingTasksList, completionHandler: completionHandler)
    }
    
    func getTaskDetails(gettingTaskDetails: GettingTaskDetails, completionHandler: @escaping (Result<GetTaskDetailsResult, DataTaskError>) -> ()) {
        let httpExchange = api.getTaskDetails()
        session.dataTask(httpExchange: httpExchange, data: gettingTaskDetails, completionHandler: completionHandler)
    }
    
    func updateTask(updatingTask: UpdatingTask, completionHandler: @escaping (Result<UpdateTaskResult, DataTaskError>) -> ()) {
        let httpExchange = api.updateTask()
        session.dataTask(httpExchange: httpExchange, data: updatingTask, completionHandler: completionHandler)
    }
    
    func deleteTask(deletingTask: GettingTaskDetails, completionHandler: @escaping (Result<DeleteTaskResult, DataTaskError>) -> ()) {
        let httpExchange = api.deleteTask()
        session.dataTask(httpExchange: httpExchange, data: deletingTask, completionHandler: completionHandler)
    }
    
}
