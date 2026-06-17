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
//            var localTasks: [TaskModel] = [
//                TaskModel(
//                    title: "Lavar a louça",
//                    category: .cleaning,
//                    room: nil,
//                    info: "Lavar e secar toda a louça do almoço.",
//                    estimatedTime: 900
//                ),
//                TaskModel(
//                    title: "Organizar guarda-roupa",
//                    category: .organization,
//                    room: nil,
//                    info: "Separar roupas para doação e dobrar o restante.",
//                    estimatedTime: 3600
//                ),
//                TaskModel(
//                    title: "Trocar lâmpada queimada",
//                    category: .repair,
//                    room: nil,
//                    info: "Substituir por uma lâmpada LED de 9W.",
//                    estimatedTime: 1800
//                ),
//                TaskModel(
//                    title: "Limpar janelas",
//                    category: .cleaning,
//                    room: nil,
//                    info: "Usar limpa-vidros e pano de microfibra.",
//                    estimatedTime: 1800
//                )
//            ]
//            
//            let mockSchedules: [ScheduleModel] = [
//                ScheduleModel(
//                    title: "Faxina Pesada de Sábado",
//                    tasks: [localTasks[0], localTasks[3]], // Lavar a louça e Limpar janelas
//                    category: .cleaning
//                ),
//                ScheduleModel(
//                    title: "Manutenção do Apartamento",
//                    tasks: [localTasks[2]], // Trocar lâmpada queimada
//                    category: .repair
//                ),
//                ScheduleModel(
//                    title: "Organização do Quarto",
//                    tasks: [localTasks[1]], // Organizar guarda-roupa
//                    category: .organization
//                ),
//                ScheduleModel(
//                    title: "Rotina Rápida Matinal",
//                    tasks: [localTasks[0]], // Lavar a louça
//                    category: .other
//                ),
//                ScheduleModel(
//                    title: "Planejamento Livre",
//                    tasks: nil,
//                    category: nil // Seu init vai transformar automaticamente em .none
//                )
//            ]
            let schedules: [ScheduleModel] = [ScheduleModel(title: "Limpeza da sala",
                                                            tasks:
                                                                [TaskModel(
                                                                    title: "Espanar",
                                                                    category: .cleaning,
                                                                    room: nil,
                                                                    info: "Espane todas as partes, atras dos moveis e nos cantos",
                                                                    estimatedTime: 1200
                                                                ),
                                                                 TaskModel(
                                                                    title: "Tirar os panos sujos do sofá",
                                                                    category: .cleaning,
                                                                    room: nil,
                                                                    info: "Não esqueça de depois de juntar tudo, colocar para lavar, separe as coloridas",
                                                                    estimatedTime: 120
                                                                 ),
                                                                 TaskModel(
                                                                    title: "Varrer ou aspirar o chão",
                                                                    category: .repair,
                                                                    room: nil,
                                                                    info: "Não esqueça de varrer em baixo de todos os moveis, dos tapetes, e no canteiros",
                                                                    estimatedTime: 600
                                                                 ),
                                                                 TaskModel(
                                                                    title: "Passar pano molhado no chão",
                                                                    category: .cleaning,
                                                                    room: nil,
                                                                    info: "Lembre-se de usar um desinfetante que goste, use um pano limpo, e um balde de agua",
                                                                    estimatedTime: 600
                                                                 ),
                                                                 TaskModel(
                                                                    title: "Lustrar moveis",
                                                                    category: .cleaning,
                                                                    room: nil,
                                                                    info: "Antes de lustrar os móveis, passe um pano seco para evitar manchas ou arranhões.\nCaso não tenha um lustra móveis em casa, você pode fazer um caseiro diluindo uma colher de sopa de amaciante em meio litro de água.",
                                                                    estimatedTime: 300
                                                                 ),
                                                                 TaskModel(
                                                                    title: "Colocar panos novos",
                                                                    category: .cleaning,
                                                                    room: nil,
                                                                    info: "Separe um conjunto novo da roupa de sofá e seja feliz",
                                                                    estimatedTime: 300
                                                                 ),
                                                                 TaskModel(
                                                                    title: "Passar aromatizador de ambiente",
                                                                    category: .cleaning,
                                                                    room: nil,
                                                                    info: "",
                                                                    estimatedTime: 180
                                                                 ),],
                                                            category: .cleaning),
                                              
                                              ScheduleModel(title: "Organização",
                                                            tasks: [
                                                                TaskModel(
                                                                    title: "Conferir dispensa",
                                                                    category: .organization,
                                                                    room: nil,
                                                                    info: "Anote tudo que tem e deixe num lugar fácil, e anote o que falta.",
                                                                    estimatedTime: 300),
                                                                TaskModel(
                                                                    title: "Tirar o lixo",
                                                                    category: .organization,
                                                                    room: nil,
                                                                    info: "",
                                                                    estimatedTime: 300),
                                                                TaskModel(
                                                                    title: "Guardar as roupas limpas",
                                                                    category: .organization,
                                                                    room: nil,
                                                                    info: "De preferência, separe as roupas por categoria para facilitar na hora de organizar e procurar elas nas gavetas.",
                                                                    estimatedTime: 1200),],
                                                            category: .organization),
                                              ScheduleModel(title: "Reparos",
                                                            tasks: [
                                                                TaskModel(
                                                                    title: "Ajeitar torneira da cozinha",
                                                                    category: .repair,
                                                                    room: nil,
                                                                    info: "",
                                                                    estimatedTime: 2400),
                                                                TaskModel(
                                                                    title: "Trocar a fechadura do banheio",
                                                                    category: .repair,
                                                                    room: nil,
                                                                    info: "",
                                                                    estimatedTime: 1800),
                                                                TaskModel(
                                                                    title: "Trocar lâmpadas",
                                                                    category: .repair,
                                                                    room: nil,
                                                                    info: "",
                                                                    estimatedTime: 1200),],
                                                            category: .repair)
            ]
            
//             let mockSchedules: [ScheduleModel] = [
//                 ScheduleModel(
//                     title: "Faxina Pesada de Sábado",
//                     tasks: [localTasks[0], localTasks[3]], // Lavar a louça e Limpar janelas
//                     category: .cleaning
//                 ),
//                 ScheduleModel(
//                     title: "Manutenção do Apartamento",
//                     tasks: [localTasks[2]], // Trocar lâmpada queimada
//                     category: .repair
//                 ),
//                 ScheduleModel(
//                     title: "Organização do Quarto",
//                     tasks: [localTasks[1]], // Organizar guarda-roupa
//                     category: .organization
//                 ),
//                 ScheduleModel(
//                     title: "Rotina Rápida Matinal",
//                     tasks: [localTasks[0]], // Lavar a louça
//                     category: .other
//                 ),
//                 ScheduleModel(
//                     title: "Planejamento Livre",
//                     tasks: [localTasks[0]],
//                     category: nil // Seu init vai transformar automaticamente em .none
//                 )
//             ]
            ContentView(schedules: schedules)
        }
    }
}
