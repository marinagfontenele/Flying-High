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
                    timeGoal: 10000000
                ),
                TaskModel(
                    title: "oiiiii 2",
                    info: "",
                    timeGoal: 600
                )],
            timeTest: 10000000 + 600,
            category: CategoryModel.cleaning,
            room: RoomModel(title: "Banheiro")
        )]
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack {
                    ForEach(scheduleList) { schedule in
                        ScheduleCardView(schedule: schedule)
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
