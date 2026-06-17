////
////  Card.swift
////  Flying High
////
////  Created by Marina Gomes Fontenele on 10/06/26.
////
//
//import SwiftUI
//
//struct CardProgressView: View {
//    @State private var isEnabled = false
//    @State var title: String = "Tempo Restante"
//    @State var info: String = "30 minutos"
//    
//    @State var schedule: ScheduleModel
//    @State var timePassed: TimeInterval
//    
//    var body: some View {
//        HStack {
//            
//            HStack {
//                VStack (alignment: .leading, spacing: 15) {
//                    Text(title)
//                        .font(.body)
//                        .fontWeight(.semibold)
//                        .foregroundStyle(.white)
//                    
//                    // TODO: melhorar a logica de tempo restante
//                    Text(schedule.remainingTimeString(timePassed: timePassed))
//                        .font(.title2)
//                        .fontWeight(.semibold)
//                        .foregroundStyle(.white)
//                }
//                Spacer(minLength: 0)
//            }
//            .padding(20)
//            .background(Color(.purple), in: RoundedRectangle(cornerRadius: 15))
//        }
//        .padding(.horizontal, 16)
//    }
//}
//
//#Preview {
//    var mockedTasks: [TaskModel] = [
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
//            estimatedTime: 2000
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
//    var schedule = ScheduleModel(title: "testeeeee", tasks: mockedTasks, category: CategoryModel.repair)
////    schedule.setTimePassed(timePassed: 1900)
//    CardProgressView
//}
