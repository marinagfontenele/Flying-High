//
//  TimeInterval.swift
//  Flying High
//
//  Created by Ulisses Bonfim on 15/06/26.
//

import Foundation

extension Optional where Wrapped == TimeInterval {
    func formatToPositional() -> String {
        guard let self = self else { return "00:00:00" }

        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        return formatter.string(from: self) ?? "00:00:00"
    }
    
    func formatToAbbreviated() -> String {
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
    }
}

extension TimeInterval {
    func formatToPositional() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        return formatter.string(from: self) ?? "00:00:00"
    }
    
    func formatToFriendly() -> String {
        let totalSeconds = Int(self)
        let minutes = (totalSeconds / 60) % 60
        let hours = totalSeconds / 3600
        
        var resultMinutes: String
        var resultHours: String
        
        if hours == 0 {
            return "\(minutes) minutos"
        }
        if minutes == 0 {
            return "\(hours) horas"
        }
        if minutes == 1 {
            resultMinutes = "1 minuto"
        }
        if hours == 1 {
            resultHours = "1 hora"
        }
        
        resultMinutes = minutes == 1 ? "1 minuto" : "\(minutes) minutos"
        resultHours = hours == 1 ? "1 hora" : "\(hours) horas"
        
        return "\(resultHours) \(resultMinutes)"
    }
        
    func formatToAbbreviated() -> String {
        let totalSeconds = Int(self)
        let minutes = (totalSeconds / 60) % 60
        let hours = totalSeconds / 3600
        
        if hours == 0 {
            return "\(minutes)min"
        }
        if minutes == 0 {
            return "\(hours)h"
        }
        
        return "\(hours)h \(minutes)min"
    }
}

extension Optional where Wrapped == Date {
    func formatDateString() -> String {
        guard let date = self else { return "01/01/2001" }
        
        return date.formatted(date: .numeric, time: .shortened)
    }
}
