//
//  ComponentCardView.swift
//
//
//  Created by Davi Carvalho Barbosa de Menezes on 09/06/26.
//

import SwiftUI


struct ScheduleCardView: View {
    let schedule: ScheduleModel
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 18){
                Text("Título \(schedule.title)")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.text)
                    .accessibilityLabel(Text("Título do cronograma"))
                
                let timeGoal = calculateTimeGoal(taskList: schedule.tasks)
                
                Label("\(timeGoal)", systemImage: "timer")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(.text)
                    .accessibilityLabel(Text("Duração do cronograma"))
                
                CategoryTagView(category: schedule.category)
            }
            
            
            Spacer(minLength: 0)
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.main)
            
//            NavigationLink (destination: TaskListView(taskList: schedule.tasks)){
//                Label("Iniciar", systemImage: "play.fill")
//                    .font(.body)
//                    .fontWeight(.semibold)
//                    .foregroundStyle(.white)
//                    .padding(10)
//                    .background(.main)
//                    .clipShape(RoundedRectangle(cornerRadius: 1000))
//            }
        }
        .padding(10)
        .background(.violet)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    func calculateTimeGoal(taskList: [TaskModel]) -> String {
        var timeGoal: TimeInterval = 0
        for task in taskList {
            timeGoal += task.timeGoal
//            print(timeGoal)
        }
        
        return timeGoal.stringFormatted()
    }
}

#Preview {
    ScheduleCardView(schedule: ScheduleModel(title: "Lavar banheiro", tasks: [TaskModel(title: "oiiiii 1", info: "", timeGoal: 1800), TaskModel(title: "oiiiii 2", info: "", timeGoal: 600)], timeTest: 1800 + 600, category: CategoryModel.cleaning, room: RoomModel(title: "Banheiro")))
}
