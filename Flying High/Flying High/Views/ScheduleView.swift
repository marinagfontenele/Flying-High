//
//  ScheduleView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 09/06/26.
//

import SwiftUI

struct ScheduleView: View {
    
    @Bindable var schedule: ScheduleModel
    @State var presentTaskSheet: Bool = false
    @State var isDeleting: Bool = false
    @State var presentEditSheet: Bool = false
    
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
                    
                    List {
                        ForEach(schedule.tasks){ task in
                            TaskCardView(task: task)
                                .padding(.top, 10)
                                .listRowBackground(EmptyView())
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                .swipeActions (edge: .trailing, allowsFullSwipe: false) {
                                    Button("Excluir", systemImage: "trash") {
                                        isDeleting.toggle()
                                    }
                                    .tint(Color.red)
                                    
                                    Button("Editar", systemImage: "pencil") {
                                        presentEditSheet.toggle()
                                    }
                                    .tint(.main)
                                }
//                            
//                                .sheet(item: $presentEditSheet) { task in
//                                    NavigationStack {
//                                    //    EditView(recipe: recipe)
//                                    }
//                                    .presentationSizing(.page)
//                                }
                            
//                                .alert("Excluir receita", isPresented: $isDeleting, actions: {
//                                    HStack {
//                                        Button("Cancelar", role: .cancel) {
//                                        }
//                                        
//                                        Button("Excluir", role: .destructive) {
//                                        }
//                                    }
//                                }, message: {
//                                    Text("Tem certeza que deseja excluir essa receita?")
//                                })
                        }
                        .onDelete { schedule.tasks.remove(atOffsets: $0) }
                        .padding(.bottom, 10)
                        
                    }
                    .listStyle(.plain)
                    .toolbar {
                        EditButton()
                            .tint(Color(.main))
                    }
                    
                    Spacer(minLength: 0)
                    
                    if schedule.isFinished{
                        if #available(iOS 26.0, *) {
                            Button{
                                withAnimation{
                                    schedule.resetTasks()
                                }
                            } label: {
                                Label("Reiniciar Cronograma", systemImage: "arrow.clockwise")
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
                            Button{
                                withAnimation{
                                    schedule.resetTasks()
                                }
                            } label: {
                                Label("Reiniciar Cronograma", systemImage: "arrow.clockwise")
                                    .frame(maxWidth: .infinity)
                                    .padding(16)
                                    .font(.title2)
                                    .foregroundStyle(.white)
                                    .fontWeight(.bold)
                            }
                            .tint(.main)
                            .padding(.horizontal, 16)
                        }
                    } else {
                        if #available(iOS 26.0, *) {
                            NavigationLink(destination: TimerView(schedule: schedule)) {
                                Label("Iniciar Cronograma", systemImage: "play.fill")
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
                            .tint(.main)
                            .padding(.horizontal, 16)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button ("", systemImage: "plus") {
                        presentTaskSheet.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.main)
                    .accessibilityLabel(Text("Adicionar tarefa"))
                    .sheet(isPresented: $presentTaskSheet) {
                        NavigationStack {
                            CreateTaskView()
                        }
                        .presentationSizing(.page)
                    }
                }
            }
            .background(Color.background
            .ignoresSafeArea())
            .toolbarVisibility(.hidden, for: .tabBar)
            .navigationTitle(schedule.title)
            .navigationBarTitleDisplayMode(.inline)
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
