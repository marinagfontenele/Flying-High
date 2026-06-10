//
//  ComponentCardView.swift
//
//
//  Created by Davi Carvalho Barbosa de Menezes on 09/06/26.
//

import SwiftUI


struct ScheduleCardView: View {
    @State var titleNumber: Int
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 18){
                Text("Título \(titleNumber)")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.text)
                    .accessibilityLabel(Text("Título do cronograma"))
                
                Label("x horas e y minutos", systemImage: "timer")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(.text)
                    .accessibilityLabel(Text("Duração do cronograma"))
                
                CategoryTagView()
            }
            
            
            Spacer(minLength: 0)
            
            NavigationLink (destination: EmptyView()){
                Label("Iniciar", systemImage: "play.fill")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(10)
                    .background(.main)
                    .clipShape(RoundedRectangle(cornerRadius: 1000))
            }
        }
        .padding(10)
        .background(.violet)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ScheduleCardView(titleNumber: 1)
}
