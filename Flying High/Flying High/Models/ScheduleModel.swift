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
    var tasks: [TaskModel]?
    var totalTime: TimeInterval?
    var timePassed: TimeInterval?
    var timeRemaining: TimeInterval?
    var category: CategoryModel?
    var isActive: Bool = false
    
    
    init(title: String, tasks: [TaskModel]? = nil, category: CategoryModel? = nil) {
        self.title = title
        self.tasks = tasks
        self.category = category ?? CategoryModel.none
        
        var timeAux: TimeInterval = totalTime ?? 0

        for task in tasks ?? [] {
            timeAux += task.estimatedTime
        }
        
        self.totalTime = timeAux
    }
    
    func setTimePassed(timePassed: TimeInterval) {
        self.timePassed = timePassed
    }
    
    func remainingTimeString(timePassed: TimeInterval?) -> String {
        self.timeRemaining = (totalTime ?? 0) - (timePassed ?? 0)
        
        guard let timeRemaining = self.timeRemaining else {
            return "00 min"
        }
        
        let totalSeconds = Int(self.timeRemaining!)
        let minutes = (totalSeconds / 60) % 60
        let hours = totalSeconds / 3600
        
        if hours == 0 {
            return "\(minutes) min"
        }
        if minutes == 0 {
            return "\(hours)h"
        }
        
        return "\(hours)h \(minutes)min"
    }
}
