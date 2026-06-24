//  BlogCardView.swift
//  Flying High
//
//  Created by Clara on 09/06/26.
//

import SwiftUI

struct TipCardView: View {
    let article: ArticleModel
    
    var body: some View {
            VStack {
                HStack {
                    VStack (alignment: .leading, spacing: 8){
                        Text(article.title)
                            .font(.title2)
                            .foregroundStyle(.text)
                            .fontWeight(.bold)
                            .accessibilityLabel(Text("Artigo: \(article.title)"))
                        
                        Text(article.subtitle)
                            .font(.title3)
                            .foregroundStyle(.text)
                    }
                    .frame(width: 267, alignment: .leading)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.main)
                        .accessibilityHidden(true)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 30)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.violet)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 16)
                .overlay (alignment: .topTrailing){
                    article.category.tagMarker
                        .offset(x: -30, y: 0)
                }
            }
            .accessibilityElement(children: .combine)
            .accessibilityHint(Text("Clique para ler o artigo"))
    }
}

#Preview {
    TipCardView(article: ArticleModel(title: "Como limpar o seu banheiro?",
                                                   subtitle: "Dicas de limpeza",
                                                   text: " nas portas do box e esfregue com uma esponja ou pano.\n- Aplique uma mistura de vinagre e bicarbonato de sódio nas áreas com mofo e esfregue com uma escova. \n- Lembre-se de sempre passar o rodo nas portas do box após cada banho para remover o excesso de água e evitar manchas.",
                                      imageName: "bucket", category: .cleaning))
//    ZStack {
//        Color(red: 0.1, green: 0.1, blue: 0.12)
//            .ignoresSafeArea()
//        
//        BlogCardView (
//            title: "Banheiro",
//            subtitle: "Dicas de Limpeza",
//            image : "baldinho",
//            headerColor: Color(red: 0.38, green: 0.60, blue: 0.96)
//        )
//        .frame(width: 320)
//    }
}
