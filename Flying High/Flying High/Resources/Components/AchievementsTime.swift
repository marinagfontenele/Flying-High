//
//  AchievementsTime.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 22/06/26.
//

import SwiftUI
import _SwiftData_SwiftUI

struct AchievementsTime: View {
    @Query(filter: #Predicate<TaskModel> {$0.isFinished == true}) var taskList: [TaskModel]
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text ("Tempo realizando tarefas")
                    .padding(.top, 16)
                    .padding(.bottom, 8)
                    .padding(.horizontal, 16)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text(getTimeSpent().formatToAbbreviated())
                    .padding(16)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.iconPurple)
            }
            
            Spacer(minLength: 0)
            
            Image(systemName: "clock.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundStyle(.iconPurple)
                .padding(20)
            
        }
        .frame(maxWidth: .infinity, maxHeight: 150)
        .background(.whiteCard)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .shadow, radius: 6, x: 2, y: 2)
    }
    
    func getTimeSpent () -> TimeInterval {
        var timeSpent: TimeInterval = 0
        
        for task in taskList {
            for taskDuration in task.durations {
                timeSpent += taskDuration
            }
        }
        
        return timeSpent
    }
}


#Preview {
//    AchievementsTime()
}
