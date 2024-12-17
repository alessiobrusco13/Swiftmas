//
//  Model.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 16/12/24.
//

import Foundation

@MainActor @Observable class Model {
    var christmasDate: Date {
        let currentYear = Calendar.current.component(.year, from: .now)
        
        guard let thisYearChristmas = Calendar.current.date(from: DateComponents(year: currentYear, month: 12, day: 25)) else {
            return .now
        }
        
        if thisYearChristmas < Date.now {
            return Calendar.current.date(byAdding: .year, value: 1, to: thisYearChristmas) ?? .now
        } else {
            return thisYearChristmas
        }
    }
}
