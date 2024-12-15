//
//  FlipDigit.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 14/12/24.
//

import SwiftUI

struct FlipDigit<T: View, S: ShapeStyle>: View {
    var value: Int
    var cornerRadius = 8
    var size: CGSize
    
    var animation = Animation.easeInOut(duration: 0.2)
    var backgroundStyle: S
    var textModifier: (Text) -> T
    
    @State private var currentValue = 0
    @State private var nextValue = 1
    
    @State private var rotation = 0.0
    
    var body: some View {
        ZStack {
            UnevenRoundedRectangle(topLeadingRadius: 8, topTrailingRadius: 8)
                .fill(backgroundStyle)
                .frame(height: size.height * 0.5)
                .overlay(alignment: .top) {
                    textModifier(Text(nextValue.formatted()))
                        .lineLimit(1)
                        .frame(width: size.width, height: size.height)
                        .drawingGroup()
                }
                .clipped()
                .frame(maxHeight: .infinity, alignment: .top)
            
            UnevenRoundedRectangle(topLeadingRadius: 8, topTrailingRadius: 8)
                .fill(backgroundStyle)
                .frame(height: size.height * 0.5)
                .modifier(
                    RotationModifier(
                        rotation: rotation,
                        currentValue: currentValue,
                        nextValue: nextValue,
                        size: size,
                        textModifier: textModifier
                    )
                )
                .clipped()
                .rotation3DEffect(
                    .degrees(rotation),
                    axis: (x: 1, y: 0, z: 0),
                    anchor: .bottom,
                    anchorZ: 0,
                    perspective: 0.4
                )
                .frame(maxHeight: .infinity, alignment: .top)
                .zIndex(10)
            
            UnevenRoundedRectangle(bottomLeadingRadius: 8, bottomTrailingRadius: 8)
                .fill(backgroundStyle)
                .frame(height: size.height * 0.5)
                .overlay(alignment: .bottom) {
                    textModifier(Text(currentValue.formatted()))
                        .lineLimit(1)
                        .frame(width: size.width, height: size.height)
                        .drawingGroup()
                }
                .clipped()
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .frame(width: size.width, height: size.height)
        .onChange(of: value, initial: true) { oldValue, newValue in
            currentValue = oldValue
            nextValue = newValue
            
            guard rotation == 0 else {
                currentValue = newValue
                return
            }
            
//            guard oldValue != newValue else { return }
            
            withAnimation(animation, completionCriteria: .logicallyComplete) {
                rotation = -180
            } completion: {
                rotation = 0
                currentValue = newValue
            }
        }
    }
}

fileprivate struct RotationModifier<T: View>: ViewModifier, Animatable {
    var rotation: Double
    var currentValue: Int
    var nextValue: Int
    var size: CGSize
    var textModifier: (Text) -> T
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .top) {
                Group {
                    if -rotation > 90 {
                        textModifier(Text(nextValue.formatted()))
                            .lineLimit(1)
                            .scaleEffect(x: 1, y: -1)
                            .transition(.identity)
                    } else {
                        textModifier(Text(currentValue.formatted()))
                            .lineLimit(1)
                            .transition(.identity)
                    }
                }
                .frame(width: size.width, height: size.height)
                .drawingGroup()
            }
    }
}

#Preview {
    @Previewable @State var value = 0
    
    FlipDigit(
        value: value,
        size: CGSize(width: 100, height: 150),
        backgroundStyle: .red.shadow(.inner(radius: 1))
    ) { text in
        text
            .font(.system(size: 100).bold())
            .foregroundStyle(.white)
    }
    
    Button("Increment") {
        value += 1
    }
}
