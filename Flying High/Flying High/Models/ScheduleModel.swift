//
//  ScheduleModel.swift
//  Flying High
//
//  Created by Ulisses Bonfim on 09/06/26.
//

import Foundation
import SwiftData

@Model
class ScheduleModel {
    
    @Attribute(.unique) var id = UUID()
    
    var title: String
    var tasks: [TaskModel]
    var isActive: Bool = false
    var category: CategoryModel?
    var timePassed: TimeInterval?
    
    
    init(title: String, tasks: [TaskModel] = [], category: CategoryModel? = nil) {
        self.title = title
        self.tasks = tasks
        self.category = category ?? CategoryModel.none
    }
    
    var totalTime: TimeInterval{
        tasks.reduce(0) { $0 + $1.estimatedTime }
    }
    
    var isFinished: Bool {
        !tasks.isEmpty && tasks.allSatisfy{ $0.isFinished }
    }
    
    var remainingTime: TimeInterval {
        tasks.filter { !$0.isFinished}
            .reduce(0) { $0 + $1.estimatedTime }
    }
    
    var remainingTimeString: String {
        return remainingTime.formatToFriendly()
    }
    
    func resetTasks() {
        for task in tasks {
            task.isFinished = false
        }
    }
}
