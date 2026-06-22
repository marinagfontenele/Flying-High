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
    var finishedDates   : [Date]
    var info            : String?
    var room            : RoomModel?
    var isActive        : Bool = false
    var isFinished      : Bool = false
    var estimatedTime   : TimeInterval
    var category        : CategoryModel
    var durations       : [TimeInterval]
    
    
    init(title: String, category: CategoryModel, room: RoomModel? = nil, info: String, estimatedTime: TimeInterval) {
        self.durations      = []
        self.finishedDates  = []
        self.room           = room
        self.title          = title
        self.category       = category
        self.estimatedTime  = estimatedTime
    }
    
    func estimatedTimeString() -> String {        
        return estimatedTime.formatToAbbreviated()
    }
}
