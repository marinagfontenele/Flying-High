//
//  TimerView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 10/06/26.
//

import SwiftUI

struct TimerView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isPaused: Bool = false
    @State private var isPresented: Bool = false
    @State var nextTask: String
    
    let timeLeft: String
    
    var body: some View {
        NavigationStack{
            VStack {
                CardProgressView(timeLeft: timeLeft)
                
                if !isPresented {
                    HStack {
                        Text("Próxima Tarefa: \(nextTask)")
                            .font(.body)
                            .fontWeight(.semibold)
                        
                        Spacer(minLength: 0)
                    }
                    .padding(15)
                    .background(Color(.violet), in: RoundedRectangle(cornerRadius: 15))
                    .padding(.horizontal, 16)
                }
                
                if !isPresented {
                    Spacer(minLength: 0)
                }
                
                //  Image (.bucket)
                
                // TODO: ajeitar o timer quebrando quando a sheet abre
                TimerCardView()
               
                Spacer(minLength: 0)
                
                Button {
                    isPresented.toggle()
                } label: {
                    Label("Informações", systemImage: "info.circle.fill")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(.main)
                        .clipShape(RoundedRectangle(cornerRadius: 1000))
                }
                .sheet(isPresented: $isPresented){
                    NavigationStack {
                        SheetTimerView()
                    }
                    .presentationDetents([.medium])
                    .presentationBackground(Color(.systemBackground))
                    .presentationBackgroundInteraction(.enabled)
                }
            }
            .animation(.default, value: isPresented)
            .background(Color.background
                .ignoresSafeArea())
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button{
                    
                } label: {
                    Image(systemName: "checkmark")
                        .fontWeight(.semibold)
                }
                .buttonStyle(.glassProminent)
                .tint(.main)
            }
        }
    }
    
    func calculateTimeLeft(taskList: [TaskModel]) -> String {
        var timeLeft: TimeInterval = 0
        for task in taskList {
            timeLeft += task.timeGoal
            //            print(timeGoal)
        }
        
        return timeLeft.stringFormatted()
    }
}

//#Preview {
//    TimerView()
//}
