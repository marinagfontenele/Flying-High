//
//  ScheduleView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 09/06/26.
//

import SwiftUI

struct TaskListView: View {
    let taskList: [TaskModel]
    
    var body: some View {
        NavigationStack {
            VStack {
                let timeLeft = calculateTimeLeft(taskList: taskList)
                CardProgressView(timeLeft: timeLeft)
                    .padding(.vertical, 16)
                
                ZStack (alignment: .bottom){
                    Spacer(minLength: 0)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(taskList) { task in
                            CardTaskView(task: task, timeLeft: timeLeft)
                                .padding(.top, 10)
                        }
                        .padding(.bottom, 100)
                    }
                    
                    
                    Spacer(minLength: 0)
                    
                    NavigationLink(destination: TimerView(nextTask: taskList[0].title, timeLeft: timeLeft)) {
                        Label("Iniciar Bloco", systemImage: "play.fill")
                            .frame(maxWidth: .infinity)
                            .padding(16)
                            .font(.title2)
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                        
                    }
                    .buttonStyle(.glassProminent)
                    .tint(.main)
                    .padding(.horizontal, 16)
                }
            }
            .background(Color.background
                .ignoresSafeArea())
            .toolbarVisibility(.hidden, for: .tabBar)
        }
    }
    
    func calculateTimeLeft(taskList: [TaskModel]) -> String {
        var timeLeft: TimeInterval = 0
        for task in taskList {
            timeLeft += task.timeGoal
            //            print(timeGoal)
        }
        
        return timeLeft.stringFormatted()
    }
}

#Preview {
//    TaskListView(taskList: [TaskModel(title: "oiiiii 1",
//                            info: "",
//                            timeGoal: 1800)])
}
