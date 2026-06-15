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
    
    var title        : String
    var info         : String?
    var lastDuration : [TimeInterval]?
    var estimatedTime: TimeInterval
    var isActive     : Bool = false
    var room         : RoomModel?
    
    init(title: String, room: RoomModel? = nil, info: String, estimatedTime: TimeInterval) {
        self.title      = title
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
        
        return formatter.string(from: self.estimatedTime) ?? "00:00:00"
    }
    
    func formatTimeExtended() -> String {
        let totalTimeUnwrapped = self.estimatedTime
        
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
