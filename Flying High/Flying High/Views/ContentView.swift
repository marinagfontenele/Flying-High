//
//  ContentView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 28/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Cronograma", systemImage: "list.bullet.clipboard.fill") {
                ScheduleListView()
            }
            Tab("Relatórios", systemImage: "chart.bar.xaxis") {
                ScheduleListView()
            }
            Tab("Blog", systemImage: "info.circle") {
                ScheduleListView()
            }
        }
        .tint(.main)
    }
}

#Preview {
    ContentView()
}
