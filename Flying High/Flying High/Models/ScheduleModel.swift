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
    var totalTime: TimeInterval?
    var timePassed: TimeInterval?
    var category: CategoryModel?
    var isActive: Bool = false
    
    
    init(title: String, tasks: [TaskModel] = [], category: CategoryModel? = nil) {
        self.title = title
        self.tasks = tasks
        self.category = category ?? CategoryModel.none
        
        var timeAux: TimeInterval = totalTime ?? 0

        for task in tasks {
            timeAux += task.estimatedTime
        }
        
        self.totalTime = timeAux
    }
    
    var remainingTime: TimeInterval {
        tasks.filter { !$0.isFinished}
            .reduce(0) { $0 + $1.estimatedTime }
    }
    
    var remainingTimeString: String {
        return remainingTime.formatToFriendly()
    }
    
}
