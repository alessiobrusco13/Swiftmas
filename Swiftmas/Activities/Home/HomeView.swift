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

struct HomeView: View {
    @Environment(Model.self) private var model
    @Environment(\.colorScheme) private var colorScheme
    @State private var showingChecklist = false
    @State private var showingSnowEffect = false
    
    @AccessibilityFocusState private var navTitleFocused: Bool
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Group {
                    switch (colorScheme, showingSnowEffect) {
                    case (.light, true): Color.black
                    case (.light, false): Color.white
                    default: Color.black
                    }
                }
                .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    NavigationTitle()
                        .accessibilityFocused($navTitleFocused)
                    
                    DashedDivider()
                    
                    ScrollView {
                        ChristmasCountdown(minimized: $showingChecklist)
                        
                        if showingChecklist {
                            //                        Text("Map with santa")
                            //                        Text("Presents todo list")
                            //                        Text("Music Button")
                            //                        Text("Snow effect?")
                            
                            ChristmasChecklist(showingSnowEffect: $showingSnowEffect)
                                .transition(
                                    .move(edge: .bottom)
                                    .combined(with: .scale)
                                    .combined(with: .opacity)
                                )
                        }
                    }
                }
                .toolbar(.hidden)
                .safeAreaPadding(.horizontal)
                .safeAreaInset(edge: .bottom) {
                    ToggleChecklistButton(toggled: $showingChecklist)
                }
                .background(alignment: .bottom, content: blurredBackground)
                
                if showingSnowEffect {
                    StormView(type: .snow, direction: .zero, strength: 300)
                        .allowsHitTesting(false)
                }
            }
        }
        .colorScheme(showingSnowEffect ? .dark : colorScheme)
        .onAppear {
            navTitleFocused = true
        }
    }
    
    func blurredBackground() -> some View {
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

#Preview {
    HomeView()
        .environment(Model())
}
