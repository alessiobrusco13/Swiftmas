//
//  PushableProminentButtonStyle.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 17/12/24.
//

import SwiftUI

public struct PushableProminentButtonStyle: ButtonStyle {
    let tint: Color
    let cornerRadius: Double
    
    public init(tint: Color, cornerRadius: Double = 16) {
        self.tint = tint
        self.cornerRadius = cornerRadius
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.white)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundStyle(
                        tint
                            .gradient
                            .shadow(.inner(radius: 1))
                            .shadow(.inner(color: .white.opacity(0.2), radius: 10))
                    )
            }
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
    }
}

extension ButtonStyle where Self == PushableProminentButtonStyle {
    public static var pushableProminent: Self {
        PushableProminentButtonStyle(tint: .accentColor)
    }
    
    public static func pushableProminent(tint: Color = .accentColor, cornerRadius: Double = 16) -> Self {
        PushableProminentButtonStyle(tint: tint, cornerRadius: cornerRadius)
    }
}

#Preview {
    Button(action: { print("Pressed") }) {
        Label("Press Me", systemImage: "star")
    }
    .buttonStyle(.pushableProminent)
}
