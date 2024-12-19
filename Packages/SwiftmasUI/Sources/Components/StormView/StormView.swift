//
//  StormView.swift
//  Weather
//
//  Created by Alessio Garzia Marotta Brusco on 28/02/22.
//

import SwiftUI

public struct StormView: View {
    let storm: Storm

    public var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                storm.update(date: timeline.date, size: size)

                for drop in storm.drops {
                    var contextCopy = context

                    let xPos = drop.x * size.width
                    let yPos = drop.y * size.height

                    contextCopy.opacity = drop.opacity
                    contextCopy.translateBy(x: xPos, y: yPos)
                    contextCopy.rotate(by: drop.direction + drop.rotation)
                    contextCopy.scaleBy(x: drop.xScale, y: drop.yScale)
                    contextCopy.draw(storm.image, at: .zero)
                }
            }
        }
        .ignoresSafeArea()
    }

    public init(type: Storm.Contents, direction: Angle, strength: Int) {
        storm = Storm(type: type, direction: direction, strength: strength)
    }
}

struct StormView_Previews: PreviewProvider {
    static var previews: some View {
        StormView(type: .rain, direction: .zero, strength: 200)
            .background(Color(red: 0, green: 0, blue: 0.2, opacity: 1))
    }
}
