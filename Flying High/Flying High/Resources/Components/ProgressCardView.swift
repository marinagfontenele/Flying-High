//
//  Card.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 10/06/26.
//

import SwiftUI

struct ProgressCardView: View {
    @State private var isEnabled = false
    @State var title: String = "Tempo Restante"
    var info: String = "30 minutos"
    var doneTasks: Int
    var totalTasks: Int = 4
    @State var progress: Bool = true
    
    var body: some View {
        HStack {
            HStack {
                VStack (alignment: .leading, spacing: 15) {
                    HStack {
                        Text(title)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.text)
                            .accessibilityHidden(true)
                        
                        Spacer(minLength: 0)
                        
                        if progress {
                            Text("\(doneTasks) / \(totalTasks)")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.text)
                                .accessibilityLabel(Text("Tarefas concluídas: \(doneTasks) concluídas de \(totalTasks) no total"))
                        }
                    }
            
                    Text(info)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.text)
                        .accessibilityLabel(Text(getLabelString()))
                }
                Spacer(minLength: 0)
            }
            .padding(20)
            .background(Color(.whiteCard), in: RoundedRectangle(cornerRadius: 15))
        }
        .padding(.horizontal, 16)
        .shadow(color: .shadow, radius: 6, x: 2, y: 2)
        .accessibilityElement(children: .combine)
    }
    
    func getLabelString () -> String {
        var labelString: String
        
        if progress {
            labelString = "Tarefa atual: \(info)"
        } else {
            labelString = "Tempo restante: \(info)"
        }
        
        return labelString
    }
}

#Preview {
    ProgressCardView(doneTasks: 1)
}
