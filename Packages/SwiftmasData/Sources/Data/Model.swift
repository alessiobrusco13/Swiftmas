//
//  Model.swift
//  SwiftmasData
//
//  Created by Alessio Garzia Marotta Brusco on 16/12/24.
//

import Foundation
import CoreLocation

@MainActor @Observable
public class Model: NSObject, @preconcurrency CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    let calendar = Calendar.current
    
    public var userLocation: CLLocation?
    public static var santaLocation = CLLocationCoordinate2D(latitude: 66.5039, longitude: 25.7294) // North Finland
    
    public override init() {
        super.init()
        locationManager.delegate = self
    }
    
    public var christmasDate: Date {
        let currentYear = calendar.component(.year, from: .now)
        
        guard let thisYearChristmas = Calendar.current.date(from: DateComponents(year: currentYear, month: 12, day: 25)) else {
            return .now
        }
        
        if thisYearChristmas < Date.now {
            return Calendar.current.date(byAdding: .year, value: 1, to: thisYearChristmas) ?? .now
        } else {
            return thisYearChristmas
        }
    }
    
    public func requestLocationAuthorization() {
        locationManager.desiredAccuracy = kCLLocationAccuracyReduced
        locationManager.requestWhenInUseAuthorization()
    }
    
    public func requestUserLocation() {
        locationManager.requestLocation()
    }
    
    public var santaProgress: Double {
        let currentYear = calendar.component(.year, from: .now)
        
        guard
            let firstOfDecember = Calendar.current.date(from: DateComponents(year: currentYear, month: 12, day: 1)),
            firstOfDecember < Date.now,
            Date.now < christmasDate
        else {
            return 0
        }
        
        return Date.now.timeIntervalSince(firstOfDecember) / christmasDate.timeIntervalSince(firstOfDecember)
    }
    
    // MARK: - CLLocationManagerDelegate Methods
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        userLocation = locations.first
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error.localizedDescription)
    }
}
