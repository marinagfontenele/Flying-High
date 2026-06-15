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
    var totalTime: TimeInterval
//    var timeString: String?
    var isActive: Bool = false
    var category: CategoryModel
    
    init(title: String, tasks: [TaskModel], totalTime: TimeInterval, category: CategoryModel) {
        self.title = title
        self.tasks = tasks
        self.totalTime = totalTime
        self.category = category
//        self.timeString = timeString
    }
}

extension ScheduleModel {
    func formatTime() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad // Garante os zeros à esquerda (00:00:00)
        
        return formatter.string(from: self.totalTime) ?? "00:00:00"
    }
    
    func formatTimeExtended() -> String {
        let totalTimeUnwrapped = self.totalTime
        
        let totalSeconds = Int(totalTimeUnwrapped)
        var minutes = (totalSeconds / 60) % 60
        var hours = totalSeconds / 3600
        
        if hours == 0 {
            return "\(minutes) min"
        }
        if minutes == 0 {
            return "\(hours)h"
        }
        
        return "\(hours)h \(minutes)min"
    }
}
