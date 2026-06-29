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
    @Query var taskList: [TaskModel]
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 6){
                Text ("\(category.title)")
                    .padding(.top, 18)
                    .padding(.horizontal, 16)
                    .font(.body)
                    .fontWeight(.semibold)
                    .accessibilityLabel(Text("Categoria: \(category.title)"))
                
                Text("\(getNumberTasks())")
                    .padding(16)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .accessibilityLabel(Text("Quantidade de Tarefas concluídas: \(getNumberTasks())"))
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
                    .accessibilityHidden(true)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.whiteCard)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .shadow, radius: 6, x: 2, y: 2)
        .accessibilityElement(children: .combine)
    }
    
    func getNumberTasks() -> Int {
        var timesDone: Int = 0
        for task in taskList {
            if task.category == category {
                timesDone += task.timesDone
            }
        }
        
        return timesDone
    }
}


#Preview {
    AchievementsCategoryView(category: CategoryModel.cleaning)
}
