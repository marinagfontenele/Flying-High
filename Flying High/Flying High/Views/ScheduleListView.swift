//
//  ScheduleListView.swift
//  Flying High
//
//  Created by Davi Carvalho Barbosa de Menezes on 09/06/26.
//

import SwiftUI

struct ScheduleListView: View {
    @State var scheduleList: [ScheduleModel] = [
        ScheduleModel(
            title: "Lavar banheiro",
            tasks: [
                TaskModel(
                    title: "oiiiii 1",
                    info: "",
                    estimatedTime: 1800
                ),
                TaskModel(
                    title: "oiiiii 2",
                    info: "",
                    estimatedTime: 600
                )],
            totalTime: 1800 + 600,
            category: CategoryModel.cleaning
        )]
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack {
                    ForEach(scheduleList) { schedule in
                        NavigationLink(destination: TaskListView(taskList: schedule.tasks)){
                            ScheduleCardView(schedule: schedule)
                        }
                    }
                    .navigationTitle("Cronogramas")
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                }
                .padding(.top, 10)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            
                        } label: {
                            Image(systemName: "plus")
                                .fontWeight(.semibold)
                        }
                        .buttonStyle(.glassProminent)
                        .tint(.main)
                    }
                }
            }
            .background(Color.background
                .ignoresSafeArea())
        }
    }
}

#Preview {
    ScheduleListView()
}
