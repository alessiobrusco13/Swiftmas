//
//  SnowEffectGridItem.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 19/12/24.
//

import SwiftmasUI
import SwiftUI

struct SnowEffectGridItem: View {
    @Binding var showingSnowEffect: Bool
    
    var body: some View {
        Button {
            withAnimation {
                showingSnowEffect.toggle()
            }
        } label: {
            VStack(alignment: .leading) {
                Image(systemName: "cloud.snow.fill")
                    .font(.system(size: 50).weight(.bold))
                
                Spacer()
                
                Text(showingSnowEffect ? "So long, snow!" : "Let it snow!")
                    .fontWeight(.bold)
            }
            .frame(width: 150, height: 150, alignment: .leading)
        }
        .buttonStyle(.pushableProminent)
        .sensoryFeedback(.impact, trigger: showingSnowEffect)
    }
}

#Preview {
    SnowEffectGridItem(showingSnowEffect: .constant(false))
}
