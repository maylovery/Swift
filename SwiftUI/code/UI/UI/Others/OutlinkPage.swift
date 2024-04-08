//
//  OutlinkPage.swift
//  UI
//
//  Created by Tao Yu on 2024/4/8.
//

import SwiftUI
// 可以通过路由 跳转到此界面， 设置 onOpenURL 的处理

struct OutlinkPage: View {
    @State var show = true
     @State var tabSelection = 1
     var body: some View {
         TabView(selection: $tabSelection) {
             Text("Tab Content 1").tabItem {
                 Image(systemName: "person")
                 Text("Tab Label 1")
             }.tag(1).badge(Text("news"))
             
             Text("Tab Content 2").tabItem {
                 Image(systemName: "person")
                 Text("Tab Label 2")
             }.tag(2)
         }.onOpenURL { url in
             switch url.host {
             case "tab1":
                 tabSelection = 1
             case "tab2":
                 tabSelection = 2
             default:
                 show.toggle()
             }
         }
         .sheet(isPresented: $show) {
             Text("URL参数错误")
         }
     }
}

#Preview {
    OutlinkPage()
}
