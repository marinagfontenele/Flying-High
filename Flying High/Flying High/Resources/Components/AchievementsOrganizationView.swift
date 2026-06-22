//
//  AchievementsOrganizationView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 19/06/26.
//

import SwiftUI

struct AchievementsOrganizationView: View {
    var category: CategoryModel
    @State var numberTasks: Int = 10
    
    var body: some View {
        VStack {
            
            Image(systemName: category.iconSymbol)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .padding(16)
                .foregroundStyle(category.iconColor)
            
            HStack{
                Text ("\(category.title)")
                    .padding(.top, 18)
                    .padding(.horizontal, 16)
                    .font(.body)
                    .fontWeight(.semibold)
                
                Spacer(minLength: 0)
            }
            
            HStack {
                Text("\(numberTasks)")
                    .padding(16)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer(minLength: 0)
            }
        }
        .frame(maxWidth: 150, maxHeight: 285)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .shadow, radius: 6, x: 2, y: 2)
    }
}

#Preview {
    AchievementsOrganizationView(category: CategoryModel.organization)
}
