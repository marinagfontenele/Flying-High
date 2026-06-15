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
    var timeTest: TimeInterval
    var isActive: Bool = false
    var category: CategoryModel
    var room: RoomModel
    
    init(title: String, tasks: [TaskModel], timeTest: TimeInterval, category: CategoryModel, room: RoomModel) {
        self.title = title
        self.tasks = tasks
        self.timeTest = 0
        self.category = category
        self.room = room
    }
}
