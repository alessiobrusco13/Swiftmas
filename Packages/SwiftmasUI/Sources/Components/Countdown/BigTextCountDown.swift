//
//  ChristmasCountdown.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 15/12/24.
//

import SwiftUI

public struct BigTextCountDown<FooterContent: View>: View {
    let date: Date
    @Binding var minimized: Bool
    
    let footer: () -> FooterContent
    
    var components: CountdownComponents {
        CountdownComponents(until: date)
    }
    
    var enclosingLayout: AnyLayout {
        minimized
        ? AnyLayout(
            HStackLayout(
                alignment: .firstTextBaseline,
                spacing: 5
            )
        )
        : AnyLayout(
            VStackLayout(
                alignment: .leading,
                spacing: -15
            )
        )
    }
    
    public var body: some View {
        TimelineView(.periodic(from: .now, by: 1)) { _ in
            VStack(alignment: .leading, spacing: 0) {
                enclosingLayout {
                    HStack(alignment: .firstTextBaseline, spacing: 0) {
                        Text("\(components.day)")
                        Text(" days,")
                            .font(.system(size: minimized ? 20 : 60))
                            .foregroundStyle(.primary.opacity(0.73))
                    }
                    
                    HStack(alignment: .firstTextBaseline, spacing: 0) {
                        Text("\(components.hour)")
                        Text(" hrs,")
                            .font(.system(size: minimized ? 20 : 60))
                            .foregroundStyle(.primary.opacity(0.73))
                    }
                    
                    HStack(alignment: .firstTextBaseline, spacing: 0) {
                        Text("\(components.minute)")
                        Text(" mins,")
                            .font(.system(size: minimized ? 20 : 60))
                            .foregroundStyle(.primary.opacity(0.73))
                    }
                    
                    HStack(alignment: .firstTextBaseline, spacing: 0) {
                        Text("\(components.second)")
                        Text(" sec ")
                            .font(.system(size: minimized ? 20 : 60))
                            .foregroundStyle(.primary.opacity(0.73))
                    }
                }
                
                footer()
            }
            .contentTransition(.numericText(countsDown: true))
            .animation(.bouncy, value: components)
            .font(.system(size: minimized ? 30 : 90))
            .fontWeight(.bold)
        }
    }
    
    public init(to date: Date, minimized: Binding<Bool> = .constant(false), @ViewBuilder footer: @escaping () -> FooterContent) {
        self.date = date
        _minimized = minimized
        self.footer = footer
    }
}

#Preview {
    BigTextCountDown(to: .now.addingTimeInterval(3*24*60*60), minimized: .constant(false)) {
        Text("Hello there, I'm a footer!")
            .font(.largeTitle)
    }
}
