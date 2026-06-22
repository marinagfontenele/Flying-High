//
//  TimerView.swift
//  Flying High
//
//  Created by Ulisses Bonfim on 11/06/26.
//

import SwiftUI

struct TimerCardView: View {
    @State private var engine = TimerEngine()
    
    var onForwardPressed: () -> Void
    var nextTaskExists: Bool
    @Binding var isRunning: Bool
    @Binding var elapsedTaskTime: TimeInterval
    
    @State private var displayText: String = "00:00:00"
    @State var isEnabledForward: Bool = false
    
    var body: some View {
        VStack {
            Text(displayText)
                .font(Font.largeTitle.bold())
                .padding(16)
            
            HStack{
                Button{ // Botão de play/pause
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
                .accessibilityLabel(Text("Pausar temporizador"))
                
                if nextTaskExists{
                    Button {
                        if engine.isRunning {
                            engine.pause()
                            isRunning = false
                        }
                        onForwardPressed()
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
                    .accessibilityLabel(Text("Passar para a próxima tarefa"))
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
                self.elapsedTaskTime = engine.totalElapsedTime
            }
        }
    }
    
    func resetTimer() {
        engine.reset()
        isRunning = false
        displayText = engine.totalElapsedTime.formatTime() //"00:00:00"
    }
}

#Preview {
//    TimerCardView(
//        onForwardPressed: {},
//        nextTaskExists: true,
//        isRunning: .constant(false)
//        
//    )
}
