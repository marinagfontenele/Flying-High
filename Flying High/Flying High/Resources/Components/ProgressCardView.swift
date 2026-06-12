//
//  Card.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 10/06/26.
//

import SwiftUI

struct CardProgressView: View {
    @State private var isEnabled = false
    @State var title: String = "Tempo Restante"
    @State var info: String = "30 minutos"
    
    var body: some View {
        HStack {
            
            HStack {
                VStack (alignment: .leading, spacing: 15) {
                    Text(title)
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    
                    Text(info)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
                Spacer(minLength: 0)
            }
            .padding(20)
            .background(Color(.purple), in: RoundedRectangle(cornerRadius: 15))
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    CardProgressView()
}
