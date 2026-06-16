//
//  TimerView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 10/06/26.
//

import SwiftUI

struct TimerView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var schedule: ScheduleModel
    var index: Int = 3
    
    @State private var isPaused: Bool = false
    @State private var isPresented: Bool = false
    @State private var isEnabled: Bool = false
    @State private var isEnabled2: Bool = false
    @State private var navigation: Bool = false
    @State private var navigateToNextTask = false
    
    var body: some View {
        
        var task: TaskModel {
            schedule.tasks[index]
        }
        
        NavigationStack{
            VStack {
                CardProgressView(title: "Em Progresso", info: task.title, progress: false)
                
                if !isPresented {
                        HStack {
                            if index != schedule.tasks.count - 1 {
                                Text("Próxima Tarefa: \(schedule.tasks[index+1].title)")
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
                
                // TODO: ajeitar o timer quebrando quando a sheet abre
                TimerCardView()
                
                Spacer(minLength: 0)
                
                Button {
                    isEnabled.toggle()
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
                .confirmationAlert(
                    isPresented: $isEnabled,
                    onFinishAll: {
                        dismiss()
                        dismiss()
                    },
                    onNextTask: {
                        navigateToNextTask = true
                    }
                )
                .navigationDestination(isPresented: $navigateToNextTask) {
                    EmptyView()
                }
                
            }
            .animation(.default, value: isPresented)
            .background(Color.background
                .ignoresSafeArea())
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                Button{
                    isEnabled2.toggle()
                } label: {
                    Image(systemName: "chevron.backward")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
                .tint(.white)
                .alert("Tem certeza de que deseja finalizar essa tarefa?", isPresented: $isEnabled2, actions: {
                    HStack {
                        Button("Cancelar", role: .cancel) {
                            //    dismiss()
                        }
                        .tint(.black)
                        .foregroundStyle(Color(.systemGray2))
                        
                        Button("Finalizar") {
                            dismiss()
                            dismiss()
                        }
                        .buttonStyle(.glassProminent)
                        .tint(.main)
                    }
                }, message: {
                    Text("Após finalizada, a tarefa não poderá mais ser retomada.")
                })
            }
            
            ToolbarItem(placement: .navigationBarTrailing){
                Button{
                    isPresented.toggle()
                } label: {
                    Image(systemName: "info")
                        .fontWeight(.semibold)
                }
                .buttonStyle(.glassProminent)
                .tint(.main)
                .sheet(isPresented: $isPresented){
                    NavigationStack {
                        SheetTimerView()
                    }
                    .presentationDetents([.medium])
                    .presentationBackground(Color(.systemBackground))
                    .presentationBackgroundInteraction(.enabled)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
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
