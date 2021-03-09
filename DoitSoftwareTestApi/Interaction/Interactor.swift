//
//  Interactor.swift
//  DoitSoftwareTestApi
//
//  Created by Ihor Myroniuk on 25.12.2020.
//

import AFoundation

public protocol Interactor {
    
    func addNewUser(addingNewUser: AddingNewUser, completionHandler: @escaping (Result<AddNewUserResult, URLSessionTask.Error>) -> ())
    func authorizeUserByCredentials(authorizingUserByCredentials: AddingNewUser, completionHandler: @escaping (Result<AuthorizeUserByCredentialsResult, URLSessionTask.Error>) -> ())
    func createTask(creatingTask: CreatingTask, completionHandler: @escaping (Result<CreateTaskResult, URLSessionTask.Error>) -> ())
    func getTasksList(gettingTasksList: GettingTasksList, completionHandler: @escaping (Result<GetTasksListResult, URLSessionTask.Error>) -> ())
    func getTaskDetails(gettingTaskDetails: GettingTaskDetails, completionHandler: @escaping (Result<GetTaskDetailsResult, URLSessionTask.Error>) -> ())
    func updateTask(updatingTask: UpdatingTask, completionHandler: @escaping (Result<UpdateTaskResult, URLSessionTask.Error>) -> ())
    func deleteTask(deletingTask: GettingTaskDetails, completionHandler: @escaping (Result<DeleteTaskResult, URLSessionTask.Error>) -> ())
    
}
