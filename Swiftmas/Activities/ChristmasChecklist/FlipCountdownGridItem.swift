//
//  FlipCountdownGridItem.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 19/12/24.
//

import SwiftmasData
import SwiftmasUI
import SwiftUI

struct FlipCountdownGridItem: View {
    @Environment(Model.self) private var model
    
    var body: some View {
        VStack(alignment: .leading) {
            Label("Christmas Countdown", systemImage: "clock.fill")
                .foregroundStyle(.white)
                .fontWeight(.bold)
            
            Spacer()
            
            FlipCountdown(to: model.christmasDate, digitSize: CGSize(width: 32, height: 50), backgroundStyle: .white.shadow(.inner(radius: 0.6))) { text in
                text
                    .fontWeight(.bold)
            }
        }
        .padding()
        .frame(width: 370, height: 150)
        .background(.red.gradient, in: .rect(cornerRadius: 16))
        
    }
}

#Preview {
    FlipCountdownGridItem()
        .environment(Model())
}

