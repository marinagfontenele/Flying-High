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
    var Category: CategoryModel?
    var isActive: Bool = false
    
    
    init(title: String, totalTime: TimeInterval? = nil) {
        self.title = title
        self.totalTime = totalTime
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
        let totalSeconds = Int(self.totalTime!)
        
        let minutes = (totalSeconds / 60) % 60
        let hours = totalSeconds / 3600

        if hours < 0 {
            return String(format: "%02d minutos %02d segundos", minutes)
        }
        
        if hours == 1 {
            return String(format: "%02d hora %02d minutos", hours, minutes)
        }
        
        return String(format: "%02d hora %02d minutos", hours, minutes)
    }
}
