//
//  TimerView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 10/06/26.
//

import SwiftUI

struct TimerView: View {
    var body: some View {
        VStack {
            CardProgressView(title: "Em Progresso", info: "Nome da Tarefa")
            
            HStack {
                Text("Próxima Tarefa: Comprar Pões")
                    .font(.body)
                
                Spacer(minLength: 0)
            }
            .padding(15)
            .background(Color(.violet), in: RoundedRectangle(cornerRadius: 15))
            .padding(.horizontal, 16)
                
            Spacer(minLength: 0)
            
            Text ("00 : 00 : 00")
                .font(Font.largeTitle.bold())
                .padding(20)
            
            HStack {
                Button{
                    
                } label: {
                    Circle()
                        .frame(maxWidth: 70, maxHeight: 60)
                        .overlay(alignment: .center) {
                            Image(systemName: "pause.fill")
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .padding(5)
                                .frame(maxWidth: 31)
                        }
                    
                }
                .tint(Color(.main))
                
                Button{
                    
                } label: {
                    Circle()
                        .frame(maxWidth: 70, maxHeight:60)
                        .overlay(alignment: .center) {
                            Image(systemName: "forward.end.fill")
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .padding(5)
                                
                        }
                }
                .tint(Color(.main))
            }
            
            Spacer(minLength: 0)
        }
        .background(Color.background
        .ignoresSafeArea())
    }
}

#Preview {
    TimerView()
}
