//  BlogView.swift
//  Flying High
//
//  Created by Clara on 09/06/26.
//
import SwiftUI

struct PostBlog: Identifiable {
    let id = UUID()
    let titulo: String
    let subtitulo: String
    let textoArtigo: String
    let nomeImagem: String
    let corDeFundo: Color
}

struct ConteudoPost{
    let id = UUID()
    let titulo: String
    let subtitulo: String
    let textoArtigo: String
    let nomeImagem: String
    let corDeFundo: Color
}
struct BlogView: View {
    @State private var cardSelecionado: ArticleModel?
    @State private var postSelecionado : BlogCardView?
    
    let blogs: [ArticleModel] = [
        ArticleModel(id: UUID(), title: "Banheiro", subtitle: "Dicas de limpeza", text: "texto do banheiro", imageName: "baldinho", colorName: "card_limpeza"),
        ArticleModel(id: UUID(), title: "Reparos", subtitle: "Dicas de reparos", text: "texto do reparo", imageName: "martelo2", colorName: "card_reparos"),
        ArticleModel(id: UUID(), title: "Organização", subtitle: "Dicas de organização", text: "i'm not that girl", imageName: "casa1", colorName: "card_alimentacao")
    ]
    
    var body:some View {
        NavigationStack{
            ScrollView{
                VStack(spacing:20){
                    Spacer()
                    
                    ForEach(blogs){ blog in
                        BlogCardView(
                            title: blog.title,
                            subtitle: blog.subtitle,
                            image: blog.imageName,
                            headerColor: Color(blog.colorName)
                        )
                        .onTapGesture{
                            cardSelecionado = blog
                        }
                    }

                }
                .padding(.horizontal)
                .navigationTitle("Blog")
            }
            
            .fullScreenCover(item: $cardSelecionado){ item in TelaCheiaPostView(content: item)
            }
        }
    }
}

struct TelaCheiaPostView: View{
    let content: ArticleModel
    @Environment(\.dismiss) var dismiss
    
    var body:some View{
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 0){
                    ZStack {
                        Color(content.colorName)
                        Image(content.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width:180, height: 180)
                    }
                    .frame(height:280)
                    .frame(maxWidth:.infinity)
                    
                    VStack(alignment:.leading, spacing: 12){
                        Text("\(content.title)")
                            .font(.title)
                            .bold()
                            .foregroundColor(.primary)
                        
                        Text("\(content.subtitle)")
                            .font(.title3)
                            .foregroundColor(.primary)
                            .padding(.bottom, 12)
                        
                        Text("\(content.text)")
                            .font(.body)
                            .fontWeight(.regular)
                            .foregroundColor(.primary)
                            .lineSpacing(6)
                    }
                    .padding(24)
                }
                .background(Color(.systemBackground))
                .ignoresSafeArea(edges: .top)
                .navigationTitle(content.title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button(action: {
                            dismiss()
                        }){
                            Text("OK")
                                .font(.headline)
                                .foregroundColor(.purple)
                        }
                    }
                }
            }
        }
    }
}
           
    extension String: Identifiable {
    public var id: String { self }
}
// }

#Preview {
    BlogView()
}
