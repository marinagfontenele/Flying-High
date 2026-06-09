//
//  CardTaskView.swift
//  
//
//  Created by Marina Gomes Fontenele on 09/06/26.
//

import SwiftUI

struct CardTaskView: View {
    @State private var isEnabled = false
    
    var body: some View {
        HStack {
            
            VStack {
                Button {
                    
                } label: {
                    Image(systemName: "chevron.up")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                
                Spacer().frame(maxHeight: 10)
                
                ZStack {
                    Button {
                        isEnabled.toggle()
                    } label: {
                        if (isEnabled) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.title)
                                .fontWeight(.semibold)
                        } else {
                            Image(systemName: "circle")
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                    }
                }.padding(5)
                
                Spacer().frame(maxHeight: 10)
                
                Button {
                    
                } label: {
                    Image(systemName: "chevron.down")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
            }.padding(16)
            
            Spacer().frame(maxWidth: 15)
            
            HStack {
                VStack (alignment: .leading) {
                    Text("Nome da Tarefa")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Spacer().frame(height: 10)
                    
                    Label("30 minutos", systemImage: "timer")
                        .font(.body)
                        .fontWeight(.semibold)
                }
                Spacer()
                
                NavigationLink (destination: EmptyView() ) {
                    Label("Iniciar", systemImage: "play.fill")
                        .frame(width: 90, height: 40)
                        .background(Color(.blue), in: RoundedRectangle(cornerRadius: 296))
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
            }
            .padding(16)  //TODO: consertar padding
         //   .frame(maxWidth: 330)
            .background(Color(.systemGray6), in: RoundedRectangle(cornerRadius: 15))
        }
    }
}

#Preview {
    CardTaskView()
}
