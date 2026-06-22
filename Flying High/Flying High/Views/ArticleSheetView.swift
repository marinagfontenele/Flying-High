//
//  ArticleSheetView.swift
//  Flying High
//
//  Created by Davi Carvalho Barbosa de Menezes on 19/06/26.
//

import SwiftUI

struct ArticleSheetView: View{
    let content: ArticleModel
    @Environment(\.dismiss) var dismiss
    
    var body:some View{
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 0){
                    if (content.imageName != nil){
                        ZStack {
                            Image(content.imageName!)
                                .resizable()
                                .scaledToFit()
                                .frame(width:180, height: 180)
                            
                        }
                        .frame(height:280)
                        .frame(maxWidth:.infinity)
                    }
                    
                    VStack(alignment:.leading, spacing: 12){
                        Text(content.title)
                            .font(.title)
                            .bold()
                            .foregroundColor(.primary)
                        
                        Text(content.subtitle)
                            .font(.title3)
                            .foregroundColor(.primary)
                            .padding(.bottom, 12)
                        
                        Text (hightlighTitles(content.text))
                            .font(.body)
                            .fontWeight(.regular)
                            .foregroundColor(.primary)
                            .lineSpacing(6)
                    }
                    .padding(24)
                }
                .ignoresSafeArea(edges: .top)
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button(action: {
                            dismiss()
                        }){
                            Image(systemName: "xmark")
                                .foregroundStyle(.white)
//                            Text("OK")
//                                .font(.headline)
//                                .foregroundColor(.main)
                        }
                        .buttonStyle(.glassProminent)
                        .tint(.main)
                    }
                }
            }
        }
    }
    
    func hightlighTitles(_ string: String) -> AttributedString {
        var titles = string.components(separatedBy: .newlines).filter { line in
            line.starts(with: "#")
        }
        titles = titles.map { title in
            String(title.dropFirst())
        }
        
        let string = string.replacingOccurrences(of: "#", with: "")
        
        var attributedString = try! AttributedString(
            markdown: string,
            options: .init(interpretedSyntax: .inlineOnlyPreservingWhitespace)
        )
        
        for title in titles {
            if let range = attributedString.range(of: title) {
                attributedString[range].font = .title3
                attributedString[range].inlinePresentationIntent = .stronglyEmphasized
            }
        }
        
        return attributedString
    }
}


#Preview {
    ArticleSheetView(content: ArticleModel(title: "teste", subtitle: "testando", text: "um teste foi feito", category: CategoryModel.organization))
}
