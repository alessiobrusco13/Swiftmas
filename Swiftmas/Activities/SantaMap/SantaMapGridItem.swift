//
//  SantaMapGridItem.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 19/12/24.
//

import SwiftmasData
import SwiftUI

struct SantaMapGridItem: View {
    @Environment(Model.self) private var model
    @Namespace private var namespace
    
    var body: some View {
        NavigationLink {
            SantaMapView()
                .navigationTransition(.zoom(sourceID: "santaMapView", in: namespace))
                .environment(model)
        } label: {
            VStack(alignment: .leading) {
            SantaMap()
                .disabled(true)
                .frame(width: 150, height: 150)
                .clipShape(.rect(cornerRadius: 6))
                .navigationTransition(.zoom(sourceID: "santaMapItem", in: namespace))
                
                Label("Santa Traker", systemImage: "location.viewfinder")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
            }
            .padding(10)
            .background(.accent.gradient, in: .rect(cornerRadius: 16))
        }
        
    }
}

#Preview {
    NavigationStack {
        SantaMapGridItem()
            .environment(Model())
            .toolbar(.hidden)
    }
}
