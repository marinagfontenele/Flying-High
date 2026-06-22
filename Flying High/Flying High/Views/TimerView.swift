//
//  TimerView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 10/06/26.
//

import SwiftUI
import SwiftData

struct TimerView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var schedule: ScheduleModel
    
    var currentTask: TaskModel {
        schedule.tasks.first(where: { $0.isFinished == false })!
    }
    
    var currentTaskIndex: Int {
        schedule.tasks.firstIndex(where: { $0.id == currentTask.id }) ?? 0
    }
    
    var nextTaskExists: Bool {
        currentTaskIndex < schedule.tasks.count - 1
    }
    
    var nextTaskIndex: Int {
        schedule.tasks.firstIndex(where: { $0.isFinished == false && $0.id > currentTask.id}) ?? 0
    }
    
    var tasksFinished: Int {
        schedule.tasks.count(where: { $0.isFinished })
    }
    
    @State private var currentTaskTime: TimeInterval = 0
    @State private var currentTaskDate: Date = Date()
    
    @State private var activeAlert: TaskAlertType?
    
    @State private var isAlertPresented: Bool = false
    
    @State private var isRunning: Bool = false
    @State private var isPresented: Bool = false
    @State private var isEnabled: Bool = false
    @State private var isEnabled2: Bool = false
    @State private var navigation: Bool = false
    @State private var navigateToNextTask = false
    
    var body: some View {
        NavigationStack{
            VStack {
                ProgressCardView(title: "Em Progresso", info: currentTask.title, doneTasks: tasksFinished, totalTasks: schedule.tasks.count, progress: true)
                    .id(currentTaskIndex)
//                
//                Divider()
//                    .background(Color(.separator))
//                    .padding(.horizontal, 30)
//                
                if !isPresented {
                    HStack {
                        if nextTaskExists {
                            Text("Próxima Tarefa: \(schedule.tasks[nextTaskIndex].title)")
                                .font(.body)
                                .fontWeight(.semibold)
                                .accessibilityLabel(Text("Próxima tarefa: \(schedule.tasks[nextTaskIndex].title)"))
                        } else {
                            Text("Última Tarefa!")
                                .font(.body)
                                .fontWeight(.semibold)
                                .accessibilityLabel(Text("Última tarefa restante"))
                        }
                        Spacer(minLength: 0)
                    }
                    .padding(15)
                    .background(Color(.white), in: RoundedRectangle(cornerRadius: 15))
                    .padding(.horizontal, 16)
//                    .shadow(color: .shadow, radius: 6, x: 2, y: 2)
                }
                
                if !isPresented {
                    Spacer(minLength: 0)
                }
                
                TimerCardView(
                    onForwardPressed: {
                        activeAlert = .directNext(onConfirm: {
                            goToNextTask()
                        })
                        isAlertPresented = true
                    },
                    nextTaskExists: nextTaskExists,
                    isRunning: $isRunning,
                    elapsedTaskTime: $currentTaskTime
                )
                .id(currentTaskIndex)
                .accessibilityLabel(Text("Temporizador"))
                
                Spacer(minLength: 0)
                
                Button { //TODO: AJEITAR BUG DO botao - quando clica em finalizar o botão de play aparece ao inves do de pause 
                    isRunning = false
                    let finishAllAction = {
                        currentTask.isFinished = true
                        currentTask.durations.append(currentTaskTime)
                        dismiss()
                        dismiss()
                    }
                    if nextTaskExists {
                        activeAlert = .optionsMenu(onFinishAll: finishAllAction,onNextTask: {goToNextTask() })
                    } else {
                        activeAlert = .lastTask(onFinishAll: finishAllAction)
                    }
                    isAlertPresented = true
                    
                } label: {
                    Label("Finalizar Tarefa", systemImage: "checkmark")
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
            .animation(.default, value: isPresented)
            .background(Color.background
                .ignoresSafeArea())
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        activeAlert = .directNext(onConfirm: { goToNextTask() })
                    } label: {
                        Image(systemName: "chevron.backward")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "info")
                            .fontWeight(.semibold)
                    }
                    .buttonStyle(.glassProminent)
                    .tint(.main)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        .onChange(of: isRunning) { oldValue, newValue in
            schedule.tasks[currentTaskIndex].isActive = newValue
            print("Status '\(oldValue)' da tarefa alterado para: \(newValue)")
        }
        .sheet(isPresented: $isPresented) {
            NavigationStack {
                SheetTimerView()
            }
            .presentationDetents([.medium])
            .presentationBackground(Color(.systemBackground))
            .presentationBackgroundInteraction(.enabled)
        }
        .taskAlert(isAlertPresented: $isAlertPresented, type: activeAlert)
    }
    
    private func goToNextTask() {
        if nextTaskExists {
            isRunning = false
            schedule.tasks[currentTaskIndex].isFinished = true
            schedule.tasks[currentTaskIndex].durations.append(currentTaskTime)
            schedule.tasks[currentTaskIndex].dates.append(currentTaskDate)
            
            let completedTask = schedule.tasks[currentTaskIndex]
            
            print("Tarefa \(completedTask.title) concluída em \(completedTask.dates.last.formatDateString())")
            print("Último tempo de \(completedTask.title): \(completedTask.durations.last.formatToAbbreviated())")
            withAnimation{
                currentTaskTime = 0
            }
        } else {
            dismiss()
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
    var schedule = ScheduleModel(
        title: "Faxina Pesada de Sábado",
        tasks: mockedTasks,
        category: .cleaning
    )
    TimerView(schedule: schedule)
}
