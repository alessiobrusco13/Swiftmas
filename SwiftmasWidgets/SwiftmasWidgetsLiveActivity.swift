//
//  SwiftmasWidgetsLiveActivity.swift
//  SwiftmasWidgets
//
//  Created by Alessio Garzia Marotta Brusco on 11/12/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct SwiftmasWidgetsAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct SwiftmasWidgetsLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SwiftmasWidgetsAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension SwiftmasWidgetsAttributes {
    fileprivate static var preview: SwiftmasWidgetsAttributes {
        SwiftmasWidgetsAttributes(name: "World")
    }
}

extension SwiftmasWidgetsAttributes.ContentState {
    fileprivate static var smiley: SwiftmasWidgetsAttributes.ContentState {
        SwiftmasWidgetsAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: SwiftmasWidgetsAttributes.ContentState {
         SwiftmasWidgetsAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: SwiftmasWidgetsAttributes.preview) {
   SwiftmasWidgetsLiveActivity()
} contentStates: {
    SwiftmasWidgetsAttributes.ContentState.smiley
    SwiftmasWidgetsAttributes.ContentState.starEyes
}
