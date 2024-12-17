//
//  HomeView.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 15/12/24.
//

import MapKit
import SwiftmasData
import SwiftmasUI
import SwiftUI

public struct HomeView: View {
    @State private var minimized = false
    @Environment(Model.self) var model
    
    public init() {
        
    }
    
    public var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                NavigationTitle()
                DashedDivider()
                
                ScrollView {
                    ChristmasCountdown(minimized: $minimized)
                }
            }
            .safeAreaPadding(.horizontal)
            .safeAreaInset(edge: .bottom) {
                Button("Presents", systemImage: "gift.fill") {
                    withAnimation {
                        minimized.toggle()
                    }
                }
                .font(.headline)
                .buttonStyle(.pushableProminent)
                .padding(.bottom, 3)
                .sensoryFeedback(.success, trigger: minimized)
            }
            .background(alignment: .bottom) {
                GeometryReader { geometry in
                    Circle()
                        .fill(.red.opacity(0.6))
                        .blur(radius: 80)
                        .position(
                            x: geometry.frame(in: .global).midX,
                            y: geometry.frame(in: .global).maxY + 10
                        )
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .environment(Model())
}
