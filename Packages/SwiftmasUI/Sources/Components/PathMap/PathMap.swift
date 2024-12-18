//
//  PathMap.swift
//  SwiftmasUI
//
//  Created by Alessio Garzia Marotta Brusco on 18/12/24.
//

import MapKit
import SwiftUI

struct PathMap: View {
    let startCoordinates: CLLocationCoordinate2D
    let endCoordinates: CLLocationCoordinate2D
    
    var body: some View {
        Map {
            MapPolyline(coordinates: generateQuadraticCurvePoints(from: startCoordinates, to: endCoordinates, controlOffset: 20))
                .stroke(Color.red, lineWidth: 2)
        }
    }
    
    func generateQuadraticCurvePoints(
        from start: CLLocationCoordinate2D,
        to end: CLLocationCoordinate2D,
        controlOffset: Double
    ) -> [CLLocationCoordinate2D] {
        // Find the midpoint between start and end
        let midLat = (start.latitude + end.latitude) / 2.0
        let midLon = (start.longitude + end.longitude) / 2.0
        
        // Place control point directly above the midpoint
        let control = CLLocationCoordinate2D(latitude: midLat + controlOffset, longitude: midLon)
        
        let steps = 100
        var curvePoints = [CLLocationCoordinate2D]()
        
        for i in 0...steps {
            let t = Double(i) / Double(steps)
            
            // Quadratic Bézier formula
            let lat = (1 - t)*(1 - t)*start.latitude
                      + 2*(1 - t)*t*control.latitude
                      + t*t*end.latitude
            
            let lon = (1 - t)*(1 - t)*start.longitude
                      + 2*(1 - t)*t*control.longitude
                      + t*t*end.longitude
            
            curvePoints.append(CLLocationCoordinate2D(latitude: lat, longitude: lon))
        }
        
        return curvePoints
    }
}

#Preview {
    PathMap(
        startCoordinates: .init(latitude: 66.5039, longitude: 25.7294),
        endCoordinates: .init(latitude: 40.8518, longitude: 14.2681)
    )
}
