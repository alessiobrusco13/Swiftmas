//
//  ResidueView.swift
//  Weather
//
//  Created by Alessio Garzia Marotta Brusco on 28/02/22.
//

import SwiftUI

public struct ResidueView: View {
    let residue: Residue

    public var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                residue.update(date: timeline.date, size: size)

                for drop in residue.drops {
                    var contextCopy = context

                    let xPos = drop.x * size.width
                    let yPos = drop.y * size.height

                    contextCopy.opacity = drop.opacity
                    contextCopy.translateBy(x: xPos, y: yPos)
                    contextCopy.scaleBy(x: drop.scale, y: drop.scale)
                    contextCopy.draw(residue.image, at: .zero)
                }
            }
        }
    }

    public init(type: Storm.Contents, strength: Double) {
        residue = Residue(type: type, strength: strength)
    }
}

struct ResidueView_Previews: PreviewProvider {
    static var previews: some View {
        ResidueView(type: .snow, strength: 200)
            .background(Color(red: 0, green: 0, blue: 0.2, opacity: 1))
    }
}
