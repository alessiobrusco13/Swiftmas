//
//  ToggleChecklistButton.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 18/12/24.
//

import SwiftmasUI
import SwiftUI

struct ToggleChecklistButton: View {
    @Binding var toggled: Bool
    
    var body: some View {
        HStack {
            Button {
                withAnimation {
                    toggled.toggle()
                }
            } label: {
                HStack {
                    Image(systemName: toggled ? "chevron.left" : "gift.fill")
                    
                    if !toggled {
                        Text("Checklist")
                    }
                }
                .font(.headline)
            }
            .buttonStyle(.pushableProminent(cornerRadius: toggled ? 60 : 16))
            .sensoryFeedback(.success, trigger: toggled)
            .padding()
            
            if toggled {
                Spacer()
            }
        }
    }
}

#Preview {
    ToggleChecklistButton(toggled: .constant(false))
}

