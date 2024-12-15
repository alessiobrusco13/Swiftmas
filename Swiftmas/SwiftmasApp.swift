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
            FlipCountdown(
                to: Date.now.addingTimeInterval(3*24*60*60),
                digitSize: CGSize(width: 30, height: 60),
                backgroundStyle: .red.shadow(.inner(radius: 1))
            ) { text in
                text
                    .font(.system(size: 30).bold())
                    .foregroundStyle(.white)
            }
        }
    }
}
