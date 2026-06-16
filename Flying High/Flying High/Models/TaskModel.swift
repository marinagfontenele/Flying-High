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
    var estimatedTime   : TimeInterval
    var lastDuration    : [TimeInterval]?
    var isActive        : Bool = false
    var isFinished      : Bool = false
    
    
    init(title: String, category: CategoryModel, room: RoomModel? = nil, info: String, estimatedTime: TimeInterval) {
        self.title      = title
        self.category   = category
        self.room       = room
        self.estimatedTime = estimatedTime
        
    }
    
}
