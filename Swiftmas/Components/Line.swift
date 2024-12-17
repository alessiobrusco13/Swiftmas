//
//  Line.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 15/12/24.
//

import SwiftUI

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addLine(to:  CGPoint(x: rect.maxX, y: 0))
        
        return path
    }
}

#Preview {
    Line()
}
