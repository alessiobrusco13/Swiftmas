//
//  ChristmasChecklist.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 17/12/24.
//

import SwiftUI

struct ChristmasChecklist: View {
    var body: some View {
        Grid(alignment: .topLeading) {
            SantaMapGridItem()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ChristmasChecklist()
}
