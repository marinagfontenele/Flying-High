//
//  BlogView.swift
//  Flying High
//
//  Created by Clara on 09/06/26.
//
import SwiftUI
struct BlogView: View {
    @State private var cardSelecionado: String?
    var body:some View {
        NavigationStack{
            ScrollView{
                VStack(spacing:20){
                    Spacer()
                    BlogCardView(
                        title: "Banheiro",
                        subtitle: "Dicas de limpeza",
                        image: "baldinho",
                        headerColor: Color("card_limpeza")
                    )
                    .onTapGesture{
                        cardSelecionado = "Dicas de limpeza"
                    }
                    
                    BlogCardView(
                        title: "Banheiro",
                        subtitle: "Dicas de limpeza",
                        image: ("martelo2"),
                        headerColor: Color("card_reparo")
                    )
                    .onTapGesture{
                        cardSelecionado = "Dicas de Reparos"
                    }
                    
                    BlogCardView(
                        title: "Alimentação",
                        subtitle: "Dicas de limpeza",
                        image: "alimentacao",
                        headerColor: Color("card_alimentacao")
                    )
                    .onTapGesture{
                        cardSelecionado = "Dicas de Alimentação"
                    }
                }
                .padding(.horizontal)
                .navigationTitle("Blog")
            }
            
            .fullScreenCover(item: $cardSelecionado){item in TelaCheiaPostView(tituloDoPost: item)
            }
        }
    }
}

struct TelaCheiaPostView: View{
    let tituloDoPost: String
    @Environment(\.dismiss) var dismiss
    
    var body:some View{
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 0){
                    ZStack {
                        Color("card_limpeza")
                        Image("baldinho")
                            .resizable()
                            .scaledToFit()
                            .frame(width:180, height: 180)
                    }
                    .frame(height:280)
                    .frame(maxWidth:.infinity)
                    
                    VStack(alignment:.leading, spacing: 12){
                        Text("Mágica")
                            .font(.title)
                            .bold()
                            .foregroundColor(.primary)
                        
                        Text("Calcinha Preta")
                            .font(.title3)
                            .foregroundColor(.primary)
                            .padding(.bottom, 12)
                        
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
// }

#Preview {
    BlogView()
}
