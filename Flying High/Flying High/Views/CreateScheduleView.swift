//
//  ScheduleFormsView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 23/07/26.
//

import SwiftUI
import SwiftData

struct CreateScheduleView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var name: String = ""
    @State var tasks: Int = 0
    @State var selectedCategory: CategoryModel = .cleaning
    
    var body: some View {
            Form {
                Section(header: Text("Nome do Cronograma:")) {
                    TextField("Digite o nome", text: $name)
                }
                
                //            Section(header: Text("Número de tarefas")){
                //                HStack{
                //                    Text("Quantidade atual: \(tasks)")
                //
                //                    Stepper(
                //                        "",
                //                        value: $tasks,
                //                        in: 0 ... 25,
                //                        step: 1
                //                    ).foregroundStyle(.main)
                //                }
                //            }
                
                Section(header: Text("Categoria do Cronograma:")) {
                    Picker("Selecionada", selection: $selectedCategory) {
                        ForEach(CategoryModel.allCases, id: \.self) { category in
                            Text(category.title)
                        }
                    }
                    .pickerStyle(.menu)
                    .accentColor(.main)
                }
                
//                if #available(iOS 26.0, *) {
//                    Button("Criar Tarefa", systemImage: "plus") {
//                        
//                    }
//                    .background(Color(.main))
//                    .clipShape(Capsule())
//                    .buttonStyle(.borderless)
//                } else {
//                    Button("Criar Tarefa", systemImage: "plus") {
//                        
//                    }
//                    .buttonStyle(.borderedProminent)
//                    .tint(.main)
//                }
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
                    .disabled(name.isEmpty)
                    .tint(.main)
                    .accessibilityLabel(Text("Salvar receita"))
                    .accessibilityHint(Text("Para salvar a receita, é obrigatório adicionar um nome e digitá-la na caixa de texto"))
                    .accessibilityValue(name.isEmpty ? "Desabilitado" : "Habilitado")
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
            .navigationTitle("Criar Cronograma")
            .toolbarTitleDisplayMode(.inline)
            
            
    }
}

#Preview {
    CreateScheduleView()
}
