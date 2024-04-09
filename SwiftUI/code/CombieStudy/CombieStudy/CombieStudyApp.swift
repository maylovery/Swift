//
//  CombieStudyApp.swift
//  CombieStudy
//
//  Created by Tao Yu on 2024/4/8.
//

import SwiftUI

@main
struct CombieStudyApp: App {
    @State var title = "CombieDemo"
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }.navigationTitle(title)
        }
    }
}
