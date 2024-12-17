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
    public var userLocation: CLLocation?
    
    public override init() {
        super.init()
        locationManager.delegate = self
    }
    
    public var christmasDate: Date {
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
    
    public func requestLocationAuthorization() {
        locationManager.desiredAccuracy = kCLLocationAccuracyReduced
        locationManager.requestWhenInUseAuthorization()
    }
    
    public func requestUserLocation() {
        locationManager.requestLocation()
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        userLocation = locations.first
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error.localizedDescription)
    }
}
