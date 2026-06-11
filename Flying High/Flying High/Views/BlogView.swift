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
                        title: "Banheiro",
                        subtitle: "Dicas de limpeza",
                        image: "baldinho",
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
            VStack{
                Spacer()
                
                Text(tituloDoPost)
                    .font(.largeTitle)
                    .bold()
                
                Text("Vai tomando viu")
                    .foregroundStyle(.secondary)
                    .padding()
                
                Spacer()
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: {
                        dismiss()
                    }){
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .foregroundColor(.gray)
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
