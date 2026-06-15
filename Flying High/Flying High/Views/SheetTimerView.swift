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
    @State var category: CategoryModel = .cleaning
    @State var info: String = "Vivamus erat quam, auctor vitae ligula ut, rhoncus ullamcorper erat. Sed velit metus, facilisis at mi vehicula, blandit mollis erat. Fusce elementum ipsum nec consectetur dictum. Praesent non sem et dui molestie condimentum. Donec placerat dignissim luctus. Nam ex ligula, tempor sit amet massa ac, sodales dictum magna. Quisque posuere, velit ut tristique commodo, arcu mi commodo metus, eget tempor est arcu a nibh. Phasellus gravida placerat ante ac feugiat. Sed suscipit non nisi nec pellentesque. Aliquam eget malesuada orci, in dignissim lacus. In ut viverra arcu. Aenean rutrum rhoncus sapien, sed volutpat ipsum condimentum quis. Sed eleifend risus ut tempor molestie. Quisque et ullamcorper sem. Etiam quis elementum elit. Aliquam hendrerit sapien eros, sed fermentum quam congue a. Aliquam mattis pretium mollis."
    
    
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
    SheetTimerView()
}
