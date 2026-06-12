//
//  CardTaskView.swift
//
//
//  Created by Marina Gomes Fontenele on 09/06/26.
//

import SwiftUI

struct CardTaskView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isEnabled = false
    
    var body: some View {
        HStack {
            
            VStack (spacing: 8){
                Button {
                    
                } label: {
                    Image(systemName: "chevron.up")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.main)
                }
                
                Button {
                    isEnabled.toggle()
                } label: {
                    if (isEnabled) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.main)
                    } else {
                        Image(systemName: "circle")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.main)
                    }
                }
                .padding(5)
                .alert("Tem certeza de que deseja finalizar essa tarefa?", isPresented: $isEnabled, actions: {
                    HStack {
                        Button("Cancelar", role: .cancel) {
                            
                        }
                        .tint(.black)
                        
                        Button("Finalizar") {
                            
                        }
                        .buttonStyle(.glassProminent)
                        .tint(.main)
                    }
                }, message: {
                    Text("Após finalizada, a tarefa não poderá mais ser retomada.")
                })
                
                Button {
                    
                } label: {
                    Image(systemName: "chevron.down")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.main)
                    
                }
            }
            
            Spacer(minLength: 0)
            
            HStack {
                VStack (alignment: .leading, spacing: 15) {
                    Text("Nome da Tarefa")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Label("30 minutos", systemImage: "timer")
                        .font(.body)
                        .fontWeight(.semibold)
                    
                }
                Spacer(minLength: 0)
                
//                NavigationLink (destination: TimerView() ) {
//                    Label("Iniciar", systemImage: "play.fill")
//                        .padding(10)
//                        .background(Color(.main), in: RoundedRectangle(cornerRadius: 296))
//                        .foregroundStyle(.white)
//                        .fontWeight(.semibold)
//                }
                
            }
            .padding(20)
            .background(Color(.violet), in: RoundedRectangle(cornerRadius: 15))
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    CardTaskView()
}
