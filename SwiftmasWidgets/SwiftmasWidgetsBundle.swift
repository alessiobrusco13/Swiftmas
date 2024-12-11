//
//  SwiftmasWidgetsBundle.swift
//  SwiftmasWidgets
//
//  Created by Alessio Garzia Marotta Brusco on 11/12/24.
//

import WidgetKit
import SwiftUI

@main
struct SwiftmasWidgetsBundle: WidgetBundle {
    var body: some Widget {
        SwiftmasWidgets()
        SwiftmasWidgetsControl()
        SwiftmasWidgetsLiveActivity()
    }
}
