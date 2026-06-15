//
//  ComponentCardView.swift
//
//
//  Created by Davi Carvalho Barbosa de Menezes on 09/06/26.
//

import SwiftUI
import SwiftData


struct ScheduleCardView: View {
    @State var titleNumber: Int
    
    @State var schedule: ScheduleModel
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 18){
                Text(schedule.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.text)
                    .accessibilityLabel(Text("Título do cronograma"))
                
                Label(schedule.formatTimeExtended(), systemImage: "timer")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(.text)
                    .accessibilityLabel(Text("Duração do cronograma"))
                
                CategoryTagView(category: schedule.category!)
            }
            
            
            Spacer(minLength: 0)
            
            NavigationLink (destination: ScheduleView(tasks: schedule.tasks!)){
                Label("Iniciar", systemImage: "play.fill")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(10)
                    .background(.main)
                    .clipShape(RoundedRectangle(cornerRadius: 1000))
            }
        }
        .padding(10)
        .background(.violet)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    var mockedTasks: [TaskModel] = [
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
    
    let schedule = ScheduleModel(title: "testeeeee", totalTime: 9999, tasks: mockedTasks, category: CategoryModel.repair)
    ScheduleCardView(titleNumber: 1, schedule: schedule)
    
}
