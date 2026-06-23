//
//  AchievementsCategoryView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 17/06/26.
//

import SwiftUI
import _SwiftData_SwiftUI

struct AchievementsCategoryView: View {
    var category: CategoryModel
    @Query(filter: #Predicate<TaskModel> {$0.isFinished == true}) var taskList: [TaskModel]
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 6){
                Text ("\(category.title)")
                    .padding(.top, 18)
                    .padding(.horizontal, 16)
                    .font(.body)
                    .fontWeight(.semibold)
                
                Text("\(getNumberTasks())")
                    .padding(16)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            
            Spacer()

            VStack {
                Spacer()
                Image(systemName: category.iconSymbol)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .padding(16)
                    .foregroundStyle(category.iconColor)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.whiteCard)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .shadow, radius: 6, x: 2, y: 2)
    }
    
    func getNumberTasks() -> Int {
        var categoryTasks: [TaskModel] = []
        for task in taskList {
            if task.category == category {
                categoryTasks.append(task)
            }
        }
        return categoryTasks.count
    }
}


#Preview {
    AchievementsCategoryView(category: CategoryModel.cleaning)
}
