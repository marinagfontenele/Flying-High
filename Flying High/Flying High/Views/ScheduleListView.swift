//
//  ScheduleListView.swift
//  Flying High
//
//  Created by Davi Carvalho Barbosa de Menezes on 09/06/26.
//

import SwiftUI
import SwiftData

struct ScheduleListView: View {
    var schedules: [ScheduleModel]
    var titleNumber: [Int] = [1, 2, 3]
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack {
                    //                    var schedule = ScheduleModel(title: "teste", totalTime: 3999)
                    ForEach(schedules) { schedule in
                        ScheduleCardView(titleNumber: 1, schedule: schedule)
                    }
                    .navigationTitle("Cronogramas")
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                }
                .padding(.top, 10)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            
                        } label: {
                            Image(systemName: "plus")
                                .fontWeight(.semibold)
                        }
                        .buttonStyle(.glassProminent)
                        .tint(.main)
                    }
                }
            }
            .background(Color.background
                .ignoresSafeArea())
        }
    }
}

#Preview {
    var localTasks: [TaskModel] = [
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
            estimatedTime: 1800
        ),
        TaskModel(
            title: "Limpar janelas",
            category: .cleaning,
            room: nil,
            info: "Usar limpa-vidros e pano de microfibra.",
            estimatedTime: 1800
        )
    ]
    
    let mockSchedules: [ScheduleModel] = [
        ScheduleModel(
            title: "Faxina Pesada de Sábado",
            tasks: [localTasks[0], localTasks[3]], // Lavar a louça e Limpar janelas
            category: .cleaning
        ),
        ScheduleModel(
            title: "Manutenção do Apartamento",
            tasks: [localTasks[2]], // Trocar lâmpada queimada
            category: .repair
        ),
        ScheduleModel(
            title: "Organização do Quarto",
            tasks: [localTasks[1]], // Organizar guarda-roupa
            category: .organization
        ),
        ScheduleModel(
            title: "Rotina Rápida Matinal",
            tasks: [localTasks[0]], // Lavar a louça
            category: .other
        ),
        ScheduleModel(
            title: "Planejamento Livre",
            tasks: nil,
            category: nil // Seu init vai transformar automaticamente em .none
        )
    ]
    
    ScheduleListView(schedules: mockSchedules)
    
}
