//
//  Flying_HighApp.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 28/05/26.
//

import SwiftUI
import SwiftData

@main
struct Flying_HighApp: App {
    @Environment(\.modelContext) private var modelContext
 
    var body: some Scene {
        
        WindowGroup {
            MainView()
                .modelContainer(for: [ArticleModel.self, RoomModel.self, ScheduleModel.self, TaskModel.self])
        }
    }
}
