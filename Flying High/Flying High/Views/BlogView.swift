//
//  BlogView.swift
//  Flying High
//
//  Created by Clara on 09/06/26.
//
import SwiftUI

struct BlogView: View {
    @State private var cardSelecionado: ArticleModel?
    @State private var postSelecionado : BlogCardView?
    
    let blogs: [ArticleModel] = [
        ArticleModel(title: "Banheiro", subtitle: "Dicas de limpeza", text: "texto do banheiro", imageName: "baldinho", colorName: "card_limpeza"),
        ArticleModel(title: "Reparos", subtitle: "Dicas de reparos", text: "texto do reparo", imageName: "martelo2", colorName: "card_reparos"),
        ArticleModel(title: "Organização", subtitle: "Dicas de organização", text: "i'm not that girl", imageName: "casa1", colorName: "card_alimentacao")
    ]
    
    var body: some View {
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
            .background(Color.background
                .ignoresSafeArea())
            .fullScreenCover(item: $cardSelecionado){ item in TelaCheiaPostView(content: item, tituloDoPost: cardSelecionado?.title ?? "titulo")
            }
        }
    }
}

struct TelaCheiaPostView: View{
    let content: ArticleModel
    @Environment(\.dismiss) var dismiss
    
    let tituloDoPost: String
    
    var corDeFundo: Color{
        switch tituloDoPost {
        case "Dicas de Limpeza": return Color("card_limpeza")
        case "Dicas de Alimentação": return Color("card_alimentacao")
        case "Dicas de Reparos":return Color("card_reparo")
        default:return Color("card_limpeza")
        }
    }
    
    var nomeImage: String{
        switch tituloDoPost {
        case "Banheiro": return "baldinho"
        case "Alimentação": return "alimentacao"
        case "Reparos":return "martelo2"
        default:return "baldinho"
        }
    }
    
    var textoArtigo: String {
        switch tituloDoPost {
        case "Limpeza" : return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a tortor eget massa tincidunt interdum. Donec vitae justo eget elit ultrices ultricies. Donec vitae justo eget elit ultrices ultricies. Donec vitae justo eget elit ultrices ultricies."
        case "Reparos" : return "Ele prescisa de uns reparos, mas ouça por favor"
        case "Alimentação" : return "vamo ta comendo?"
        default: return "conteudo não encontrado"
        }
    }
    
    var body:some View{
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 0){
                    ZStack {
                        Color(content.colorName)
                        Image(content.imageName)
                        corDeFundo
                        Image("baldinho")
                            .resizable()
                            .scaledToFit()
                            .frame(width:180, height: 180)
                    }
                    .frame(height:280)
                    .frame(maxWidth:.infinity)
                    
                    VStack(alignment:.leading, spacing: 12){
                        Text("\(content.title)")
                        Text("Mágica")
                            .font(.title)
                            .bold()
                            .foregroundColor(.primary)
                        
                        Text("\(content.subtitle)")
                        Text("Calcinha Preta")
                            .font(.title3)
                            .foregroundColor(.primary)
                            .padding(.bottom, 12)
                        
                        Text("\(content.text)")
                        Text("não consico colocar a musica")
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
                .navigationTitle("Marca AGORA")
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

#Preview {
    BlogView()
}
