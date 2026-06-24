//
//  SheetTimerView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 11/06/26.
//

import SwiftUI

struct SheetTimerView: View {
    @Environment(\.dismiss) var dismiss
    @State var room: String = "Banheiro"
    @State var category: CategoryModel = CategoryModel.cleaning
    @State var info: String
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack (spacing: 3){
                    HStack {
                        Text("Cômodo:")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Text(room)
                            .font(.title3)
                            .accessibilityLabel(Text("Cômodo"))
                            .accessibilityValue(Text(room))
                        
                        Spacer(minLength: 0)
                        
                        CategoryTagView(category: category)
                            .accessibilityLabel(Text("Categoria"))
                            .accessibilityValue(Text(category.title))
                    }
                    
                    .padding(16)
                    
                    HStack {
                        Text("Informações adicionais:")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Spacer(minLength: 0)
                    }
                    .padding(.bottom, 12)
                    .padding(.horizontal, 16)
                    
                    Text(info)
                        .padding(.bottom, 16)
                        .padding(.horizontal, 16)
                }
                
                Spacer(minLength: 0)
            }
            .navigationTitle("Detalhes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(role: .cancel) {
                        dismiss()
                    }
                    .tint(.main)
                }
            }
        }
    }
}

#Preview {
//    SheetTimerView()
}
