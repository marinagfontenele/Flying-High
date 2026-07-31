//
//  EditTaskView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 29/07/26.
//

import SwiftUI
import SwiftData

struct EditTaskView: View {
    
    @Environment(\.dismiss) var dismiss
    @Query var tasks : [TaskModel]
    @State var schedule: ScheduleModel
    
    @State var titleEdit: String = ""
    @State var infoEdit: String = ""
   // @State var tasksEdit: Int = 0
    @State var hoursEdit: Int = 0
    @State var minutesEdit: Int = 0
    @State var categoryEdit: CategoryModel = .cleaning
    
    var currentTask: TaskModel {
        schedule.tasks.first(where: { $0.isFinished == false }) ?? TaskModel(title: "Nenhuma", category: .cleaning, info: "", estimatedTime: 0)
    }
    
    var body: some View {
        Form {
            Section(header: Text("Nome da Tarefa*")) {
                TextField("Digite o nome", text: $titleEdit)
            }
            
            Section(header: Text("Tempo Estimado*")){
                HStack {
                    Picker("", selection: $hoursEdit){
                        ForEach(0..<11, id: \.self) { i in
                            Text("\(i)").tag(i)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    
                    Text ("horas")
                    
                    Picker("", selection: $minutesEdit){
                        ForEach(0..<60, id: \.self) { i in
                            Text("\(i)").tag(i)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    
                    Text ("min")
                }
                .padding(.horizontal)
            }
            .frame(maxHeight: 120)
            
            Section(header: Text("Categoria da Tarefa")) {
                Picker("Selecionada", selection: $categoryEdit) {
                    ForEach(CategoryModel.allCases, id: \.self) { category in
                        Text(category.title)
                    }
                }
                .pickerStyle(.menu)
                .accentColor(.main)
            }
            
            Section (header: Text("Informações Adicionais")){
                ZStack(alignment: .leading) {
                    if infoEdit.isEmpty {
                        VStack {
                            Text("Digite a informação")
                                .padding(.top, 10)
                                .padding(.leading, -1)
                                .foregroundColor(Color.secondary.opacity(0.45))
                                .fontWeight(.regular)
                                .font(.body)
                                .accessibilityHidden(true)
                            
                            Spacer(minLength: 20)
                        }.zIndex(1)
                            .preferredColorScheme(.light)
                    }
                    
                    VStack {
                        TextEditor(text: $infoEdit)
                            .frame(minHeight: 60)
                            .padding(.horizontal, -5)
                            .accessibilityLabel(Text("Digite sua receita"))
                        
                        Spacer()
                    }
                    .zIndex(0)
                    .preferredColorScheme(.light)
                }
            }
        }
        .onAppear {
            titleEdit = currentTask.title
         //   minutesEdit = currentTask.minutes
          //  hoursEdit = currentTask.hours
            categoryEdit = currentTask.category
          //  infoEdit = currentTask.info
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    dismiss()
                }
                label: {
                    Image(systemName: "checkmark")
                }
                .buttonStyle(.borderedProminent)
                .disabled(titleEdit.isEmpty || (hoursEdit == 0 && minutesEdit == 0))
                .tint(.main)
                .accessibilityLabel(Text("Salvar receita"))
                .accessibilityHint(Text("Para salvar a receita, é obrigatório adicionar um nome e digitá-la na caixa de texto"))
                .accessibilityValue(titleEdit.isEmpty ? "Desabilitado" : "Habilitado")
                }
            
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    dismiss()
                }
                label: {
                    Image(systemName: "xmark")
                }
            }
        }
        .navigationTitle("Editar Tarefa")
        .toolbarTitleDisplayMode(.inline)
    }
}

#Preview {
  //  EditTaskView()
}
