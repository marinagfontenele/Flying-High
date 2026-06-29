//
//  TaskAlertModifier.swift
//  Flying High
//
//  Created by Ulisses Bonfim on 16/06/26.
//

import SwiftUI

enum TaskAlertType: Identifiable {
    case goBack(onSave: () -> Void, skipSave: () -> Void)
    case optionsMenu(onFinishAll: () -> Void, onNextTask: () -> Void)
    case directNext(onConfirm: () -> Void)
    case lastTask(onFinishAll: () -> Void)
    
    var id: String {
        switch self {
        case .goBack:
            return "goBack"
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
    
    private var alertTitle: String {
        switch alertType {
            case .goBack:
                return "Deseja sair da tarefa?"
            default :
                return "Tem certeza de que deseja finalizar essa tarefa?"
        }
    }
    
    private var alertMessage: String {
        switch alertType {
        case .goBack:
            return "Você pode salvar o tempo atual ou descartar a tarefa."
        default :
            return "Após finalizar, a tarefa não poderá mais ser retomada."
        }
    }
    
    func body(content: Content) -> some View {
        content
            .disabled(isAlertPresented)
            .alert(alertTitle, isPresented: $isAlertPresented) {
                alertButtons
            } message: {
                Text(alertMessage)
            }
    }
    
    @ViewBuilder
    private var alertButtons: some View {
        switch alertType {
        case .goBack(let onSave, let skipSave):
            Button("Cancelar", role: .cancel) { }
                .tint(.black)
            
            if #available(iOS 26.0, *) {
                Button("Salvar e sair", action: onSave)
                    .buttonStyle(.glassProminent)
                    .tint(.main)
            } else {
                Button("Salvar e sair", action: onSave)
                    .tint(.main)
            }
                
            Button("Sair sem salvar", role: .destructive, action: skipSave)

        case .optionsMenu(let onFinishAll, let onNextTask):
            Button("Cancelar", role: .cancel) { }
                .tint(.black)
            
            if #available(iOS 26.0, *) {
                Button("Terminar e ir para a tela inicial", action: onFinishAll)
                    .buttonStyle(.glassProminent)
                    .tint(.main)
            } else {
                Button("Terminar e ir para a tela inicial", action: onFinishAll)
                    .tint(.main)
            }
            
            if #available(iOS 26.0, *) {
                Button("Terminar e ir para a próxima tarefa", action: onNextTask)
                    .buttonStyle(.glassProminent)
                    .tint(.main)
            } else {
                Button("Terminar e ir para a próxima tarefa", action: onNextTask)
                    .tint(.main)
            }
            
        case .directNext(let onConfirm):
            Button("Cancelar", role: .cancel) { }
                .tint(.black)
                .foregroundStyle(Color(.systemGray2))
            
            if #available(iOS 26.0, *) {
                Button("Finalizar", action: onConfirm)
                    .buttonStyle(.glassProminent)
                    .tint(.main)
            } else {
                Button("Finalizar", action: onConfirm)
                    .tint(.main)
            }
            
        case .lastTask(let onFinishAll):
            Button("Cancelar", role: .cancel) { }
                .tint(.black)
                .foregroundStyle(Color(.systemGray2))
            
            if #available(iOS 26.0, *) {
                Button("Finalizar cronograma", action: onFinishAll)
                    .buttonStyle(.glassProminent)
                    .tint(.main)
            } else {
                Button("Finalizar cronograma", action: onFinishAll)
                    .tint(.main)
            }
            
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
