//
//  AchievementsView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 19/06/26.
//

import SwiftUI
import _SwiftData_SwiftUI

struct AchievementsView: View {
    @Query var taskList: [TaskModel]
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack {
                    AchievementsTime()
                        .padding(.horizontal, 16)
                    
                    HStack {
                        Text("Tarefas Concluídas")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 16)
                            .padding(.horizontal, 16)
                            .accessibilityLabel(Text("Informações sobre conclusão de tarefas"))
                        
                        Spacer(minLength: 0)
                    }
                    
                    VStack (spacing: 16) {
                        AchievementsWinnerView()
                            .padding(.horizontal, 16)
                        HStack (spacing: 16){
                            VStack (spacing: 16){
                                AchievementsCategoryView(category: .cleaning)
                                
                                AchievementsCategoryView(category: .repair)
                            }
                            .padding(.leading, 16)
                            
                            AchievementsOrganizationView(category: .organization)
                                .padding(.trailing, 16)
                        }
                        
                        AchievementsTotal()
                            .padding(.horizontal, 16)
                    }
                }
                .padding(.vertical, 16)
            }
            .navigationTitle("Minhas Conquistas")
            .background(Color.background
                .ignoresSafeArea())
        }
    }
    
    func calculateTimeSpent () -> TimeInterval{
        var timeSpent: TimeInterval = 0
        for task in taskList {
            if task.isFinished {
                for duration in task.durations {
                    timeSpent += duration
                }
            }
        }
        
        return timeSpent
    }
}

#Preview {
    AchievementsView()
}
