//
//  AchievementsWinnerView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 19/06/26.
//

import SwiftUI

struct AchievementsWinnerView: View {
    var category: CategoryModel
    @State var numberTasks: Int = 10
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text("As tarefas que você mais realizou foram as de \(category.title)!")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 16)
                    .padding(.trailing, 20)
                
                Spacer(minLength: 0)
                
                category.medal
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 110)
                    .fontWeight(.bold)
                    .padding(.leading, 16)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(.whiteCard)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .shadow, radius: 6, x: 2, y: 2)
    }
}


#Preview {
    AchievementsWinnerView(category: CategoryModel.cleaning)
}
