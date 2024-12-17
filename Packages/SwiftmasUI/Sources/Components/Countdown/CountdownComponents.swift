//
//  CountdownComponents.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 15/12/24.
//

import Foundation

public struct CountdownComponents: Equatable {
    public let day: Int
    public let hour: Int
    public let minute: Int
    public let second: Int
    
   public init(day: Int = 0, hour: Int = 0, minute: Int = 0, second: Int = 0) {
        self.day = day
        self.hour = hour
        self.minute = minute
        self.second = second
    }
    
    public init(from dateComponents: DateComponents) {
        day = dateComponents.day ?? 0
        hour = dateComponents.hour ?? 0
        minute = dateComponents.minute ?? 0
        second = dateComponents.second ?? 0
    }
    
    public init(until date: Date, calendar: Calendar = .current) {
        let components = calendar.dateComponents([.day, .hour, .minute, .second], from: .now, to: date)
        self.init(from: components)
    }
}
