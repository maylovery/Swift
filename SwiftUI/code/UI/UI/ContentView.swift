//
//  ContentView.swift
//  UI
//
//  Created by Tao Yu on 2024/4/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List {
                Section("基础组件") {
                    NavigationLink { TextView() } label: { Text("UILabel-Text") }
                    NavigationLink { TextFieldView() } label: { Text("登陆界面") }
                    NavigationLink { ImageView() } label: { Text("图片") }
                    NavigationLink { ButtonView() } label: { Text("按钮") }
                    NavigationLink { CustomeModiferView() } label: { Text("自定义Modifer") }
                    
                    NavigationLink { PickView() } label: { Text("Picker") }
                    NavigationLink { ControlView() } label: { Text("ControlView") }
                    NavigationLink { LinkPage() } label: { Text("文字-链接") }
                    NavigationLink { ProgressSliderPage() } label: { Text("滑动条") }
                }
                Section("转换") {
                    NavigationLink { WebView() } label: { Text("UIKit-WebView") }
                    NavigationLink { UIKitVC() } label: { Text("UIKit-VC") }
                }
                
                Section("布局") {
                    NavigationLink { ListView() } label: { Text("ListView") }
                    NavigationLink { ScrollDemoView() } label: { Text("ScrollDemoView") }
                    NavigationLink { CollectionPage() } label: { Text("CollectionPage") }
                    NavigationLink { GirdPage() } label: { Text("GirdPage") }
                    NavigationLink { SlideMenu() } label: { Text("左侧菜单") }
                    
                    NavigationLink { GropPage() } label: { Text("GropPage") }
                    NavigationLink { SectionPage() } label: { Text("SectionPage") }
                    NavigationLink { FormPage() } label: { Text("FormPage") }
                    NavigationLink { TabPage() } label: { Text("底部Tabbar") }
                }
                Section("弹窗") {
                    // Modal, PopOver
                    NavigationLink { AlertPage() } label: { Text("AlertPage") }
                    NavigationLink { ActionSheetPage() } label: { Text("ActionSheetPage") }
                    NavigationLink { ModalPage() } label: { Text("ModalPage") }
                    NavigationLink { PopOverPage() } label: { Text("PopOverPage") }
                    NavigationLink { MenuPage() } label: { Text("点击更多Menu弹窗") }
                }
                
                NavigationLink { ToolBarPage() } label: { Text("ToolBarPage") }
                NavigationLink { GradientPage() } label: { Text("GradientPage") }
                
                NavigationLink { SearchablePage() } label: { Text("搜素 SearchablePage") }

                
            }.padding(.top, 0)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
