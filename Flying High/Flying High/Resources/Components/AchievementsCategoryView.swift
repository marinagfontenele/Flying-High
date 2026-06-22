//
//  AchievementsCategoryView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 17/06/26.
//

import SwiftUI

struct AchievementsCategoryView: View {
    var category: CategoryModel
    @State var numberTasks: Int = 10
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text ("\(category.title)")
                    .padding(.top, 18)
                    .padding(.horizontal, 16)
                    .font(.body)
                    .fontWeight(.semibold)
                
                Spacer(minLength: 0)
            }
            Spacer(minLength: 0)
            
            HStack {
                Text("\(numberTasks)")
                    .padding(16)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer(minLength: 0)
                
                Image(systemName: category.iconSymbol)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .padding(16)
                    .foregroundStyle(category.iconColor)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 130)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .shadow, radius: 6, x: 2, y: 2)
    }
}


#Preview {
    AchievementsCategoryView(category: CategoryModel.cleaning)
}
