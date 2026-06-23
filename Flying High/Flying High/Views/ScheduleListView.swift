//
//  ScheduleListView.swift
//  Flying High
//
//  Created by Davi Carvalho Barbosa de Menezes on 09/06/26.
//

import SwiftUI
import SwiftData

struct ScheduleListView: View {
    @Query var tasks : [TaskModel]
    @Query var schedules : [ScheduleModel]
    @Environment(\.modelContext) private var modelContext
    
    @AppStorage("hasLaunchedBefore") var hasLaunchedBefore = false
    
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack {
                    ForEach(schedules) { schedule in
                        ScheduleCardView(schedule: schedule)
                    }
                    .navigationTitle("Cronogramas")
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                }
                .padding(.top, 10)
            }
            .background(Color.background
                .ignoresSafeArea())
            .onAppear {
                
                checkFirstLaunch()
                print(tasks)
                
            }
        }
    }
    
    func checkFirstLaunch() {
        if !hasLaunchedBefore {
            let tasksCleaningLiving: [TaskModel] =
            [TaskModel(
                title: "Espanar",
                category: .cleaning,
                room: nil,
                info: "- Espane todas as partes, atras dos moveis e nos cantos",
                estimatedTime: 1200
            ),
             
             TaskModel(
                title: "Varrer ou aspirar o chão",
                category: .repair,
                room: nil,
                info: "- Não esqueça de varrer em baixo de todos os moveis, dos tapetes, e no canteiros",
                estimatedTime: 600
             ),
             TaskModel(
                title: "Passar pano molhado no chão",
                category: .cleaning,
                room: nil,
                info: "- Lembre-se de usar um desinfetante que goste, use um pano limpo, e um balde de agua",
                estimatedTime: 600
             ),
             TaskModel(
                title: "Lustrar moveis",
                category: .cleaning,
                room: nil,
                info: "- Antes de lustrar os móveis, passe um pano seco para evitar manchas ou arranhões.\n- Caso não tenha um lustra móveis em casa, você pode fazer um caseiro diluindo uma colher de sopa de amaciante em meio litro de água.",
                estimatedTime: 300
             ),
             TaskModel(
                title: "Passar aromatizador de ambiente",
                category: .cleaning,
                room: nil,
                info: "",
                estimatedTime: 180
             )]
            
            let tasksOrganizationLiving: [TaskModel] = [
                    TaskModel(
                        title: "Reorganizar itens",
                        category: .organization,
                        room: nil,
                        info: "- Cheque se há itens fora do lugar e devolva-os aos seus devidos lugares",
                        estimatedTime: 1200),
                    TaskModel(
                        title: "Verifique armários e gavetas",
                        category: .organization,
                        room: nil,
                        info: "- Organize os armários por categoria para facilitar o dia a dia\n- Jogue itens fora, caso ache necessário",
                        estimatedTime: 1200),]
            
            let tasksOrganization: [TaskModel] = [
                    TaskModel(
                        title: "Conferir dispensa",
                        category: .organization,
                        room: nil,
                        info: "- Anote tudo que tem e deixe num lugar fácil, e anote o que falta.",
                        estimatedTime: 300),
                    TaskModel(
                        title: "Tirar o lixo",
                        category: .organization,
                        room: nil,
                        info: "",
                        estimatedTime: 300),
                    TaskModel(
                        title: "Guardar as roupas limpas",
                        category: .organization,
                        room: nil,
                        info: "- De preferência, separe as roupas por categoria para facilitar na hora de organizar e procurar elas nas gavetas.",
                        estimatedTime: 1200),]
            
            let tasksRepair: [TaskModel] = [
                TaskModel(
                    title: "Ajeitar torneira da cozinha",
                    category: .repair,
                    room: nil,
                    info: "",
                    estimatedTime: 2400),
                TaskModel(
                    title: "Trocar a fechadura do banheio",
                    category: .repair,
                    room: nil,
                    info: "",
                    estimatedTime: 1800),
                TaskModel(
                    title: "Trocar lâmpadas",
                    category: .repair,
                    room: nil,
                    info: "",
                    estimatedTime: 1200),]
            
            let tasksCleaningBathroom: [TaskModel] = [
                TaskModel(
                    title: "Guardar itens",
                    category: .cleaning,
                    room: nil,
                    info: "- Retire os itens de cima da pia ou das demais superfícies que você irá limpar ",
                    estimatedTime: 600),
                TaskModel(
                    title: "Trocar a fechadura do banheio",
                    category: .cleaning,
                    room: nil,
                    info: "- Lave a superfície com uma esponja macia e detergente neutro \n- Enxágue com água morna \n- Seque a pia com um pano limpo para evitar manchas d'água.",
                    estimatedTime: 1200),
                TaskModel(
                    title: "Limpar o box",
                    category: .cleaning,
                    room: nil,
                    info: "- Borrife uma mistura de 1 xícara de vinagre branco, 1 xícara de álcool e 1 colher de detergente \n- Aplique no vidro e deixe agir por 5 minutos \n- Esfregue com a parte macia da esponja e enxague \n- Seque com um rodo de pia para evitar manchas",
                    estimatedTime: 1200),
                TaskModel(
                    title: "Limpar o chão",
                    category: .cleaning,
                    room: nil,
                    info: "- Remova os resíduos sólidos \n- Aplique uma mistura de detergente neutro e vinagre de álcool (ou água sanitária para manchas mais fortes) \n- Deixe agir por 10 minutos \n- Esfregue com uma vassoura ou escova \n- Enxágue em seguida.",
                    estimatedTime: 2400),
                TaskModel(
                    title: "Limpar o vaso sanitário",
                    category: .cleaning,
                    room: nil,
                    info: "- De preferência, use luvas de borracha \n- Use um pano de microfibra seco para limpar todo o exterior do vaso sanitário \n- Aplique o limpador na parte interna do vaso, para deixá-lo agindo enquanto limpa a parte exterior \n- Aplique limpador de vaso sanitário em um pano de microfibra e limpe a parte superior e as laterais do tanque, incluindo a descarga \n- use esse mesmo pano par alimpar o assento, a base e as paredes do vaso \n- Por fim, use uma escova sanitária para esfregar a parte interna do vaso.",
                    estimatedTime: 900),
                TaskModel(
                    title: "Reorganizar itens",
                    category: .cleaning,
                    room: nil,
                    info: "- Reorganize os objeto que você guardou no começo do cronograma",
                    estimatedTime: 300),]
            
            let tasksCleaningRoom: [TaskModel] = [
                TaskModel(
                    title: "Varrer o quarto",
                    category: .cleaning,
                    room: nil,
                    info: "- Retire os lixos maiores do quarto e descarte-os \n- Varra o quarto para retirar as sujeiras menores",
                    estimatedTime: 900),
                TaskModel(
                    title: "Passar o pano no chão",
                    category: .cleaning,
                    room: nil,
                    info: "-Em um balde, dilua desinfetante ou limpador específico em água morna \n- Umedeça um pano (microfibra ou algodão) e torça bem para tirar o excesso \n- Passe no chão buscando limpar toda a superfície",
                    estimatedTime: 900),
                TaskModel(
                    title: "Limpar móveis e demais superfícies",
                    category: .cleaning,
                    room: nil,
                    info: "- Passe um pano de microfibra úmido nas demais superfícies do quarto \n- Limpe espelhos com limpadores específicos se necessário.",
                    estimatedTime: 900),]
            
            let tasksOrganizationRoom: [TaskModel] = [
                TaskModel(
                    title: "Conferir produtos",
                    category: .organization,
                    room: nil,
                    info: "- Confira se há produtos vencidos ou frascos vazios que devem ser descartados.",
                    estimatedTime: 900),
                TaskModel(
                    title: "Agrupar itens por funcionalidade",
                    category: .organization,
                    room: nil,
                    info: "- Separe os itens por categoria para facilitar na organização",
                    estimatedTime: 600),
                TaskModel(
                    title: "Organizar itens",
                    category: .organization,
                    room: nil,
                    info: "- Para facilitar o seu dia a dia, deixe os que você usa com mais frequência em locais de fácil acesso \n- Reorganize também produtos do box se preferir",
                    estimatedTime: 900),]
            
            let tasksOrganizationBathroom: [TaskModel] = [
                TaskModel(
                    title: "Arrumar a cama",
                    category: .organization,
                    room: nil,
                    info: "- Retire lençóis, travesseiros e demais itens de cima da cama \n- Organize ou troque a colcha de cama se necessário \n- Dobre os lençóis e organize os travesseiros ",
                    estimatedTime: 600),
                TaskModel(
                    title: "Guardar ou jogar roupas no roupeiro",
                    category: .organization,
                    room: nil,
                    info: "- Junte as roupas espalhadas pelo quarto \n- Defina se elas devem ser jogadas no roupeiro para lavar ou se devem voltar para o armário",
                    estimatedTime: 900),
                TaskModel(
                    title: "Organizar demais itens",
                    category: .organization,
                    room: nil,
                    info: "- Junte os demais itens fora do local correto \n- Joguue no lixo o que for necessário e reposicione os demais em seus devidos locais",
                    estimatedTime: 600),]
            
            let tasksRepairWalls: [TaskModel] = [
                TaskModel(
                    title: "Lixar a superficie afetada",
                    category: .repair,
                    room: nil,
                    info: "",
                    estimatedTime: 600),
                TaskModel(
                    title: "Corrigir buracos e fissuras",
                    category: .repair,
                    room: nil,
                    info: "",
                    estimatedTime: 300),
                TaskModel(
                    title: "Limpar com um pano úmido para remover o pó",
                    category: .repair,
                    room: nil,
                    info: "",
                    estimatedTime: 300),
                TaskModel(
                    title: "Cobrir móveis e chão com lona plástica",
                    category: .repair,
                    room: nil,
                    info: "",
                    estimatedTime: 600),
                TaskModel(
                    title: "Cobrir com fita os rodapés, batentes e interruptores",
                    category: .repair,
                    room: nil,
                    info: "",
                    estimatedTime: 600),
                TaskModel(
                    title: "Pintar com rolo",
                    category: .repair,
                    room: nil,
                    info: "",
                    estimatedTime: 1500),]
            
            let schedules: [ScheduleModel] = [ScheduleModel(title: "Organização Diária",
                                                            tasks: tasksOrganization,
                                                            category: .organization),
                                              
                                              ScheduleModel(title: "Reparos Gerais",
                                                            tasks: tasksRepair,
                                                            category: .repair),
                                              
                                              ScheduleModel(title: "Limpeza do Banheiro",
                                                            tasks: tasksCleaningBathroom,
                                                            category: .cleaning),
                                              
                                              ScheduleModel(title: "Organização do Banheiro",
                                                            tasks: tasksOrganizationBathroom,
                                                            category: .organization),
                                              
                                              ScheduleModel(title: "Limpeza do Quarto",
                                                            tasks: tasksCleaningRoom,
                                                            category: .cleaning),
                                              
                                              ScheduleModel(title: "Organização do Quarto",
                                                            tasks: tasksOrganizationRoom,
                                                            category: .organization),
                                              
                                              ScheduleModel(title: "Limpeza da Sala",
                                                            tasks: tasksCleaningLiving,
                                                            category: .cleaning),
                                              
                                              ScheduleModel(title: "Organização da Sala",
                                                            tasks: tasksOrganizationLiving,
                                                            category: .organization),
                                              
                                              ScheduleModel(title: "Pintura e Revestimento",
                                                            tasks: tasksRepairWalls,
                                                            category: .repair),
            ]
            for schedule in schedules {
                modelContext.insert(schedule)
            }
            
            do {
                try modelContext.save()
            } catch {
                print(error.localizedDescription)
            }
            
            hasLaunchedBefore = true
        }
    }
    
}
//
//#Preview {
//    var localTasks: [TaskModel] = [
//        TaskModel(
//            title: "Lavar a louça",
//            category: .cleaning,
//            room: nil,
//            info: "Lavar e secar toda a louça do almoço.",
//            estimatedTime: 900
//        ),
//        TaskModel(
//            title: "Organizar guarda-roupa",
//            category: .organization,
//            room: nil,
//            info: "Separar roupas para doação e dobrar o restante.",
//            estimatedTime: 3600
//        ),
//        TaskModel(
//            title: "Trocar lâmpada queimada",
//            category: .repair,
//            room: nil,
//            info: "Substituir por uma lâmpada LED de 9W.",
//            estimatedTime: 1800
//        ),
//        TaskModel(
//            title: "Limpar janelas",
//            category: .cleaning,
//            room: nil,
//            info: "Usar limpa-vidros e pano de microfibra.",
//            estimatedTime: 1800
//        )
//    ]
//
//    let mockSchedules: [ScheduleModel] = [
//        ScheduleModel(
//            title: "Faxina Pesada de Sábado",
//            tasks: [localTasks[0], localTasks[3]], // Lavar a louça e Limpar janelas
//            category: .cleaning
//        ),
//        ScheduleModel(
//            title: "Manutenção do Apartamento",
//            tasks: [localTasks[2]], // Trocar lâmpada queimada
//            category: .repair
//        ),
//        ScheduleModel(
//            title: "Organização do Quarto",
//            tasks: [localTasks[1]], // Organizar guarda-roupa
//            category: .organization
//        ),
//        ScheduleModel(
//            title: "Rotina Rápida Matinal",
//            tasks: [localTasks[0]], // Lavar a louça
//            category: .other
//        ),
//        ScheduleModel(
//            title: "Planejamento Livre",
//            tasks: nil,
//            category: nil // Seu init vai transformar automaticamente em .none
//        )
//    ]
//
////    ScheduleListView(schedules: mockSchedules)
//
//}
