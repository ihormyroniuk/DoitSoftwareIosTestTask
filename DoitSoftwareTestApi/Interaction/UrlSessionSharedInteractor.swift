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
    
    public func addNewUser(addingNewUser: AddingNewUser, completionHandler: @escaping (Result<AddNewUserResult, InteractionError>) -> ()) {
        let httpExchange = api.addNewUser()
        let httpRequest: HttpRequest
        do { httpRequest = try httpExchange.constructHttpRequest(data: addingNewUser) } catch {
            completionHandler(.failure(.unexpectedError(error: error)))
            return
        }
        let urlRequest = URLRequest(httpRequest: httpRequest)
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                let interactionError = InteractionError(error: error)
                completionHandler(.failure(interactionError))
            } else if let httpUrlResponse = response as? HTTPURLResponse {
                let httpResponse = HttpResponse(httpUrlResponse: httpUrlResponse, data: data)
                let response: AddNewUserResult
                do { response = try httpExchange.parseHttpResponse(httpResponse: httpResponse) } catch {
                    let error = UnexpectedHttpExchangeError(httpRequest: httpRequest, httpResponse: httpResponse, error: error)
                    completionHandler(.failure(.unexpectedError(error: error)))
                    return
                }
                completionHandler(.success(response))
            } else {
                let error = UnexpectedError()
                completionHandler(.failure(.unexpectedError(error: error)))
            }
        }
        dataTask.resume()
    }
    
    func authorizeUserByCredentials(authorizingUserByCredentials: AddingNewUser, completionHandler: @escaping (Result<AuthorizeUserByCredentialsResult, InteractionError>) -> ()) {
        let httpExchange = api.authorizeUserByCredentials()
        let httpRequest: HttpRequest
        do { httpRequest = try httpExchange.constructHttpRequest(data: authorizingUserByCredentials) } catch {
            completionHandler(.failure(.unexpectedError(error: error)))
            return
        }
        let urlRequest = URLRequest(httpRequest: httpRequest)
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                let interactionError = InteractionError(error: error)
                completionHandler(.failure(interactionError))
            } else if let httpUrlResponse = response as? HTTPURLResponse {
                let httpResponse = HttpResponse(httpUrlResponse: httpUrlResponse, data: data)
                let response: AuthorizeUserByCredentialsResult
                do { response = try httpExchange.parseHttpResponse(httpResponse: httpResponse) } catch {
                    let error = UnexpectedHttpExchangeError(httpRequest: httpRequest, httpResponse: httpResponse, error: error)
                    completionHandler(.failure(.unexpectedError(error: error)))
                    return
                }
                completionHandler(.success(response))
            } else {
                let error = UnexpectedError()
                completionHandler(.failure(.unexpectedError(error: error)))
            }
        }
        dataTask.resume()
    }
    
    func createTask(creatingTask: CreatingTask, completionHandler: @escaping (Result<CreateTaskResult, InteractionError>) -> ()) {
        let httpExchange = api.createTask()
        let httpRequest: HttpRequest
        do { httpRequest = try httpExchange.constructHttpRequest(data: creatingTask) } catch {
            completionHandler(.failure(.unexpectedError(error: error)))
            return
        }
        let urlRequest = URLRequest(httpRequest: httpRequest)
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                let interactionError = InteractionError(error: error)
                completionHandler(.failure(interactionError))
            } else if let httpUrlResponse = response as? HTTPURLResponse {
                let httpResponse = HttpResponse(httpUrlResponse: httpUrlResponse, data: data)
                let response: CreateTaskResult
                do { response = try httpExchange.parseHttpResponse(httpResponse: httpResponse) } catch {
                    let error = UnexpectedHttpExchangeError(httpRequest: httpRequest, httpResponse: httpResponse, error: error)
                    completionHandler(.failure(.unexpectedError(error: error)))
                    return
                }
                completionHandler(.success(response))
            } else {
                let error = UnexpectedError()
                completionHandler(.failure(.unexpectedError(error: error)))
            }
        }
        dataTask.resume()
    }
    
    func getTasksList(gettingTasksList: GettingTasksList, completionHandler: @escaping (Result<GetTasksListResult, InteractionError>) -> ()) {
        let httpExchange = api.getTasksList()
        let httpRequest: HttpRequest
        do { httpRequest = try httpExchange.constructHttpRequest(data: gettingTasksList) } catch {
            completionHandler(.failure(.unexpectedError(error: error)))
            return
        }
        let urlRequest = URLRequest(httpRequest: httpRequest)
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                let interactionError = InteractionError(error: error)
                completionHandler(.failure(interactionError))
            } else if let httpUrlResponse = response as? HTTPURLResponse {
                let httpResponse = HttpResponse(httpUrlResponse: httpUrlResponse, data: data)
                let response: GetTasksListResult
                do { response = try httpExchange.parseHttpResponse(httpResponse: httpResponse) } catch {
                    let error = UnexpectedHttpExchangeError(httpRequest: httpRequest, httpResponse: httpResponse, error: error)
                    completionHandler(.failure(.unexpectedError(error: error)))
                    return
                }
                completionHandler(.success(response))
            } else {
                let error = UnexpectedError()
                completionHandler(.failure(.unexpectedError(error: error)))
            }
        }
        dataTask.resume()
    }
    
    func getTaskDetails(gettingTaskDetails: GettingTaskDetails, completionHandler: @escaping (Result<GetTaskDetailsResult, InteractionError>) -> ()) {
        let httpExchange = api.getTaskDetails()
        let httpRequest: HttpRequest
        do { httpRequest = try httpExchange.constructHttpRequest(data: gettingTaskDetails) } catch {
            completionHandler(.failure(.unexpectedError(error: error)))
            return
        }
        let urlRequest = URLRequest(httpRequest: httpRequest)
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                let interactionError = InteractionError(error: error)
                completionHandler(.failure(interactionError))
            } else if let httpUrlResponse = response as? HTTPURLResponse {
                let httpResponse = HttpResponse(httpUrlResponse: httpUrlResponse, data: data)
                let response: GetTaskDetailsResult
                do { response = try httpExchange.parseHttpResponse(httpResponse: httpResponse) } catch {
                    let error = UnexpectedHttpExchangeError(httpRequest: httpRequest, httpResponse: httpResponse, error: error)
                    completionHandler(.failure(.unexpectedError(error: error)))
                    return
                }
                completionHandler(.success(response))
            } else {
                let error = UnexpectedError()
                completionHandler(.failure(.unexpectedError(error: error)))
            }
        }
        dataTask.resume()
    }
    
    func updateTask(updatingTask: UpdatingTask, completionHandler: @escaping (Result<UpdateTaskResult, InteractionError>) -> ()) {
        let httpExchange = api.updateTask()
        let httpRequest: HttpRequest
        do { httpRequest = try httpExchange.constructHttpRequest(data: updatingTask) } catch {
            completionHandler(.failure(.unexpectedError(error: error)))
            return
        }
        let urlRequest = URLRequest(httpRequest: httpRequest)
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                let interactionError = InteractionError(error: error)
                completionHandler(.failure(interactionError))
            } else if let httpUrlResponse = response as? HTTPURLResponse {
                let httpResponse = HttpResponse(httpUrlResponse: httpUrlResponse, data: data)
                let response: UpdateTaskResult
                do { response = try httpExchange.parseHttpResponse(httpResponse: httpResponse) } catch {
                    let error = UnexpectedHttpExchangeError(httpRequest: httpRequest, httpResponse: httpResponse, error: error)
                    completionHandler(.failure(.unexpectedError(error: error)))
                    return
                }
                completionHandler(.success(response))
            } else {
                let error = UnexpectedError()
                completionHandler(.failure(.unexpectedError(error: error)))
            }
        }
        dataTask.resume()
    }
    
    func deleteTask(deletingTask: GettingTaskDetails, completionHandler: @escaping (Result<DeleteTaskResult, InteractionError>) -> ()) {
        let httpExchange = api.deleteTask()
        let httpRequest: HttpRequest
        do { httpRequest = try httpExchange.constructHttpRequest(data: deletingTask) } catch {
            completionHandler(.failure(.unexpectedError(error: error)))
            return
        }
        let urlRequest = URLRequest(httpRequest: httpRequest)
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                let interactionError = InteractionError(error: error)
                completionHandler(.failure(interactionError))
            } else if let httpUrlResponse = response as? HTTPURLResponse {
                let httpResponse = HttpResponse(httpUrlResponse: httpUrlResponse, data: data)
                let response: DeleteTaskResult
                do { response = try httpExchange.parseHttpResponse(httpResponse: httpResponse) } catch {
                    let error = UnexpectedHttpExchangeError(httpRequest: httpRequest, httpResponse: httpResponse, error: error)
                    completionHandler(.failure(.unexpectedError(error: error)))
                    return
                }
                completionHandler(.success(response))
            } else {
                let error = UnexpectedError()
                completionHandler(.failure(.unexpectedError(error: error)))
            }
        }
        dataTask.resume()
    }
    
}
