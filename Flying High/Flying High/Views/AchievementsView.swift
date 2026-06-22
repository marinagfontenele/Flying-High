//
//  AchievementsView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 19/06/26.
//

import SwiftUI

struct AchievementsView: View {
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack {
                    AchievementsTime()
                        .padding(.horizontal, 16)
                    
                    HStack {
                        Text("Tarefas Concluídas")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 16)
                            .padding(.horizontal, 16)
                        
                        Spacer(minLength: 0)
                    }
                    
                    AchievementsWinnerView(category: .cleaning)
                        .padding(.bottom, 16)
                        .padding(.horizontal, 16)
                    
                    HStack {
                        VStack (spacing: 16){
                            AchievementsCategoryView(category: .cleaning)
                            
                            AchievementsCategoryView(category: .repair)
                        }
                        .padding(.horizontal, 16)
                        
                        AchievementsOrganizationView(category: .organization)
                            .padding(.trailing, 16)
                    }
                    
                    AchievementsTotal()
                        .padding(16)
                }
                .padding(.vertical, 16)
            }
            .navigationTitle("Minhas Conquistas")
            .background(Color.background
                .ignoresSafeArea())
        }
        
    }
}

#Preview {
    AchievementsView()
}
