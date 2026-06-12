//
//  ContentView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 28/05/26.
//

import SwiftUI

struct ContentView: View {
    let mockSchedules: [ScheduleModel] = (2...5).map { i in
        ScheduleModel(title: "teste \(i)", totalTime: TimeInterval(1500 * i))
    }
    
    var body: some View {
        TabView {
            Tab("Cronograma", systemImage: "list.bullet.clipboard.fill") {
                ScheduleListView(schedules: mockSchedules)
            }
            Tab("Relatórios", systemImage: "chart.bar.xaxis") {
                ScheduleListView(schedules: mockSchedules)
            }
            Tab("Blog", systemImage: "info.circle") {
                ScheduleListView(schedules: mockSchedules)
            }
        }
        .tint(.main)
    }
}

#Preview {
    ContentView()
}
