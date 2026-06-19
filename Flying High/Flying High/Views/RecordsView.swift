//
//  RecordsView.swift
//  Flying High
//
//  Created by Davi Carvalho Barbosa de Menezes on 10/06/26.
//

import SwiftUI

struct RecordsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (spacing: 20){
                    HStack{
                        HStack (spacing: 10){
                            Image(systemName: "clock.fill")
                            Text("Tempo \neconomizado")
                        }
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.text)
                        
                        Spacer(minLength: 0)
                        
                        Text("xx min")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.text)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 16)
                    .background(.violet)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    NavigationLink (destination: ChartView()){
                        HStack {
                            HStack (spacing: 10){
                                Image(systemName: "list.bullet.clipboard.fill")
                                VStack(alignment: .leading){
                                    Text("Tarefas")
                                    Text("concluídas")
                                }
                                
                            }
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.text)
                            
                            Spacer(minLength: 0)
                            
                            HStack (spacing: 6){
                                Image(systemName: "arrow.up.right")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.greenRecord)
                                
                                Text("12")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.greenRecord)
                            }
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.text)
                            
                            Image(systemName: "chevron.right")
                                .foregroundStyle(Color(.systemGray))
                                .padding(.leading, 10)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .padding(.horizontal, 16)
                        .background(.whiteCard)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                    
                    NavigationLink (destination: EmptyView()){
                        HStack{
                            HStack (alignment: .center,spacing: 10){
                                Image(systemName: "rosette")
                                VStack(alignment: .leading){
                                    Text("Progresso")
                                    Text("de tempo")
                                }
                            }
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.text)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundStyle(Color(.systemGray))
                        }
                        .frame(maxWidth: .infinity)
                        
                        .padding(.vertical, 14)
                        .padding(.horizontal, 16)
                        .background(.whiteCard)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                    
                    VStack {
                        HStack (spacing: 30){

                            
                            VStack (alignment: .leading){
                                Text("As tarefas que")
                                Text("você mais")
                                Text("realizou foram")
                                Text("as de limpeza.")
                            }
                            .foregroundStyle(.white)
                            .font(.title2)
                            .fontWeight(.bold)
                        }
                        
                        HStack {
                            Text("Foram")
                                .foregroundStyle(.white)
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text("4")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundStyle(.blueTag)
                                .padding(10)
                                .background(.white)
                                .clipShape(.circle)
                            
                            
                            Text("limpezas ao todo.")
                                .foregroundStyle(.white)
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        
                        Text("Sua casa deve estar brilhando!")
                            .foregroundStyle(.white)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 26)
                    .background(.blueTag)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .padding(16)
                .navigationTitle(Text("Relatórios"))
            }
            .background(Color.background
            .ignoresSafeArea())
        }
    }
}

#Preview {
    RecordsView()
}
