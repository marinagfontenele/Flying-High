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
    
    @Attribute(.unique) var id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var imageName: String?
    var category: CategoryModel
    
    init(title: String, subtitle: String, text: String, imageName: String? = nil, category: CategoryModel) {
        self.title = title
        self.subtitle = subtitle
        self.text = text
        self.imageName = imageName
        self.category = category
    }
}
