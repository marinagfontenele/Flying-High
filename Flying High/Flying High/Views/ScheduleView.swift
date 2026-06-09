//
//  ScheduleView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 09/06/26.
//

import SwiftUI

struct ScheduleView: View {
    var body: some View {
        VStack {
            CardTaskView()
            Spacer().frame(maxHeight: 8)
            
            CardTaskView()
            Spacer().frame(maxHeight: 8)
            
            CardTaskView()
            Spacer().frame(maxHeight: 8)
            
            CardTaskView()
            Spacer().frame(maxHeight: 8)
            
        }
        .padding()
    }
}

#Preview {
    ScheduleView()
}
