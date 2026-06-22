//
//  AchievementsTotal.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 19/06/26.
//

import SwiftUI

struct AchievementsTotal: View {
    @State var numberTasks: Int = 10
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text ("Total")
                    .padding(.top, 16)
                    .padding(.bottom, 8)
                    .padding(.horizontal, 16)
                    .font(.body)
                    .fontWeight(.semibold)
                
                Text("\(numberTasks)")
                    .padding(.bottom, 16)
                    .padding(.horizontal, 16)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            
            Spacer(minLength: 0)
            
            Image(systemName: "list.bullet.clipboard.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundStyle(.iconPurple)
                .padding(.top, 30)
            
        }
        .frame(maxWidth: .infinity, maxHeight: 110)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .shadow, radius: 6, x: 2, y: 2)
}
}


#Preview {
    AchievementsTotal()
}
