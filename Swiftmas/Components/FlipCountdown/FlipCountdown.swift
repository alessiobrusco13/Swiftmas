//
//  FlipCountdown.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 14/12/24.
//

import SwiftUI

struct FlipCountdown<S: ShapeStyle, V: View>: View {
    struct Components {
        let day: Int
        let hour: Int
        let minute: Int
        let second: Int
        
        init(day: Int = 0, hour: Int = 0, minute: Int = 0, second: Int = 0) {
            self.day = day
            self.hour = hour
            self.minute = minute
            self.second = second
        }
        
        init(from dateComponents: DateComponents) {
            day = dateComponents.day ?? 0
            hour = dateComponents.hour ?? 0
            minute = dateComponents.minute ?? 0
            second = dateComponents.second ?? 0
        }
    }
    
    let date: Date
    
    let digitSize: CGSize
    let backgroundStyle: S
    let textModifier: (Text) -> V
    
    var countdownComponents: Components {
        let components = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: .now, to: date)
        return Components(from: components)
    }
    
    var body: some View {
        TimelineView(.periodic(from: .now, by: 1)) { timeline in
            HStack(spacing: 20) {
                FlipDigit(value: countdownComponents.minute % 10, size: digitSize, backgroundStyle: backgroundStyle, textModifier: textModifier)
                
                
                ComponentCell(
                    "Days",
                    component: countdownComponents.day,
                    digitSize: digitSize,
                    backgroundStyle: backgroundStyle,
                    textModifier: textModifier
                )
                
                ComponentCell(
                    "Hrs",
                    component: countdownComponents.hour,
                    digitSize: digitSize,
                    backgroundStyle: backgroundStyle,
                    textModifier: textModifier
                )
                
                ComponentCell(
                    "Min",
                    component: countdownComponents.minute,
                    digitSize: digitSize,
                    backgroundStyle: backgroundStyle,
                    textModifier: textModifier
                )
                
                ComponentCell(
                    "Sec",
                    component: countdownComponents.second,
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
