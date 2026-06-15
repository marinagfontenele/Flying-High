//
//  CategoryTagView.swift
//  Flying High
//
//  Created by Davi Carvalho Barbosa de Menezes on 09/06/26.
//

import SwiftUI

struct CategoryTagView: View {
    var body: some View {
        Text("Limpeza")
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(.vertical, 1)
            .padding(.horizontal, 16)
            .background(.blueTag)
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .accessibilityLabel(Text("Categoria do cronograma"))
    }
}

#Preview {
    CategoryTagView()
}
