//
//  PathMap.swift
//  SwiftmasUI
//
//  Created by Alessio Garzia Marotta Brusco on 18/12/24.
//

import MapKit
import SwiftUI

public struct PathMap<OverlayContent: View>: View {
    let startCoordinates: CLLocationCoordinate2D
    let endCoordinates: CLLocationCoordinate2D
    let controlOffset: CLLocationCoordinate2D
    let segmentCount: Int
    let progress: Double?
    let overlayLabel: String?
    let overlayContent: () -> OverlayContent
    
    public init(
        startCoordinates: CLLocationCoordinate2D,
        endCoordinates: CLLocationCoordinate2D,
        controlOffset: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 10, longitude: -10),
        segmentCount: Int = 300,
        progress: Double,
        overlayLabel: String,
        @ViewBuilder overlayContent: @escaping () -> OverlayContent
    ) {
        self.startCoordinates = startCoordinates
        self.endCoordinates = endCoordinates
        self.controlOffset = controlOffset
        self.segmentCount = segmentCount
        self.progress = progress
        self.overlayLabel = overlayLabel
        self.overlayContent = overlayContent
    }
    
    public var body: some View {
        Map {
            MapPolyline(coordinates: curve())
                .stroke(.red.opacity(0.98), style: StrokeStyle(lineWidth: 10, lineCap: .round))
            
            if let progress, let overlayLabel {
                Annotation(
                    overlayLabel,
                    coordinate: pointOnCurve(withControl: controlPoint(), progress: progress),
                    content: overlayContent
                )
            }
            
        }
    }
    
    func curve() -> [CLLocationCoordinate2D] {
        let control = controlPoint()
        var curvePoints = [CLLocationCoordinate2D]()
        
        for i in 0...segmentCount {
            let t = Double(i) / Double(segmentCount)
            let point = pointOnCurve(withControl: control, progress: t)
            
            curvePoints.append(point)
        }
        
        return curvePoints
    }
    
    func pointOnCurve(
        withControl control: CLLocationCoordinate2D,
        progress t: Double
    ) -> CLLocationCoordinate2D {
        let lat = (1 - t)*(1 - t)*startCoordinates.latitude
                  + 2*(1 - t)*t*control.latitude
                  + t*t*endCoordinates.latitude
        
        let lon = (1 - t)*(1 - t)*startCoordinates.longitude
                  + 2*(1 - t)*t*control.longitude
                  + t*t*endCoordinates.longitude
        
        return CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
    
    func controlPoint() -> CLLocationCoordinate2D {
        let midLat = (startCoordinates.latitude + endCoordinates.latitude) / 2.0
        let midLon = (startCoordinates.longitude + endCoordinates.longitude) / 2.0
        
        return CLLocationCoordinate2D(latitude: midLat + controlOffset.latitude, longitude: midLon + controlOffset.longitude)
    }
}

extension PathMap where OverlayContent == EmptyView {
    public init(
        startCoordinates: CLLocationCoordinate2D,
        endCoordinates: CLLocationCoordinate2D,
        controlOffset: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 10, longitude: -10),
        segmentCount: Int = 300
    ) {
        self.startCoordinates = startCoordinates
        self.endCoordinates = endCoordinates
        self.controlOffset = controlOffset
        self.segmentCount = segmentCount
        progress = nil
        overlayLabel = nil
        overlayContent =  { EmptyView() }
    }
}

#Preview {
    PathMap(
        startCoordinates: .init(latitude: 66.5039, longitude: 25.7294),
        endCoordinates: .init(latitude: 40.8518, longitude: 14.2681),
        progress: 0.8,
        overlayLabel: "Point on map"
    ) {
        Circle()
            .frame(width: 32, height: 32)
    }
}
