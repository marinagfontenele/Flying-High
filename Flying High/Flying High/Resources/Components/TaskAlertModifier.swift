//
//  TaskAlertModifier.swift
//  Flying High
//
//  Created by Ulisses Bonfim on 16/06/26.
//

import SwiftUI

enum TaskAlertType: Identifiable {
    case optionsMenu(onFinishAll: () -> Void, onNextTask: () -> Void)
    case directNext(onConfirm: () -> Void)
    case lastTask(onFinishAll: () -> Void)
    
    var id: String {
        switch self {
        case .optionsMenu:
            return "optionsMenu"
        case .directNext:
            return "directNext"
        case .lastTask:
            return "lastTask"
        }
    }
}

struct TaskAlertModifier: ViewModifier {
    @Binding var isAlertPresented: Bool
    let alertType: TaskAlertType?
    
    func body(content: Content) -> some View {
        content
            .disabled(isAlertPresented)
            .alert(alertTitle, isPresented: $isAlertPresented) {
                alertButtons
            } message: {
                Text("Após finalizada, a tarefa não poderá mais ser retomada.")
            }
    }
    
    private var alertTitle: String {
        "Tem certeza de que deseja finalizar essa tarefa?"
    }
    
    @ViewBuilder
    private var alertButtons: some View {
        switch alertType {
        case .optionsMenu(let onFinishAll, let onNextTask):
            Button("Cancelar", role: .cancel) { }
                .tint(.black)
            
            Button("Terminar e ir para a tela inicial", action: onFinishAll)
                .buttonStyle(.glassProminent)
                .tint(.main)
            
            Button("Terminar e ir para a próxima tarefa", action: onNextTask)
                .buttonStyle(.glassProminent)
                .tint(.main)
            
        case .directNext(let onConfirm):
            Button("Cancelar", role: .cancel) { }
                .tint(.black)
                .foregroundStyle(Color(.systemGray2))
            
            Button("Finalizar", action: onConfirm)
                .buttonStyle(.glassProminent)
                .tint(.main)
            
        case .lastTask(let onFinishAll):
            Button("Cancelar", role: .cancel) { }
                .tint(.black)
                .foregroundStyle(Color(.systemGray2))
            
            Button("Finalizar cronograma", action: onFinishAll)
                .buttonStyle(.glassProminent)
                .tint(.main)
            
        case .none:
            EmptyView()
        }
    }
    
}

extension View {
    func taskAlert(isAlertPresented: Binding<Bool>, type: TaskAlertType?) -> some View {
        self.modifier(TaskAlertModifier(isAlertPresented: isAlertPresented, alertType: type))
    }
}
