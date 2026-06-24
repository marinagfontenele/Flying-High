//
//  CardTaskView.swift
//
//
//  Created by Marina Gomes Fontenele on 09/06/26.
//

import SwiftUI
import SwiftData

struct TaskCardView: View {
    @State private var isAlertPresented: Bool = false
    @State private var activeAlert: TaskAlertType?
    @Bindable var task: TaskModel
    
    var body: some View {
        HStack {
            VStack (spacing: 8){
                Button {
                    activeAlert = .directNext(onConfirm: {
                        withAnimation(.easeOut) {
                            task.isFinished = true
                            task.timesDone += 1
                        }
                    })
                    isAlertPresented = true
                    
                } label: {
                    Image(systemName: task.isFinished ? "checkmark.circle.fill" : "circle")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.main)
                        .accessibilityLabel("Marcar \(task.title) como concluído")
                        .accessibilitySortPriority(1)
                }
                .disabled(task.isFinished)
                .padding(5)
            }
            Spacer(minLength: 0)
            
            HStack {
                VStack (alignment: .leading, spacing: 15) {
                    Text(task.title)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .accessibilityLabel(Text("Tarefa: \(task.title)"))
                        .accessibilitySortPriority(2)
                        
                    if (task.isFinished == false) {
                        Label("Estimativa: \(task.estimatedTime.formatToAbbreviated())", systemImage: "timer")
                            .font(.body)
                            .fontWeight(.semibold)
                            .accessibilitySortPriority(2)
                    } else {
                        Text("Concluída")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .accessibilitySortPriority(2)
                        
                    }
                }
                Spacer(minLength: 0)
            }
            .padding(20)
            .background(Color(.violet), in: RoundedRectangle(cornerRadius: 15))
        }
        .opacity(task.isFinished ? 0.5 : 1)
        .padding(.horizontal, 16)
        .taskAlert(isAlertPresented: $isAlertPresented, type: activeAlert)
        .accessibilityElement(children: .combine)
    }
}

#Preview {
    let taskTest = TaskModel(
        title: "Limpar janelas",
        category: CategoryModel.cleaning,
        room: nil,
        info: "Usar limpa-vidros e pano de microfibra.",
        estimatedTime: 4800
    )
    
    TaskCardView(task: taskTest)
}
