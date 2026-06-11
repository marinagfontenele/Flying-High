//
//  BlogCardView.swift
//  Flying High
//
//  Created by Clara on 09/06/26.
//

import SwiftUI

struct BlogGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            configuration.content
        }
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
        .shadow(color: Color.black.opacity(0.08), radius: 15, x: 0, y: 8)
    }
}

struct BlogCardView: View {
    let title: String
    let subtitle: String
    let image: String
    let headerColor: Color
    
    var body: some View {
        GroupBox {
            VStack (spacing: 0){
                     //(red: 0.38, green: 0.60, blue: 0.96)
                    Image(image)
                        .font(.system(size:50))
                        .foregroundColor(.white.opacity(0.8))
                        .frame(maxWidth: .infinity)
                        .padding(20)
                        .background(headerColor)
                        
                
//                .frame(height: 160)
//                .frame(maxWidth: .infinity)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("Banheiro")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text("Dicas de limpeza")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                
            }
        }
        .groupBoxStyle(BlogGroupBoxStyle())
//        .frame(width: 360)
    }
}

#Preview {
    ZStack {
        Color(red: 0.1, green: 0.1, blue: 0.12)
            .ignoresSafeArea()
        
        BlogCardView (
            title: "Banheiro",
            subtitle: "Dicas de Limpeza",
            image : "baldinho",
            headerColor: Color(red: 0.38, green: 0.60, blue: 0.96)
        )
        .frame(width: 320)
    }
}
