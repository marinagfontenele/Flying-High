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
    @State var totalTasks: Int = 4
    @State var progress: Bool = true
    
    var body: some View {
        HStack {
            HStack {
                VStack (alignment: .leading, spacing: 15) {
                    HStack {
                        Text(title)
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .accessibilityHidden(true)
                        
                        Spacer(minLength: 0)
                        
                        if progress {
                            Text("\(doneTasks) / \(totalTasks)")
                                .font(.body)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .accessibilityLabel(Text("\(doneTasks) concluídas de \(totalTasks) no total"))
                        }
                    }
                    
                    Text(info)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .accessibilityLabel(Text("Tempo restante: \(info)"))
                }
                Spacer(minLength: 0)
//
//                if image {
//                    Image(systemName: "timer")
//                }
            }
            .padding(20)
            .background(Color(.purple), in: RoundedRectangle(cornerRadius: 15))
        }
        .padding(.horizontal, 16)
        .accessibilityLabel(Text("Card de progresso"))
    }
}

#Preview {
    ProgressCardView(doneTasks: 1)
}
