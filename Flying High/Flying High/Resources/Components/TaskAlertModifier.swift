//
//  TaskAlertModifier.swift
//  Flying High
//
//  Created by Ulisses Bonfim on 16/06/26.
//

import SwiftUI

struct TaskAlertModifier: ViewModifier {
    @Binding var isPresented: Bool
    var onCancel: () -> Void
    var onFinishAll: () -> Void
    var onNextTask: () -> Void
    
    func body(content: Content) -> some View {
        content
            .alert("Tem certeza de que deseja finalizar essa tarefa?", isPresented: $isPresented) {
                VStack {
                    Button("Cancelar", role: .cancel) {
                        onCancel()
                    }
                    .tint(.black)
                    
                    Button("Finalizar e voltar para a tela inicial") {
                        onFinishAll()
                    }
                    .buttonStyle(.glassProminent)
                    .tint(.main)
                    
                    NavigationLink(destination: EmptyView()) {
                        Button("Finalizar e passar para a próxima tarefa") {
                            onNextTask()
                        }
                        .buttonStyle(.glassProminent)
                        .tint(.main)
                    }
                }
            } message: {
                Text("Após finalizada, a tarefa não poderá mais ser retomada.")
            }
    }
}

extension View {
    func confirmationAlert(
        isPresented: Binding<Bool>,
        onCancel: @escaping () -> Void = {},
        onFinishAll: @escaping () -> Void,
        onNextTask: @escaping () -> Void
    ) -> some View {
        self.modifier(TaskAlertModifier(
            isPresented: isPresented,
            onCancel: onCancel,
            onFinishAll: onFinishAll,
            onNextTask: onNextTask
        ))
    }
}
