//
//  AchievementsOrganizationView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 19/06/26.
//

import SwiftUI
import _SwiftData_SwiftUI

struct AchievementsOrganizationView: View {
    @State var category: CategoryModel = CategoryModel.organization
    @Query var taskList: [TaskModel]
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: category.iconSymbol)
                .resizable()
                .scaledToFit()
                .frame(width: 95, height: 95)
                .padding(.horizontal, 16)
                .foregroundStyle(category.iconColor)
                .accessibilityHidden(true)
            
            HStack {
                VStack (alignment: .leading, spacing: 6){
                    Text ("\(category.title)")
                        .font(.body)
                        .fontWeight(.semibold)
                        .accessibilityLabel(Text("Categoria: \(category.title)"))
                    Text("\(getNumberTasks())")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .accessibilityLabel(Text("Quantidade de Tarefas concluídas: \(getNumberTasks())"))
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 16)
                Spacer()
            }
        }
        .frame(maxWidth: 150, maxHeight: .infinity)
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
//    AchievementsOrganizationView(category: CategoryModel.organization)
}
