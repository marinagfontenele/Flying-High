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
    
    var title: String {
        switch self {
        case .none:
            return "Não definido"
        case .cleaning:
            return "Limpeza"
        case .organization:
            return "Organização"
        case .repair:
            return "Reparo"
        case .other:
            return "Outro"
        }
    }
    
    var iconColor: Color {
        switch self{
            case .none: return .gray
            case .cleaning: return .blueTag
            case .repair: return .repairTag
            case .other: return .gray
            case .organization: return .organizationTag
        }
    }
    
    var iconSymbol: String {
        switch self{
        case .none: return "xmark.circle"
        case .cleaning: return "bubbles.and.sparkles.fill"
        case .repair: return "wrench.and.screwdriver.fill"
        case .other: return "questionmark.circle"
        case .organization: return "books.vertical.fill"
        }
    }
    
    var medal: Image {
        switch self{
        case .none: return Image(.noneMedal)
        case .cleaning: return Image(.cleaningMedal)
        case .repair: return Image(.repairMedal)
        case .other: return Image(.noneMedal)
        case .organization: return Image(.organizationMedal)
        }
    }
    var tagMarker: Image {
        switch self{
        case .none: return Image(systemName: "xmark.circle")
        case .cleaning: return Image(.cleaningMarker)
        case .repair: return Image(.repairMarker)
        case .organization: return Image(.organizationMarker)
        case .other: return Image("questionmark.circle")
        }
    }
    
}
