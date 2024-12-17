//
//  DashedDivider.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 15/12/24.
//

import SwiftUI

public struct DashedDivider: View {
    public init() { }
    
    public var body: some View {
        Line()
            .stroke(.secondary, style: StrokeStyle(lineWidth: 2, lineCap: .round, dash: [8]))
            .frame(maxWidth: .infinity, maxHeight: 1)
    }
}

#Preview {
    DashedDivider()
}
