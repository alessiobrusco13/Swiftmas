//
//  NavigationTitle.swift
//  Swiftmas
//
//  Created by Alessio Garzia Marotta Brusco on 12/12/24.
//

import SwiftUI

struct NavigationTitle: View {
    let today = Date.now
    
    var body: some View {
        HStack {
            HStack(alignment: .firstTextBaseline) {
                Text(abbreviatedWeekday)
                    .font(.system(size: 50).weight(.heavy))
            
                Image(systemName: "app.gift.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.accent.gradient)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(monthAndDay)
                    .foregroundStyle(.secondary)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text(year)
                    .foregroundStyle(.tertiary)
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .padding(.top)
    }
    
    var abbreviatedWeekday: String {
        today.formatted(.dateTime.weekday(.abbreviated))
    }
    
    var monthAndDay: String {
        today.formatted(.dateTime.month(.wide).day())
    }
    
    var year: String {
        today.formatted(.dateTime.year())
    }
}

#Preview {
    NavigationTitle()
}
