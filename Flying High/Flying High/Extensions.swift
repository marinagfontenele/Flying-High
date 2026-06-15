//
//  Extensions.swift
//  Flying High
//
//  Created by Davi Carvalho Barbosa de Menezes on 15/06/26.
//

import SwiftUI

extension TimeInterval {
    func stringFormatted() -> String {
        let interval = Int(self)
        let minutes = (interval / 60) % 60
        let hours = (interval / (60*60)) % 60
        
        print(minutes)
        
        if (hours == 0) {
            return String(format: "%02d minutos", minutes)
        }
        else {
            return String(format: "%02d horas %02d minutos", hours, minutes)
        }
    }
}
