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
                        
                        Spacer(minLength: 0)
                        
                        CategoryTagView(category: category)
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
                    
                    if info == "" {
                        Text("Nenhuma informação adicionada")
                            .padding(.bottom, 16)
                            .padding(.horizontal, 16)
                    } else {
                        Text(info)
                            .padding(.bottom, 16)
                            .padding(.horizontal, 16)
                    }
                    
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
        .accessibilityElement(children: .combine)
    }
}

#Preview {
//    SheetTimerView()
}
