//
//  ChristmasChecklist.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 17/12/24.
//

import SwiftmasData
import SwiftUI

struct ChristmasChecklist: View {
    @Binding var showingSnowEffect: Bool
    
    var body: some View {
        VStack {
            HStack {
                SantaMapGridItem()
                
                SnowEffectGridItem(showingSnowEffect: $showingSnowEffect)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ChristmasChecklist(showingSnowEffect: .constant(false))
        .environment(Model())
}
