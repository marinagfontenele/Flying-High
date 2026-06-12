//
//  TimerView.swift
//  Flying High
//
//  Created by Ulisses Bonfim on 11/06/26.
//

import SwiftUI

struct TimerCardView: View {
    private let engine = TimerEngine()
    
    @State private var displayText: String = "00:00.00"
    @State private var isRunning: Bool = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text(displayText)
                .font(.system(.largeTitle, design: .monospaced))
                .fontWeight(.bold)
                .padding()
            
            HStack(spacing: 40){
                Button(action: resetTimer){
                    Text("Reset")
                        .foregroundStyle(Color.primary)
                        .padding()
                        .frame(width: 100)
                        .background(Color.gray)
                        .cornerRadius(10)
                
                }
                Button(action: toggleTimer){
                    Text(isRunning ? "Pause" : "Start")
                        .foregroundStyle(Color.primary)
                        .padding()
                        .frame(width: 100)
                        .background(isRunning ? Color.red : Color.green)
                        .cornerRadius(10)
                }
            }
        }
    }
    
    private func toggleTimer() {
        if engine.isRunning {
            engine.pause()
            isRunning = false
        } else {
            isRunning = true
            engine.start {
                self.displayText = engine.totalElapsedTime.formatTime()
            }
        }
    }
    
    private func resetTimer() {
        engine.reset()
        isRunning = false
        displayText = engine.totalElapsedTime.formatTime() //"00:00.00"
    }
}

#Preview {
    TimerCardView()
}
