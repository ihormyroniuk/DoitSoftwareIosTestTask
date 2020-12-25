//
//  CreatedTask.swift
//  DoitSoftwareTestApi
//
//  Created by Ihor Myroniuk on 25.12.2020.
//

import Foundation

public struct CreatedTask {
    public let id: Int
    public let title: String
    public let dueBy: Int
    public let priority: TaskPriority
    
    init(id: Int, title: String, dueBy: Int, priority: TaskPriority) {
        self.id = id
        self.title = title
        self.dueBy = dueBy
        self.priority = priority
    }
}
