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
                
                ZStack (alignment: .bottom){
                    Spacer(minLength: 0)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        CardTaskView()
                            .padding(.top, 10)
                        
                        CardTaskView()
                            .padding(.top, 10)
                        
                        CardTaskView()
                            .padding(.top, 10)
                        
                        CardTaskView()
                            .padding(.top, 10)
                        
                        CardTaskView()
                            .padding(.top, 10)
                        
                        CardTaskView()
                            .padding(.top, 10)
                        
                        CardTaskView()
                            .padding(.top, 10)
                            .padding(.bottom, 100)
                    }
                    
                    
                    Spacer(minLength: 0)
                    
                    NavigationLink(destination: EmptyView()) {
                        Label("Iniciar Bloco", systemImage: "play.fill")
                            .frame(maxWidth: .infinity)
                            .padding(16)
                            .font(.title2)
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            
                    }
                    .buttonStyle(.glassProminent)
                    .tint(.main)
                    .padding(.horizontal, 16)
                }
            }
            .background(Color.background
            .ignoresSafeArea())
        }
    }
}

#Preview {
    ScheduleView()
}
