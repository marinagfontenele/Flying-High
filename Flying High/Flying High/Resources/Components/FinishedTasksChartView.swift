//
//  FinishedTasksChartView.swift
//  Flying High
//
//  Created by Davi Carvalho Barbosa de Menezes on 12/06/26.
//

import SwiftUI
import Charts

struct FinishedTasksChartView: View {
    let data = [
        (name: "Metas alcançadas", metas: 39),
        (name: "Metas não alcançadas", metas: 20)
    ]
    
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading){
                    Text("Tarefas concluídas")
                        .font(.body)
                        .fontWeight(.semibold)
                    let total = data.map(\.metas).reduce(0, +)
                    Text("\(total)")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .foregroundStyle(.text)
                
                Spacer()
            }
            
            Chart(data, id: \.name) { name, sales in
                    SectorMark(
                        angle: .value("Value", sales),
                        innerRadius: .ratio(0.618),
                        outerRadius: .inset(10),
                        angularInset: 1
                    )
                    .cornerRadius(8)
                    .foregroundStyle(by: .value("Product category", name))
                }
        }
        
    }
}

#Preview {
    FinishedTasksChartView()
}
