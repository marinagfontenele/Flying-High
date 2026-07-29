//
//  CreateTaskView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 28/07/26.
//

import SwiftUI
import SwiftData

struct CreateTaskView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var name: String = ""
    @State var info: String = ""
    @State var tasks: Int = 0
    @State var hours: Int = 0
    @State var minutes: Int = 0
    @State var selectedCategory: CategoryModel = .cleaning
    
    var body: some View {
        Form {
            Section(header: Text("Nome da Tarefa*")) {
                TextField("Digite o nome", text: $name)
            }
            
            Section(header: Text("Tempo Estimado*")){
                HStack {
                    Picker("", selection: $hours){
                        ForEach(0..<11, id: \.self) { i in
                            Text("\(i)").tag(i)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    
                    Text ("horas")
                    
                    Picker("", selection: $minutes){
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
                Picker("Selecionada", selection: $selectedCategory) {
                    ForEach(CategoryModel.allCases, id: \.self) { category in
                        Text(category.title)
                    }
                }
                .pickerStyle(.menu)
                .accentColor(.main)
            }
            
            Section (header: Text("Informações Adicionais")){
                ZStack(alignment: .leading) {
                    if info.isEmpty {
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
                        TextEditor(text: $info)
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
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    dismiss()
                }
                label: {
                    Image(systemName: "checkmark")
                }
                .buttonStyle(.borderedProminent)
                .disabled(name.isEmpty || (hours == 0 && minutes == 0))
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
        .navigationTitle("Criar Tarefa")
        .toolbarTitleDisplayMode(.inline)
    }
}

#Preview {
    CreateTaskView()
}
