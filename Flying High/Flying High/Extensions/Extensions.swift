//
//  TimeInterval.swift
//  Flying High
//
//  Created by Ulisses Bonfim on 15/06/26.
//

import Foundation

extension Optional where Wrapped == TimeInterval {
    func formatTimeString() -> String {
        guard let self = self else { return "00:00:00" }

        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad // Garante os zeros à esquerda (00:00:00)
        
        return formatter.string(from: self) ?? "00:00:00"
    }
    
    func formatTimeStringExtended() -> String {
        guard let self = self else { return "00 min" }

        let totalSeconds = Int(self)
        let minutes = (totalSeconds / 60) % 60
        let hours = totalSeconds / 3600
        
        if hours == 0 {
            return "\(minutes) min"
        }
        if minutes == 0 {
            return "\(hours)h"
        }
        
        return "\(hours)h \(minutes)min"
        
//        let hourString = hours == 1 ? "1 hora" : "\(hours) horas"
//        let minuteString = minutes == 1 ? "1 minuto" : "\(minutes) minutos"
//
//        if hours == 0 {
//            return minuteString
//        }
//
//        if minutes == 0 {
//            return hourString
//        }
//
//        let formattedHour = String(format: "%02d", hours)
//        let formattedMinute = String(format: "%02d", minutes)
//
//        let hourSuffix = hours == 1 ? "hora" : "horas"
//        let minuteSuffix = minutes == 1 ? "minuto" : "minutos"
//
//        return "\(formattedHour) \(hourSuffix) \(formattedMinute) \(minuteSuffix)"
    }

}
