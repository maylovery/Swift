//
//  ContentView.swift
//  CombieStudy
//
//  Created by Tao Yu on 2024/4/8.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            List {
                NavigationLink("计算器demo") {
                    Calculator()
                }                
            }
        }
        .navigationTitle(Text("计算器"))
        .padding()
    }
}

#Preview {
    ContentView()
}
