//
//  SwiftmasApp.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 11/12/24.
//

import SwiftUI

@main
struct SwiftmasApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(Model())
        }
    }
}
