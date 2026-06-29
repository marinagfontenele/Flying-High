//
//  ComponentCardView.swift
//
//
//  Created by Davi Carvalho Barbosa de Menezes on 09/06/26.
//

import SwiftUI
import SwiftData


struct ScheduleCardView: View {
    @State var schedule: ScheduleModel
    
    var body: some View {
        NavigationLink (destination: ScheduleView(schedule: schedule)) {
            HStack {
                VStack (alignment: .leading, spacing: 18){
                    Text(schedule.title)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.text)
                        .accessibilityLabel(Text("Cronograma: \(schedule.title)"))
                    
                    Label(schedule.totalTime.formatToAbbreviated(), systemImage: "timer")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundStyle(.text)
                        .accessibilityLabel(Text("Tempo estimado: \(schedule.totalTime.formatToAbbreviated())"))
                    
                    CategoryTagView(category: schedule.category!)
                }
                
                Spacer(minLength: 0)
                
                Image(systemName: "chevron.right")
                    .accessibilityHidden(true)
            }
            .padding(10)
            .background(.violet)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .accessibilityHint(Text("Clique para visualizar as tarefas do cronograma"))
        .accessibilityElement(children: .combine)
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
        )
    ]
    
    let schedule = ScheduleModel(title: "Cronograma Teste", tasks: mockedTasks, category: CategoryModel.repair)
    
    // Para testar o visual finalizado no preview:
//     schedule.tasks[0].isFinished = true
    
    ScheduleCardView(schedule: schedule)
}
