//
//  ComponentCardView.swift
//  
//
//  Created by Davi Carvalho Barbosa de Menezes on 09/06/26.
//

import SwiftUI

struct ScheduleCardView: View {
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 18){
                Text("Título")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.text)
                HStack{
                    Image(systemName: "timer")
                        .foregroundStyle(.text)
                        .fontWeight(.semibold)
                    Text("x horas e y minutos")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundStyle(.text)
                }
                
                CategoryTagView()
            }
            
            Spacer()
            
            Button {
                
            } label: {
                HStack{
                    Image(systemName: "play.fill")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    Text("Iniciar")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
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
    ScheduleCardView()
}
