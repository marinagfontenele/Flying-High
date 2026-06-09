//
//  ScheduleListView.swift
//  Flying High
//
//  Created by Davi Carvalho Barbosa de Menezes on 09/06/26.
//

import SwiftUI

struct ScheduleListView: View {
//    var schedule_list: [Schedule] = []
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.background
                .ignoresSafeArea()
                
                List {
                    ScheduleCardView()
                    ScheduleCardView()
                    ScheduleCardView()
                }
                .listRowSeparator(.visible)
                .listStyle(.plain)
                    .navigationTitle("Cronogramas")
            }
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
    }
}

#Preview {
    ScheduleListView()
}
