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
                        .accessibilityLabel(Text("Título do cronograma"))
                    
                    Label(schedule.totalTime.formatToAbbreviated(), systemImage: "timer")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundStyle(.text)
                        .accessibilityLabel(Text("Duração do cronograma"))
                    
                    CategoryTagView(category: schedule.category!)
                }
                
                Spacer(minLength: 0)
                
                Image(systemName: "chevron.right")
            }
            .padding(10)
            .background(.violet)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .opacity(schedule.isFinished ? 0.6 : 1.0)
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
