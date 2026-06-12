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
        VStack {
            Text(displayText)
                .font(Font.largeTitle.bold())
                .padding(16)
            
            HStack{
                Button{
                    toggleTimer()
                } label: {
                    Circle()
                        .frame(maxWidth: 90, maxHeight: 80)
                        .overlay(alignment: .center) {
                            Image(systemName: isRunning ? "pause.fill" : "play.fill")
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .padding(5)
                                .font(.system(size: 34))
                        }
                    
                }
                .tint(Color(.main))
                
                Button {
                    resetTimer()
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
