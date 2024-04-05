//
//  TabPage.swift
//  UI
//
//  Created by Tao Yu on 2024/4/5.
//

import SwiftUI

struct TabPage: View {
    @State private var selection: Int = 0

    var body: some View {
        ZStack {
            // TabView 内容
            TabView(selection: $selection) {
                TabItemPage(index: 0, text: "微信")
                    .tabItem {
                        Image(systemName: "message.fill")
                        Text("微信")
                    }
                    .tag(0)
        
                TabItemPage(index: 1, text: "通讯录")
                    .tabItem {
                        Image(systemName: "person.wave.2")
                        Text("通讯录")
                    }
                    .tag(1)
                
                TabItemPage(index: 2, text: "发现")
                    .tabItem {
                        Image(systemName: "sparkle.magnifyingglass")
                        Text("发现")
                    }
                    .tag(2)
                
                TabItemPage(index: 3, text: "我")
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("我")
                    }
                    .tag(3)
            }
            .accentColor(.green) // 设置选项卡图标和标题颜色
        }
        .onChange(of: selection, { oldValue, newValue in
            // 根据选中状态更新背景色
            print("Selection changed to \(newValue)")
        })
    }
}

fileprivate struct TabItemPage: View {
    var index: Int
    var text: String
    var body: some View {
        ZStack {
            Color(red: 233.0/255.0, green: 233.0/255.0, blue: 233.0/255.0).edgesIgnoringSafeArea(.top)
            VStack {
                Text("\(text)")
                Button {
                    print("---")
                } label: {
                    Text("去\(text)")
                }

            }
        }
    }
}

#Preview {
    TabPage()
}
