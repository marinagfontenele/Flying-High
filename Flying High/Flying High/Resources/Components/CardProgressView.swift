//
//  Card.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 10/06/26.
//

import SwiftUI

struct CardProgressView: View {
    @State private var isEnabled = false
    
    var body: some View {
        HStack {
            
            HStack (alignment: .top){
                VStack (alignment: .leading, spacing: 15) {
                    Text("Tempo Restante:")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    
                    Text("30 minutos")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
                Spacer(minLength: 0)
            }
            .padding(20)
            .background(Color(.purple), in: RoundedRectangle(cornerRadius: 15))
        }
        .padding(16)
    }
}

#Preview {
    CardProgressView()
}
