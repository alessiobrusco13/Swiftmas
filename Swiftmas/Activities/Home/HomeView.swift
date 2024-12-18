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
    @Environment(Model.self) var model
    @State private var showingChecklist = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                NavigationTitle()
                DashedDivider()
                
                ScrollView {
                    ChristmasCountdown(minimized: $showingChecklist)
                    
                    if showingChecklist {
                        Text("Map with santa")
                        Text("Presents todo list")
                        Text("Music Button")
                        Text("Snow effect?")
                    }
                }
            }
            .safeAreaPadding(.horizontal)
            .safeAreaInset(edge: .bottom) {
                ToggleChecklistButton(toggled: $showingChecklist)
            }
            .background(alignment: .bottom, content: blurredBackground)
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
