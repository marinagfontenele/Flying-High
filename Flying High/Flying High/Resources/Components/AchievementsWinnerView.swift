//
//  AchievementsWinnerView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 19/06/26.
//

import SwiftUI
import _SwiftData_SwiftUI

struct AchievementsWinnerView: View {
    @Query(filter: #Predicate<TaskModel> {$0.isFinished == true}) var taskList: [TaskModel]
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                let winner: CategoryModel = getWinnerCategory()
                
                if winner == .none || winner == .other {
                    Text("Conclua tarefas para definirmos a categoria vencedora!")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 16)
                        .padding(.trailing, 20)
                } else {
                    Text("As tarefas que você mais realizou foram as de \(winner.title)!")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 16)
                        .padding(.trailing, 20)
                }
        
                Spacer(minLength: 0)
                
                winner.medal
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 110)
                    .fontWeight(.bold)
                    .padding(.leading, 16)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(.whiteCard)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .shadow, radius: 6, x: 2, y: 2)
    }
    
    func getWinnerCategory () -> CategoryModel {
        var organizationTasks: [TaskModel] = []
        var cleaningTasks: [TaskModel] = []
        var repairTasks: [TaskModel] = []
        
        for task in taskList {
            switch task.category {
            case .cleaning:
                cleaningTasks.append(task)
            case .repair:
                repairTasks.append(task)
            case .organization:
                organizationTasks.append(task)
            case .none:
                return .none
            case .other:
                return .other
            }
        }
        
        print(cleaningTasks.count)
        
        let winnerAmount: Int = [cleaningTasks.count, repairTasks.count, organizationTasks.count].max() ?? 0
        
        
        switch winnerAmount {
        case 0:
            print("oi4")
            return .none
        case cleaningTasks.count:
            print("oii1")
            return .cleaning
        case repairTasks.count:
            print("oii2")
            return .repair
        case organizationTasks.count:
            print("oi3")
            return .organization
        default:
            print("oi5")
            return .none
        }
    }
}


#Preview {
    AchievementsWinnerView()
}
