//
//  ActionSheetPage.swift
//  UI
//
//  Created by Tao Yu on 2024/4/5.
//

import SwiftUI

struct ActionSheetPage: View {
    @State private var showingActionSheet = false

    var body: some View {
        Button("Show Action Sheet") {
            showingActionSheet = true
        }.actionSheet(isPresented: $showingActionSheet) {
            ActionSheet(title: Text("Select an Action"),
                        message: Text("What do you want to do?"),
                        buttons: [
                            .default(Text("Action 1")) {
                                // 处理 Action 1
                            },
                            .default(Text("Action 2")) {
                                // 处理 Action 2
                            },
                            .cancel()
                        ]
            )
        }
    }
}

#Preview {
    ActionSheetPage()
}


