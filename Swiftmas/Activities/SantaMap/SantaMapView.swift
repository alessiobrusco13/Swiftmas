//
//  SantaMapView.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 19/12/24.
//

import SwiftmasData
import SwiftUI

struct SantaMapView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        SantaMap()
            .toolbar(.hidden)
            .safeAreaInset(edge: .top) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Label("Minimize Map", systemImage: "xmark")
                            .font(.headline)
                    }
                    .labelStyle(.iconOnly)
                    .buttonStyle(.pushableProminent)
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
    }
}

#Preview {
    SantaMapView()
        .environment(Model())
}