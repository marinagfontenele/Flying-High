//
//  AchievementsWinnerView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 19/06/26.
//

import SwiftUI
import _SwiftData_SwiftUI

struct AchievementsWinnerView: View {
    @Query var taskList: [TaskModel]
    
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
        var organizationTasks: Int = 0
        var cleaningTasks: Int = 0
        var repairTasks: Int = 0
        
        for task in taskList {
            switch task.category {
            case .cleaning:
                cleaningTasks += task.timesDone
            case .repair:
                repairTasks += task.timesDone
            case .organization:
                organizationTasks += task.timesDone
            case .none:
                return .none
            case .other:
                return .other
            }
        }
        
        let winnerAmount: Int = [cleaningTasks, repairTasks, organizationTasks].max() ?? 0
        
        switch winnerAmount {
        case 0:
            return .none
        case cleaningTasks:
            return .cleaning
        case repairTasks:
            return .repair
        case organizationTasks:
            return .organization
        default:
            return .none
        }
    }
}


#Preview {
    AchievementsWinnerView()
}
