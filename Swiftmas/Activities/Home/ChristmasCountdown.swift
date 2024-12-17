//
//  ChristmasCountdown.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 15/12/24.
//

import SwiftmasData
import SwiftmasUI
import SwiftUI

struct ChristmasCountdown: View {
    @Environment(Model.self) private var model
    @Binding var minimized: Bool
    
    var body: some View {
        BigTextCountDown(to: model.christmasDate, minimized: $minimized) {
            (
                Text("until ")
                +
                Text("Christmas")
                    .foregroundStyle(.red.gradient)
                    .fontWeight(.black)
                    .fontWidth(.expanded)
            )
            .font(.system(size: minimized ? 30 : 55))
        }
        .padding(.vertical)
    }
}

#Preview {
    ChristmasCountdown(minimized: .constant(false))
        .environment(Model())
}
