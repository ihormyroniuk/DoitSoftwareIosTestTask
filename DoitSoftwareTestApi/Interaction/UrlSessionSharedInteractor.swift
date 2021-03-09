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
    
    public func addNewUser(addingNewUser: AddingNewUser, completionHandler: @escaping (Result<AddNewUserResult, URLSessionTask.Error>) -> ()) {
        let httpExchange = api.addNewUser()
        let dataTask: URLSessionDataTask
        do { dataTask = try session.httpExchangeDataTask(httpExchange, requestData: addingNewUser, completionHandler: completionHandler) } catch {
            completionHandler(.failure(.unexpectedError(error)))
            return
        }
        dataTask.resume()
    }
    
    func authorizeUserByCredentials(authorizingUserByCredentials: AddingNewUser, completionHandler: @escaping (Result<AuthorizeUserByCredentialsResult, URLSessionTask.Error>) -> ()) {
        let httpExchange = api.authorizeUserByCredentials()
        let dataTask: URLSessionDataTask
        do { dataTask = try session.httpExchangeDataTask(httpExchange, requestData: authorizingUserByCredentials, completionHandler: completionHandler) } catch {
            completionHandler(.failure(.unexpectedError(error)))
            return
        }
        dataTask.resume()
    }
    
    func createTask(creatingTask: CreatingTask, completionHandler: @escaping (Result<CreateTaskResult, URLSessionTask.Error>) -> ()) {
        let httpExchange = api.createTask()
        let dataTask: URLSessionDataTask
        do { dataTask = try session.httpExchangeDataTask(httpExchange, requestData: creatingTask, completionHandler: completionHandler) } catch {
            completionHandler(.failure(.unexpectedError(error)))
            return
        }
        dataTask.resume()
    }
    
    func getTasksList(gettingTasksList: GettingTasksList, completionHandler: @escaping (Result<GetTasksListResult, URLSessionTask.Error>) -> ()) {
        let httpExchange = api.getTasksList()
        let dataTask: URLSessionDataTask
        do { dataTask = try session.httpExchangeDataTask(httpExchange, requestData: gettingTasksList, completionHandler: completionHandler) } catch {
            completionHandler(.failure(.unexpectedError(error)))
            return
        }
        dataTask.resume()
    }
    
    func getTaskDetails(gettingTaskDetails: GettingTaskDetails, completionHandler: @escaping (Result<GetTaskDetailsResult, URLSessionTask.Error>) -> ()) {
        let httpExchange = api.getTaskDetails()
        let dataTask: URLSessionDataTask
        do { dataTask = try session.httpExchangeDataTask(httpExchange, requestData: gettingTaskDetails, completionHandler: completionHandler) } catch {
            completionHandler(.failure(.unexpectedError(error)))
            return
        }
        dataTask.resume()
    }
    
    func updateTask(updatingTask: UpdatingTask, completionHandler: @escaping (Result<UpdateTaskResult, URLSessionTask.Error>) -> ()) {
        let httpExchange = api.updateTask()
        let dataTask: URLSessionDataTask
        do { dataTask = try session.httpExchangeDataTask(httpExchange, requestData: updatingTask, completionHandler: completionHandler) } catch {
            completionHandler(.failure(.unexpectedError(error)))
            return
        }
        dataTask.resume()
    }
    
    func deleteTask(deletingTask: GettingTaskDetails, completionHandler: @escaping (Result<DeleteTaskResult, URLSessionTask.Error>) -> ()) {
        let httpExchange = api.deleteTask()
        let dataTask: URLSessionDataTask
        do { dataTask = try session.httpExchangeDataTask(httpExchange, requestData: deletingTask, completionHandler: completionHandler) } catch {
            completionHandler(.failure(.unexpectedError(error)))
            return
        }
        dataTask.resume()
    }
    
}
