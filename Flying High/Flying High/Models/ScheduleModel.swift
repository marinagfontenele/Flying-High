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
    var timeString: String?
    var category: CategoryModel?
    var isActive: Bool = false
    
    
    init(title: String, totalTime: TimeInterval? = nil, tasks: [TaskModel]? = nil, category: CategoryModel? = nil) {
        self.title = title
        self.totalTime = totalTime
        self.tasks = tasks
        self.category = category ?? CategoryModel.none
    }
}

extension ScheduleModel {
    func formatTime() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad // Garante os zeros à esquerda (00:00:00)
        
        return formatter.string(from: self.totalTime!) ?? "00:00:00"
    }
    
    func formatTimeExtended() -> String {
        guard let totalTimeUnwrapped = self.totalTime else {
            return "00 min"
        }
        
        let totalSeconds = Int(totalTimeUnwrapped)
        let minutes = (totalSeconds / 60) % 60
        let hours = totalSeconds / 3600
        
        if hours == 0 {
            return "\(minutes) min"
        }
        if minutes == 0 {
            return "\(hours)h"
        }
        
        return "\(hours)h \(minutes)min"
        
//        let hourString = hours == 1 ? "1 hora" : "\(hours) horas"
//        let minuteString = minutes == 1 ? "1 minuto" : "\(minutes) minutos"
//        
//        if hours == 0 {
//            return minuteString
//        }
//        
//        if minutes == 0 {
//            return hourString
//        }
//        
//        let formattedHour = String(format: "%02d", hours)
//        let formattedMinute = String(format: "%02d", minutes)
//        
//        let hourSuffix = hours == 1 ? "hora" : "horas"
//        let minuteSuffix = minutes == 1 ? "minuto" : "minutos"
//        
//        return "\(formattedHour) \(hourSuffix) \(formattedMinute) \(minuteSuffix)"
    }
}
