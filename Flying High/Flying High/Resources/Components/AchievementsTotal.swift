//
//  AchievementsTotal.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 19/06/26.
//

import SwiftUI
import _SwiftData_SwiftUI

struct AchievementsTotal: View {
    @Query var taskList: [TaskModel]
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 6) {
                Text ("Total")
                    .font(.body)
                    .fontWeight(.semibold)
                
                Text("\(getTotalTasksDone()) ao todo!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding(.horizontal, 16)
            
            Spacer(minLength: 0)
            
            Image(systemName: "list.bullet.clipboard.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundStyle(.iconPurple)
                .padding(.vertical, 15)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.whiteCard)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .shadow, radius: 6, x: 2, y: 2)
    }
    
    func getTotalTasksDone() -> Int {
        var timesDone: Int = 0
        for task in taskList {
            timesDone += task.timesDone
        }
        
        return timesDone
    }
}


#Preview {
    AchievementsTotal()
}
