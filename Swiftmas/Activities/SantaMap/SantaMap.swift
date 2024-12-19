//
//  SantaMap.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 19/12/24.
//

import MapKit
import SwiftmasData
import SwiftmasUI
import SwiftUI

// TODO: Pulsate Santa's location.

struct SantaMap: View {
    @Environment(Model.self) private var model
    
    var body: some View {
        PathMap(
            startCoordinates: Model.santaLocation,
            endCoordinates: model.userLocation?.coordinate ?? .init(),
            progress: model.santaProgress,
            overlayLabel: "Santa"
        ) {
            Circle()
                .fill(.accent.gradient)
                .frame(width: 20, height: 20)
                .shadow(radius: 10)
                .padding(5)
                .background(.white, in: .circle)
                .compositingGroup()
                .shadow(color: .accent.opacity(0.3), radius: 10)
        }       
    }
}

#Preview {
    SantaMap()
        .environment(Model())
}
