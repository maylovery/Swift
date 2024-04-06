//
//  ContentView.swift
//  SearchUserDemo
//
//  Created by Tao Yu on 2024/4/6.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("去点击搜索用户，callApi, ViewModel 实现Api 调用，数据双向绑定")
                
                NavigationLink {
                    SearchUserView()
                } label: {
                    Text("去搜索")
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
