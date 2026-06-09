//
//  Type.swift
//  Flying High
//
//  Created by Ulisses Bonfim on 09/06/26.
//

import Foundation
import SwiftData

@Model
class ArticleModel {
    
    @Attribute(.unique) var id: UUID
//    TODO: colocar imagem
    var title: String
    var subtitle: String
    var text: String
    
    init(id: UUID, title: String, subtitle: String, text: String) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.text = text
    }
}
