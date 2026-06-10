//
//  BlogView.swift
//  Flying High
//
//  Created by Clara on 09/06/26.
//

import SwiftUI
struct BlogView: View {
    var body:some View {
        NavigationStack{
            ScrollView{
                VStack(spacing:20){
                    BlogCardView(
                        title: "Banheiro",
                        subtitle: "Dicas de limpeza",
                        image: "sparkles",
                        headerColor: Color(red: 0.38, green: 0.60, blue: 0.96)
                    )
                    .padding()
                    
                    BlogCardView(
                        title: "Banheiro",
                        subtitle: "Dicas de limpeza",
                        image: "sparkles",
                        headerColor: Color(red: 0.38, green: 0.60, blue: 0.96)
                    )
                    
                    
                    BlogCardView(
                        title: "Banheiro",
                        subtitle: "Dicas de limpeza",
                        image: "sparkles",
                        headerColor: Color(red: 0.38, green: 0.60, blue: 0.96)
                    )
                }
                
                .navigationTitle("Blog")
            }
            
            
        }
        
        //    struct BlogGroupBoxStyle: GroupBoxStyle {
        //        func makeBody(configuration: Configuration) -> some View {
        //                VStack(alignment: .leading, spacing: 0) {
        //                    configuration.content
        //                }
        //                .background(Color.white)
        //                .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
        //                .shadow(color: Color.black.opacity(0.06), radius: 12, x: 0, y: 6)
        //            }
        //
        //    }
        
    }
    
}
// }

#Preview {
    BlogView()
}
