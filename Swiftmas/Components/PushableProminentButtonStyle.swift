//
//  PushableProminentButtonStyle.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 17/12/24.
//

import SwiftUI

struct PushableProminentButtonStyle<S: Shape>: ButtonStyle {
    let tint: Color
    let shape: S
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.white)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(
                        tint
                            .gradient
//                            .shadow(.drop(color: tint.opacity(0.35), radius: 6))
                            .shadow(.inner(radius: 1))
                            .shadow(.inner(color: .white.opacity(0.2), radius: 10))
                    )
            }
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
//            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}

extension ButtonStyle where Self == PushableProminentButtonStyle<RoundedRectangle> {
    static var pushableProminent: Self {
        PushableProminentButtonStyle(tint: .accentColor, shape: RoundedRectangle(cornerRadius: 16))
    }
    
    static func pushableProminent(tint: Color) -> Self {
        PushableProminentButtonStyle(tint: tint, shape: RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    Button(action: { print("Pressed") }) {
        Label("Press Me", systemImage: "star")
    }
    .buttonStyle(.pushableProminent)
}
