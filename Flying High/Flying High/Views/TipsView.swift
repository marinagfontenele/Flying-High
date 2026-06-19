//
//  BlogView.swift
//  Flying High
//
//  Created by Clara on 09/06/26.
//
import SwiftUI

struct TipsView: View {
    @State private var selectedCard: ArticleModel?
    
    let tips: [ArticleModel] = [
        ArticleModel(title: "Como limpar o seu banheiro?",
                     subtitle: "Dicas de limpeza",
                     text: "#Como lavar o banheiro da melhor forma? \n\n1. Remova o pó e o cabelo da pia, armário e chão. \n2. Na parte de dentro do box, jogue água, cloro e o multiuso com ação desengordurante. Esfregue bem com a esponja e deixe agir por 10 minutos. \n3. Enquanto isso, limpe o vaso sanitário por dentro com o cloro e a escova própria para o vaso. No lado de fora, passe o cloro com a esponja. \n4. Limpe a pia e a cuba com a esponja. \n5. No armário e nas prateleiras, passe o pano multiuso umedecido com água e o seu multiuso. \n6. Esfregue o chão e as paredes com uma mistura de cloro e água. \n7. Enxágue tudo. \n8. Limpe com o pano multiuso os itens que ainda faltam, como o vidro do box, por exemplo. \n9. Com o pano limpos, seque todas as superfícies molhadas. \n10. Aplique o desinfetante no chão com um pano bem úmido. \n\n\n#Como mantê-lo limpo no dia a dia? \n\n- Limpe o banheiro pelo menos uma vez por semana. \n- Jamais dê descarga sem abaixar a tampa do vaso sanitário; \n- Troque semanalmente as toalhas de banho e de rosto, assim como os tapetes do banheiro; \n- Mantenha um pano limpo e seco sobre a pia para facilitar a limpeza diária; \n- Nunca deixe o cesto de lixo transbordar; \n- Mantenha o chão e o box do banheiro sempre bem secos; \n- Deixe o banheiro constantemente com boa ventilação; \n- Deixe um desinfetante no banheiro para utilizá-lo com frequência.\n\n\n#Dicas para limpar cada área do banheiro: \n\n#Chão \n- Dilua detergente neutro em água e use uma vassoura ou um esfregão para lavar o chão. Enxágue bem para evitar resíduos de sabão. \n- Use a mesma quantidade de água e vinagre e aplique com um pano ou esfregão.\n- Use desinfetantes próprios para pisos de banheiro que são eficazes na remoção de germes e bactérias.\n- Faça uma pasta de bicarbonato de sódio e água, aplique no chão e esfregue. \n\n#Vaso Sanitário \n- Aplique um produto de limpeza para vasos sanitários ao redor da borda do vaso e deixe agir por alguns minutos. Esfregue com uma escova própria para vaso sanitário e dê descarga. \n- Despeje uma xícara de vinagre branco no vaso, deixe agir por 15 minutos e esfregue.\n- Use uma pequena quantidade de água sanitária diretamente no vaso para desinfetar e clarear. Deixe agir por alguns minutos antes de esfregar e dar descarga. \n- Misture meia xícara de bicarbonato com uma xícara de vinagre e despeje no vaso. Depois, é só esperar alguns minutos e esfregar. \n\n#Box \n- Aplique um limpador de vidro nas portas do box e esfregue com uma esponja ou pano.\n- Aplique uma mistura de vinagre e bicarbonato de sódio nas áreas com mofo e esfregue com uma escova. \n- Lembre-se de sempre passar o rodo nas portas do box após cada banho para remover o excesso de água e evitar manchas.", category: .cleaning),
        
        ArticleModel(title: "Como organizar o seu banheiro?",
                     subtitle: "Dicas de Organização",
                     text: "#Como organizar o banheiro da melhor forma?\n\n1. Libere espaço retirando cosméticos vencidos, frascos vazios e itens que não estão mais sendo utilizados no banheiro.\n2. Deixe na bancada apenas o que é essencial.\n3. Separe itens por categoria, deixando os mais utilizados em locais mais acessíveis.\n4. Limite a quantidade de objetos em cima do balcão.\n5. Organize os produtos dentro do box, conferindo se algo está vazio.\n6. Recolha a roupa do roupeiro.\n\n\n#Como mantê-lo organizado no dia a dia?\n\n- Utilize potinhos e cestas organizadoras para compor a decoração e obter mais espaço em volta da bancada da pia.\n- Instale ganchos na parede ou atrás da porta para pendurar toalhas ou roupas.\n- Invista em nichos e prateleiras para aproveitar cantos inutilizados.\n- Opte pisos e revestimentos de baixa manutenção.\n- Organize gabinetes com cestas empilhadas",
                     category: .organization,),
        
        ArticleModel(title: "Como limpar a sua cozinha?",
                     subtitle: "Dicas de Limpeza",
                     text: "#Como limpar a cozinha da melhor forma?\n\n1. Varra o piso da cozinha para retirar poeira e sujeiras maiores, como resquícios de alimentos.\n2. Seque a louça e guarde os utensílios em seus devidos lugares.\n3. Retire os objetos da bancada para liberar espaço para a limpeza.\n4. Lave a bancada com detergente neutro, esfregando com uma esponja macia.\n5. Com essa mesma esponja e detergente que você usou na bancada, lave também a cuba da pia e a torneira.\n6. Esvazie a lixeira.\n7. Remova os objetos e utensílios dos armários e gavetas.\n8. Limpe os armários e gavetas por dentro e por fora com um pano úmido e detergente neutro.\n9. Use uma esponja e detergente neutro para remover as sujeiras dos azulejos. Cuidado para não lavar as regiões próximas de tomadas, pois pode causar sérios acidentes.\n10. Passe um desengordurante, um detergente ou um sabão neutro no chão e deixe ele agir por alguns minutos.\n 11. Esquente água e tire o produto. A água morna vai ajudar a desprender a gordura do chão. \n\n\n#Como mantê-la limpa no dia a dia?\n\n- Faça uma limpeza profunda pelo menos uma vez por semana.\n- Higienize superfícies logo após o uso para evitar o acúmulo de sujeira e reduzir o tempo gasto para limpeza posterior.\n- Lave a louça logo após as discussões.\n- Posicione a lixeira de forma estratégica para facilitar o descarte imediato de resíduos.\n- Crie uma rotina que divida a limpeza por partes e não deixe acumular sujeira.\n- Coloque uma tampa nas panelas ao cozinhar e limpe os respingos logo após o uso para evitar sujeira no fogão.\n\n\n#Como limpar partes mais específicas da cozinha?\n\n#Fogão\n1. Comece removendo com um pano ou papel-toalha os fragmentos maiores de sujeira.\n2. Retire as grades e bocas com cuidado.\n3. Com uma esponja, lave a superfície do fogão com detergente neutro, tomando cuidado para não molhar o cano de gás.\n\n#Geladeira\n1. Comece jogando fora tudo o que já não serve mais.\n2. Retire todos os alimentos e objetos do interior da geladeira.\n3. Com um pano seco, aplique um limpador multiuso e remova as sujeiras mais superficiais.\n4. Retire as estantes e os suportes, lavando-os com detergente neutro. Enxágue-os bem e seque-os, para que possam ser retornados à geladeira limpíssimos!\n5. Guarde e organize os alimentos novamente.\n\n#Micro-ondas\n1. Remova o prato giratório e lave-o com detergente neutro.\n2. Com um pano úmido, limpe a superfície externa do aparelho.\n3. Tente remover as sujeiras da parte interna com uma esponja ou pano úmido, utilizando um pouquinho de detergente para as manchas mais difíceis.\n\n#Forno elétrico\n1. Retire as grelhas e lave-as com detergente neutro e água morna.\n2. Utilize também o detergente para remover as sujeiras do interior do forno elétrico, passando um pano úmido para retirar o sabão.\n3. Na parte externa do forno, use apenas um pano úmido para retirar a poeira.\n\n#Filtro de água\n1. Retire a base e lave-a com água e sabão. Caso necessário, aplique um pouco de água sanitária e deixe agir por alguns minutos, enxaguando bem logo em seguida.\n2. Para remover a poeira da parte externa do filtro, passe um pano úmido.\n3. Confira se é necessário trocar o  refil do filtro.",
                     category: .cleaning),
        
        ArticleModel(title: "Como organizar a sua cozinha?",
                     subtitle: "Dicas de Organização",
                     text: "#Como organizar a cozinha da melhor forma?\n\n1. Esvazie os armários e faça uma limpeza geral.\n2. Separe os utensílios por frequência de uso, posicionando-os de forma estratégica.\n3. Ponha utensílios utilizados diariamente em áreas de fácil acesso.\n4. Organize os armários por categoria.\n5. Coloque as tampas das panelas em ordem.\n6. Deixe os temperos acessíveis.\n7. Organize os potes plásticos em ordem e próximos às suas plantas.\n\n\n#Como mantê-la organizada no dia a dia?\n\n- Opte por bancadas com menos informação visual para tornar mais simples a manutenção.\n- Use potes transparentes para facilitar a visualização do conteúdo e contribuir para o controle de estoque.\n- Faça uma revisão periódica dos armários para ajudar a identificar utensílios pouco usados, alimentos vencidos ou objetos fora de função.\n- Invista em prateleiras e nichos para auxiliar na organização.\n- Use organizadores aramados para aproveitar espaços vazios.",
                     category: .organization),
        
        ArticleModel(title: "Como organizar o seu quarto?",
                     subtitle: "Dicas de Organização",
                     text: "#Como organizar o quarto da melhor forma?\n\n1. Retire os itens desnecessários do quarto.\n2. Organize a sua cama.\n3. Confira se tem peças de roupa fora do lugar. Se sim, verifique quais podem voltar para a gaveta e quais devem ir para o roupeiro.\n4. Organize as gavetas do seu guarda-roupas por categoria, deixando em um local mais acessível os itens que você mais utiliza.\n\n\n#Como mantê-lo organizado no dia a dia?\n\n- Limpe o quarto e troque as suas colchas de cama com frequência.\n- Evite acumular peças de roupa.\n- Reserve um espaço para guardar exclusivamente roupas de cama.\n- Invista em caixas e cestos organizadores para facilitar a organização das gavetas.",
                     category: .organization)
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing:20){
                    Spacer()
                    
                    ForEach(tips){ tip in
                        TipCardView(article: tip)
                            .onTapGesture{
                                selectedCard = tip
                            }
                    }
                }
                .navigationTitle("Dicas")
            }
            .background(Color.background
                .ignoresSafeArea())
            .fullScreenCover(item: $selectedCard){ item in TelaCheiaPostView(content: item, tituloDoPost: "Artigo")
            }
        }
    }
    
}

struct TelaCheiaPostView: View{
    let content: ArticleModel
    @Environment(\.dismiss) var dismiss
    
    let tituloDoPost: String
    
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
                        Text("\(content.title)")
                            .font(.title)
                            .bold()
                            .foregroundColor(.primary)
                        
                        Text("\(content.subtitle)")
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
                            Text("OK")
                                .font(.headline)
                                .foregroundColor(.main)
                        }
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
    TipsView()
}
