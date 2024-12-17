//
//  FlipCountdown.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 14/12/24.
//

import SwiftUI

struct FlipCountdown<S: ShapeStyle, V: View>: View {
    let date: Date
    
    let digitSize: CGSize
    let backgroundStyle: S
    let textModifier: (Text) -> V
    
    var components: CountdownComponents {
        CountdownComponents(until: date)
    }
    
    var body: some View {
        TimelineView(.periodic(from: .now, by: 1)) { timeline in
            HStack(spacing: 20) {
                FlipDigit(value: components.minute % 10, size: digitSize, backgroundStyle: backgroundStyle, textModifier: textModifier)
                
                
                ComponentCell(
                    "Days",
                    component: components.day,
                    digitSize: digitSize,
                    backgroundStyle: backgroundStyle,
                    textModifier: textModifier
                )
                
                ComponentCell(
                    "Hrs",
                    component: components.hour,
                    digitSize: digitSize,
                    backgroundStyle: backgroundStyle,
                    textModifier: textModifier
                )
                
                ComponentCell(
                    "Min",
                    component: components.minute,
                    digitSize: digitSize,
                    backgroundStyle: backgroundStyle,
                    textModifier: textModifier
                )
                
                ComponentCell(
                    "Sec",
                    component: components.second,
                    digitSize: digitSize,
                    backgroundStyle: backgroundStyle,
                    textModifier: textModifier
                )
            }
        }
    }
    
    
    init(to date: Date, digitSize: CGSize, backgroundStyle: S, textModifier: @escaping (Text) -> V) {
        self.date = date
        self.digitSize = digitSize
        self.backgroundStyle = backgroundStyle
        self.textModifier = textModifier
    }
}

#Preview {
    FlipCountdown(
        to: Date.now.addingTimeInterval(3*24*60*60),
        digitSize: CGSize(width: 30, height: 60),
        backgroundStyle: .red.shadow(.inner(radius: 1))
    ) { text in
        text
            .font(.system(size: 30).bold())
            .foregroundStyle(.white)
    }
}
