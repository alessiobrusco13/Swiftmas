//
//  FlipCountdownCell.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 14/12/24.
//

import SwiftUI

extension FlipCountdown {
    struct Digit: Identifiable, Animatable {
        let id = UUID()
        var value: Int
        
        var animatableData: Int {
            get { value }
            set { value = newValue}
        }
    }
    
    struct ComponentCell: View {
        let component: Int
        let header: String
        
        let digitSize: CGSize
        let backgroundStyle: S
        let textModifier: (Text) -> V
        
        private var digits: [Digit] {
            component
                .formatted(.number.precision(.integerLength(2...3)))
                .compactMap { Int(String($0)) }
                .map { Digit(value: $0) }
        }
        
        var body: some View {
            VStack(alignment: .leading, spacing: 1) {
                Text(header)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                
                HStack {
                    ForEach(digits) { digit in
                        FlipDigit(
                            value: digit.value,
                            size: digitSize,
                            backgroundStyle: backgroundStyle,
                            textModifier: textModifier
                        )
                    }
                }
            }
        }
        
        init(
            _ header: String,
            component: Int,
            digitSize: CGSize,
            backgroundStyle: S,
            textModifier: @escaping (Text) -> V
        ) {
            self.component = component
            self.header = header
            self.digitSize = digitSize
            self.backgroundStyle = backgroundStyle
            self.textModifier = textModifier
        }
    }
}

#Preview {
    FlipCountdown.ComponentCell(
        "Hrs",
        component: 23,
        digitSize: CGSize(width: 100, height: 150),
        backgroundStyle: .red.shadow(.inner(radius: 1))
    ) { text in
        text
            .font(.system(size: 100).bold())
            .foregroundStyle(.white)
    }
}
