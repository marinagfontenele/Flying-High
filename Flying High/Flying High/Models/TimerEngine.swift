//
//  TimerEngine.swift
//  Flying High
//
//  Created by Ulisses Bonfim on 11/06/26.
//

import Foundation

class TimerEngine{
    private var timer: Timer?
    private var startTime: Date?
    
    private var accumulatedTime: TimeInterval = 0
    
    var isRunning: Bool {
        return timer != nil
    }
    
    var totalElapsedTime: TimeInterval {
        guard let startTime else {
            return accumulatedTime
        }
        return accumulatedTime + Date().timeIntervalSince(startTime)
    }
    
    func start(onTick: @escaping () -> Void) {
        guard !isRunning else { return }
        
        startTime = Date()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { _ in
            onTick()
        }
        
        RunLoop.current.add(timer!, forMode: .common)
    }
    
    func pause(){
        guard isRunning else { return }
        
        accumulatedTime = totalElapsedTime
        timer?.invalidate()
        timer = nil
        startTime = nil
    }
    
    func reset(){
        accumulatedTime = 0
        startTime = nil
        timer?.invalidate()
        timer = nil
    }
}

extension TimeInterval {
    func formatTime() -> String {
        let totalSeconds = Int(self)
        let seconds = totalSeconds % 60
        let minutes = (totalSeconds / 60) % 60
        let hours = minutes>59 ? (totalSeconds / 3600) : 0
        
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
