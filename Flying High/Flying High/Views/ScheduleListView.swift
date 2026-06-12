//
//  ScheduleListView.swift
//  Flying High
//
//  Created by Davi Carvalho Barbosa de Menezes on 09/06/26.
//

import SwiftUI
import SwiftData

struct ScheduleListView: View {
    var titleNumber: [Int] = [1, 2, 3]
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack {
                    var schedule = ScheduleModel(title: "teste", totalTime: 3999)
                    ForEach(titleNumber, id: \.self) { number in
                        ScheduleCardView(titleNumber: number, schedule: schedule)
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
//                .background(Color.background
//                .ignoresSafeArea())
        }
    }
}

#Preview {
    ScheduleListView()
}
