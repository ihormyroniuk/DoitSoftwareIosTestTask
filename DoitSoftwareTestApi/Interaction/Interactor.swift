//
//  Interactor.swift
//  DoitSoftwareTestApi
//
//  Created by Ihor Myroniuk on 25.12.2020.
//

import AFoundation

public protocol Interactor {
    
    func addNewUser(addingNewUser: AddingNewUser, completionHandler: @escaping (Result<AddNewUserResult, DataTaskError>) -> ())
    func authorizeUserByCredentials(authorizingUserByCredentials: AddingNewUser, completionHandler: @escaping (Result<AuthorizeUserByCredentialsResult, DataTaskError>) -> ())
    func createTask(creatingTask: CreatingTask, completionHandler: @escaping (Result<CreateTaskResult, DataTaskError>) -> ())
    func getTasksList(gettingTasksList: GettingTasksList, completionHandler: @escaping (Result<GetTasksListResult, DataTaskError>) -> ())
    func getTaskDetails(gettingTaskDetails: GettingTaskDetails, completionHandler: @escaping (Result<GetTaskDetailsResult, DataTaskError>) -> ())
    func updateTask(updatingTask: UpdatingTask, completionHandler: @escaping (Result<UpdateTaskResult, DataTaskError>) -> ())
    func deleteTask(deletingTask: GettingTaskDetails, completionHandler: @escaping (Result<DeleteTaskResult, DataTaskError>) -> ())
    
}
