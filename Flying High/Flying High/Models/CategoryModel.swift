//
//  Type.swift
//  Flying High
//
//  Created by Ulisses Bonfim on 09/06/26.
//

import Foundation
import SwiftData
import SwiftUI

enum CategoryModel: String, CaseIterable, Codable{
    case none = "Não definido"
    case cleaning = "Limpeza"
    case repair = "Reparo"
    case other = "Outros"
    case organization = "Organização"
    
    var displayName: String {
        switch self {
            case .none: return "Não definido"
            case .cleaning: return "Limpeza"
            case .repair: return "Reparo"
            case .other: return "Outros"
            case .organization: return "Organização"
        }
    }
    
    var iconColor: Color {
        switch self{
            case .none: return .gray
            case .cleaning: return .blueTag
            case .repair: return .redTag
            case .other: return .gray
            case .organization: return .orangeTag
        }
    }
    
    var iconSymbol: String {
        switch self{
        case .none: return "xmark.circle"
        case .cleaning: return "trash"
        case .repair: return "hammer"
        case .other: return "questionmark.circle"
        case .organization: return "folder.circle"
        }
    }
    
}

//enum Category: Codable, CaseIterable {
//    case clean, organization, repairs
//    
//    var title: String {
//        switch self {
//        case .clean:
//            return "Limpeza"
//        case .organization:
//            return "Organização"
//        case .repairs:
//            return "Reparo"
//        }
//    }
//    
//    var color: Color {
//        switch self {
//        case .clean:
//            return .blueTag
//        case .organization:
//            return .orangeTag
//        case .repairs:
//            return .redTag
//        }
//    }
//}
