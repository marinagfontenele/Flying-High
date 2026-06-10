//
//  ScheduleView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 09/06/26.
//

import SwiftUI

struct ScheduleView: View {
    var body: some View {
        NavigationStack {
            VStack {
                CardProgressView()
                
                Spacer(minLength: 0)
                
                CardTaskView()
                    .padding(.top, 10)
                
                CardTaskView()
                    .padding(.top, 10)
                
                CardTaskView()
                    .padding(.top, 10)
                
                CardTaskView()
                    .padding(10)
                    .padding(.bottom, 100)
                
                Spacer(minLength: 0)
                
                NavigationLink(destination: EmptyView()) {
                    Label("Iniciar Bloco", systemImage: "play.fill")
                        .font(.title2)
                         .padding(15)
                        .padding(.horizontal, 70)
                        .background(Color(.blue), in: RoundedRectangle(cornerRadius: 296))
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .frame(alignment: .init(horizontal: .center, vertical: .center))
                }
                
            }
        }
    }
}

#Preview {
    ScheduleView()
}
