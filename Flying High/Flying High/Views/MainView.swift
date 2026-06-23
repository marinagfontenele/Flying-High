//
//  ContentView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 28/05/26.
//

import SwiftUI
import SwiftData

struct MainView: View {
    var body: some View {
        TabView {
            Tab("Cronograma", systemImage: "list.bullet.clipboard.fill") {
                ScheduleListView()
            }
            Tab("Conquistas", systemImage: "rosette") {
                AchievementsView()
            }
            .accessibilityLabel(Text("Tela de conquistas"))
            Tab("Dicas", systemImage: "lightbulb.max") {
                TipsView()
            }
            .accessibilityLabel(Text("Tela de dicas"))
        }
        .tint(.main)
    }
}

#Preview {
    var localTasks: [TaskModel] = [
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
            estimatedTime: 1800
        ),
        TaskModel(
            title: "Limpar janelas",
            category: .cleaning,
            room: nil,
            info: "Usar limpa-vidros e pano de microfibra.",
            estimatedTime: 1800
        )
    ]
    
    let mockSchedules: [ScheduleModel] = [
        ScheduleModel(
            title: "Faxina Pesada de Sábado",
            tasks: [localTasks[0], localTasks[3], localTasks[2], localTasks[1]], // Lavar a louça e Limpar janelas
            category: .cleaning
        ),
        ScheduleModel(
            title: "Manutenção do Apartamento",
            tasks: [localTasks[2]], // Trocar lâmpada queimada
            category: .repair
        ),
        ScheduleModel(
            title: "Organização do Quarto",
            tasks: [localTasks[1]], // Organizar guarda-roupa
            category: .organization
        ),
        ScheduleModel(
            title: "Rotina Rápida Matinal",
            tasks: [localTasks[0]], // Lavar a louça
            category: .other
        ),
        ScheduleModel(
            title: "Planejamento Livre",
            tasks: [localTasks[0]],
            category: nil // Seu init vai transformar automaticamente em .none
        )
    ]
    MainView()
}
