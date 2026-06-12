//
//  ScheduleView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 09/06/26.
//

import SwiftUI

struct ScheduleView: View {
    
    var tasks: [TaskModel]
    
    var body: some View {
        NavigationStack {
            VStack {
                CardProgressView()
                    .padding(.vertical, 16)
                
                ZStack (alignment: .bottom){
                    Spacer(minLength: 0)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(tasks){ task in
                            CardTaskView(task: task)
                                .padding(.top, 10)
                        }
                        .padding(.bottom,100)
                        
//                        CardTaskView()
//                            .padding(.top, 10)
//                        
//                        CardTaskView()
//                            .padding(.top, 10)
//                        
//                        CardTaskView()
//                            .padding(.top, 10)
//                        
//                        CardTaskView()
//                            .padding(.top, 10)
//                        
//                        CardTaskView()
//                            .padding(.top, 10)
//                        
//                        CardTaskView()
//                            .padding(.top, 10)
//                        
//                        CardTaskView()
//                            .padding(.top, 10)
//                            .padding(.bottom, 100)
                    }
                    
                    
                    Spacer(minLength: 0)
                    
                    NavigationLink(destination: EmptyView()) {
                        Label("Iniciar Bloco", systemImage: "play.fill")
                            .frame(maxWidth: .infinity)
                            .padding(16)
                            .font(.title2)
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            
                    }
                    .buttonStyle(.glassProminent)
                    .tint(.main)
                    .padding(.horizontal, 16)
                }
            }
            .background(Color.background
            .ignoresSafeArea())
            .toolbarVisibility(.hidden, for: .tabBar)
        }
    }
}

#Preview {
    var mockedTasks: [TaskModel] = [
        TaskModel(
            title: "Lavar a louça",
            category: .cleaning,
            room: nil,
            info: "Lavar e secar toda a louça do almoço.",
            estimatedTime: 900
        ),
        TaskModel(
            title: "Organizar guarda-roupa",
            category: .organization,
            room: nil,
            info: "Separar roupas para doação e dobrar o restante.",
            estimatedTime: 3600
        ),
        TaskModel(
            title: "Trocar lâmpada queimada",
            category: .repair,
            room: nil,
            info: "Substituir por uma lâmpada LED de 9W.",
            estimatedTime: nil
        ),
        TaskModel(
            title: "Limpar janelas",
            category: .cleaning,
            room: nil,
            info: "Usar limpa-vidros e pano de microfibra.",
            estimatedTime: 1800
        )
    ]
    ScheduleView(tasks: mockedTasks)
}
