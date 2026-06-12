//
//  TimerView.swift
//  Flying High
//
//  Created by Marina Gomes Fontenele on 10/06/26.
//

import SwiftUI

struct TimerView: View {
    @State private var isPaused: Bool = false
    @State private var isPresented: Bool = false
    @State var nextTask: String = "Comprar Pões"
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack {
                CardProgressView(title: "Em Progresso", info: "Nome da Tarefa")
                
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
                
                Text ("00 : 00 : 00")
                    .font(Font.largeTitle.bold())
                    .padding(16)
                HStack {
                    Button{
                        
                    } label: {
                        Circle()
                            .frame(maxWidth: 90, maxHeight: 80)
                            .overlay(alignment: .center) {
                                Image(systemName: "pause.fill")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                    .padding(5)
                                    .font(.system(size: 34))
                            }
                    }
                    .tint(Color(.main))
                    
                    Button{
                        
                    } label: {
                        Circle()
                            .frame(maxWidth: 90, maxHeight:80)
                            .overlay(alignment: .center) {
                                Image(systemName: "forward.end.fill")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                    .padding(5)
                                    .font(.system(size: 34))
                            }
                    }
                    .tint(Color(.main))
                }
                
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
}

#Preview {
    TimerView()
}
