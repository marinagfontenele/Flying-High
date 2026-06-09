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
    
    @Attribute(.unique) var id: UUID
    
    var title       : String
    var category    : CategoryModel
    var room        : RoomModel
    var info        : String?
    var lastDuration: [TimeInterval]?
    var isActive    : Bool = false
    
    
    init(id: UUID, title: String, category: CategoryModel, room: RoomModel, info: String) {
        self.id         = id
        self.title      = title
        self.category   = category
        self.room       = room
        
    }
    
}
