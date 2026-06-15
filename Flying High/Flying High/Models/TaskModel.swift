//
//  TaskModel.swift
//  Flying High
//
//  Created by Ulisses Bonfim on 09/06/26.
//

import Foundation
import SwiftData

@Model
class TaskModel {
    
    @Attribute(.unique) var id = UUID()
    
    var title           : String
    var category        : CategoryModel
    var room            : RoomModel?
    var info            : String?
    var estimatedTime   : TimeInterval?
    var lastDuration    : [TimeInterval]?
    var isActive        : Bool = false
    
    
    init(title: String, category: CategoryModel, room: RoomModel? = nil, info: String, estimatedTime: TimeInterval? = nil) {
        self.title      = title
        self.category   = category
        self.room       = room
        self.estimatedTime = estimatedTime
        
    }
    
}

extension TaskModel {
    func formatTime() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad // Garante os zeros à esquerda (00:00:00)
        
        return formatter.string(from: self.estimatedTime!) ?? "00:00:00"
    }
    
    func formatTimeExtended() -> String {
        guard let totalTimeUnwrapped = self.estimatedTime else {
            return "00 min"
        }
        
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
//        var formattedHour = ""
//        var formattedMinute = ""
//        if hours > 0 {
//            formattedHour = String(format: "%02d", hours)
//        }
//        if minutes > 0 {
//            formattedMinute = String(format: "%02d", minutes)
//        }
//        
//        let hourSuffix = hours == 1 ? "hora" : "horas"
//        let minuteSuffix = minutes == 1 ? "minuto" : "minutos"
//        
//        return "\(formattedHour) \(hourSuffix) \(formattedMinute) \(minuteSuffix)"
        
    }
}
