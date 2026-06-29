//
//  ScheduleView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 09/06/26.
//

import SwiftUI

struct ScheduleView: View {
    
    @Bindable var schedule: ScheduleModel
    
    var tasksFinished: Int {
        schedule.tasks.count(where: { $0.isFinished })
    }
    
    var timer: TimeInterval = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                ProgressCardView(info:schedule.remainingTimeString ,doneTasks: tasksFinished, totalTasks: schedule.tasks.count)
                    .id(tasksFinished)
                    .padding(.vertical, 16)
                
                ZStack (alignment: .bottom){
                    Spacer(minLength: 0)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(schedule.tasks){ task in
                            TaskCardView(task: task)
                                .padding(.top, 10)
                        }
                        .padding(.bottom,100)
                        
                    }
                    
                    Spacer(minLength: 0)
                    
                    if schedule.isFinished{
                        Button{
                            withAnimation{
                                schedule.resetTasks()
                            }
                        } label: {
                            Label("Habilitar Bloco", systemImage: "arrow.clockwise")
                                .frame(maxWidth: .infinity)
                                .padding(16)
                                .font(.title2)
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                        }
                        .buttonStyle(.glassProminent)
                        .tint(.main)
                        .padding(.horizontal, 16)
                    } else {
                        NavigationLink(destination: TimerView(schedule: schedule)) {
                            Label("Iniciar Cronograma", systemImage: "play.fill")
                                .frame(maxWidth: .infinity)
                                .padding(16)
                                .font(.title2)
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                        }
                        .opacity(0.9)
                        .buttonStyle(.glassProminent)
                        .tint(.main)
                        .padding(.horizontal, 16)
                    }
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
            estimatedTime: 1860
        ),
        TaskModel(
            title: "Limpar janelas",
            category: .cleaning,
            room: nil,
            info: "Usar limpa-vidros e pano de microfibra.",
            estimatedTime: 1800
        )
    ]
    var schedule = ScheduleModel(
        title: "Faxina Pesada de Sábado",
        tasks: [mockedTasks[0], mockedTasks[1], mockedTasks[2], mockedTasks[3]], // Lavar a louça e Limpar janelas
        category: .cleaning
    )
    ScheduleView(schedule: schedule)
}
