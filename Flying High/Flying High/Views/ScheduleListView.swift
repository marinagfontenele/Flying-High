//
//  ScheduleListView.swift
//  Flying High
//
//  Created by Davi Carvalho Barbosa de Menezes on 09/06/26.
//

import SwiftUI
import SwiftData

struct ScheduleListView: View {
    var schedules: [ScheduleModel]
    var titleNumber: [Int] = [1, 2, 3]
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack {
                    //                    var schedule = ScheduleModel(title: "teste", totalTime: 3999)
                    ForEach(schedules) { schedule in
                        ScheduleCardView(titleNumber: 1, schedule: schedule)
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
    let mockSchedules: [ScheduleModel] = [
        ScheduleModel(title: "Apenas zeros", totalTime: 0), // "00:00"
        
        // 2. Menos de 1 hora (Apenas minutos)
        ScheduleModel(title: "Apenas 1 minuto", totalTime: 60), // "00:01"
        ScheduleModel(title: "45 minutos", totalTime: 2700), // 45 * 60 -> "00:45"
        
        // 3. Exatamente 1 hora
        ScheduleModel(title: "Exatamente 1 hora", totalTime: 3600), // "01:00"
        
        // 4. Horas e minutos combinados (1h e 1min)
        ScheduleModel(title: "1h e 1min", totalTime: 3660), // 3600 + 60 -> "01:01"
        
        // 5. Tempo longo aleatório
        ScheduleModel(title: "Tempo longo", totalTime: 18420),
        
        ScheduleModel(title: "Tempo longo", totalTime: 18060)
    ]
    
    ScheduleListView(schedules: mockSchedules)
}
