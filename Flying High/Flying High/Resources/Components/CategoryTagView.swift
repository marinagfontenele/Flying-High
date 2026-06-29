//
//  CategoryTagView.swift
//  Flying High
//
//  Created by Davi Carvalho Barbosa de Menezes on 09/06/26.
//

import SwiftUI

struct CategoryTagView: View {
    
    var category: CategoryModel
    var body: some View {
        Text(category.title)
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundColor(.categoryText)
            .padding(.vertical, 1)
            .padding(.horizontal, 16)
            .background(category.iconColor)
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .accessibilityLabel(Text("Categoria: \(category.title)"))
    }
}

#Preview {
    var category = CategoryModel.organization
    CategoryTagView(category: category)
}
