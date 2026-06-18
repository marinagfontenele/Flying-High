//
//  TimerView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 10/06/26.
//

import SwiftUI

struct TimerView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var schedule: ScheduleModel
    @State private var currentTaskIndex: Int = 0
    
    var currentTask: TaskModel {
        schedule.tasks[currentTaskIndex]
    }
    
    var nextTaskExists: Bool {
        currentTaskIndex + 1 < schedule.tasks.count
    }
    
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
                CardProgressView(title: "Em Progresso", info: currentTask.title, progress: false)
                    .id(currentTaskIndex)
                
                if !isPresented {
                    HStack {
                        if nextTaskExists {
                            Text("Próxima Tarefa: \(schedule.tasks[currentTaskIndex + 1].title)")
                                .font(.body)
                                .fontWeight(.semibold)
                        }
                        else {
                            Text("Última Tarefa!")
                                .font(.body)
                                .fontWeight(.semibold)
                            
                        }
                        Spacer(minLength: 0)
                    }
                    .padding(15)
                    .background(Color(.violet), in: RoundedRectangle(cornerRadius: 15))
                    .padding(.horizontal, 16)
                    
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
                    isRunning: $isRunning
                )
                .id(currentTaskIndex)
                
                Spacer(minLength: 0)
                
                Button { //TODO: AJEITAR BUG DO botao
                    isRunning = false
                    let finishAllAction = {
                        currentTask.isFinished = true
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
            print("Status '\(oldValue) da tarefa alterado para: \(newValue)")
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
            currentTask.isFinished = true
            withAnimation{
                currentTaskIndex += 1
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
