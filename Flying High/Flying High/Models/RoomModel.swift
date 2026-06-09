//
//  RoomModel.swift
//  Flying High
//
//  Created by Ulisses Bonfim on 09/06/26.
//

import Foundation
import SwiftData

@Model
class RoomModel {
    
    @Attribute(.unique) var id: UUID
    var title: String
    
    init(id: UUID, title: String) {
        self.id = id
        self.title = title
    }
}
