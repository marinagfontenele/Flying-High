//
//  ChartView.swift
//  Flying High
//
//  Created by Davi Carvalho Barbosa de Menezes on 12/06/26.
//

import SwiftUI

struct ChartView: View {
    @State private var selection: String = "Semana"
    var body: some View {
        VStack (spacing: 40){
            Picker("Período", selection: $selection) {
                Text("Semana").tag("Semana")
                Text("Total").tag("Total")
            }
            .pickerStyle(.segmented)
            
            VStack {
                FinishedTasksChartView()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 18)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding(.horizontal, 16)
        .toolbarVisibility(.hidden, for: .tabBar)
        .background(Color.background
            .ignoresSafeArea())
    }
}

#Preview {
    ChartView()
}
