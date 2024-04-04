//
//  UIApp.swift
//  UI
//
//  Created by Tao Yu on 2024/4/4.
//

import SwiftUI

@main
struct UIApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .navigationViewStyle(.stack)

        }
    }
}
