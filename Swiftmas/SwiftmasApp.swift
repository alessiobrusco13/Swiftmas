//
//  SwiftmasApp.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 11/12/24.
//

import SwiftmasData
import SwiftUI

@main
struct SwiftmasApp: App {
    @State private var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(model)
                .onAppear {
                    model.requestLocationAuthorization()
                    model.requestUserLocation()
                }
        }
    }
}
