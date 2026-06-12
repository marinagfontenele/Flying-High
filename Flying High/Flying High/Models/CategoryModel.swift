//
//  Type.swift
//  Flying High
//
//  Created by Ulisses Bonfim on 09/06/26.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class CategoryModel {
    
    @Attribute(.unique) var id: UUID
    var title: String
    
    init(id: UUID, title: String) {
        self.id = id
        self.title = title
    }
}

enum Category: Codable, CaseIterable {
    case clean, organization, repairs
    
    var title: String {
        switch self {
        case .clean:
            return "Limpeza"
        case .organization:
            return "Organização"
        case .repairs:
            return "Reparo"
        }
    }
    
    var color: Color {
        switch self {
        case .clean:
            return .blueTag
        case .organization:
            return .orangeTag
        case .repairs:
            return .redTag
        }
    }
}
