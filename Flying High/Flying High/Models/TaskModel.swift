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
    
    var title       : String
    var info        : String?
    var lastDuration: [TimeInterval]?
    var timeGoal    : TimeInterval
    var isActive    : Bool = false
    
    
    init(title: String, info: String, timeGoal: TimeInterval) {
        self.title      = title
        self.timeGoal   = timeGoal
    }
    
}
