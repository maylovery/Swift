//
//  TimelinePage.swift
//  UI
//
//  Created by Tao Yu on 2024/4/7.
//

import SwiftUI

struct TimelinePage: View {
    var body: some View {
        VStack {
            Text("TimelineControl")
        }
    }
}

#Preview {
    TimelinePage()
}

struct TimelineControl<Schedule, Content> where Schedule : TimelineSchedule {
    
}
