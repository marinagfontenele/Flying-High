//
//  Flying_HighApp.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 28/05/26.
//

import SwiftUI

@main
struct Flying_HighApp: App {
    var body: some Scene {
        WindowGroup {
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
                    estimatedTime: nil
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
                    totalTime: 5400, // 1h 30m (900s + 1800s + extra)
                    tasks: [localTasks[0], localTasks[3]], // Lavar a louça e Limpar janelas
                    category: .cleaning
                ),
                ScheduleModel(
                    title: "Manutenção do Apartamento",
                    totalTime: 600, // 10 minutos
                    tasks: [localTasks[2]], // Trocar lâmpada queimada
                    category: .repair
                ),
                ScheduleModel(
                    title: "Organização do Quarto",
                    totalTime: 3600, // 1 hora
                    tasks: [localTasks[1]], // Organizar guarda-roupa
                    category: .organization
                ),
                ScheduleModel(
                    title: "Rotina Rápida Matinal",
                    totalTime: 900, // 15 minutos
                    tasks: [localTasks[0]], // Lavar a louça
                    category: .other
                ),
                ScheduleModel(
                    title: "Planejamento Livre",
                    totalTime: nil,
                    tasks: nil,
                    category: nil // Seu init vai transformar automaticamente em .none
                )
            ]
            ContentView(schedules: mockSchedules)
        }
    }
}
