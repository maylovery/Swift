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
                NavigationLink { TextView() } label: { Text("UILabel-Text") }
                NavigationLink { TextFieldView() } label: { Text("登陆界面") }
                NavigationLink { ImageView() } label: { Text("图片") }
                NavigationLink { ButtonView() } label: { Text("按钮") }
                NavigationLink { CustomeModiferView() } label: { Text("自定义Modifer") }
                
                NavigationLink { PickView() } label: { Text("Picker") }
                NavigationLink { ControlView() } label: { Text("ControlView") }
                
                NavigationLink { WebView() } label: { Text("UIKit-WebView") }
                NavigationLink { UIKitVC() } label: { Text("UIKit-VC") }
                
                NavigationLink { ListView() } label: { Text("ListView") }
                NavigationLink { ScrollDemoView() } label: { Text("ScrollDemoView") }
                NavigationLink { CollectionPage() } label: { Text("CollectionPage") }

                NavigationLink { GropPage() } label: { Text("GropPage") }
                NavigationLink { SectionPage() } label: { Text("SectionPage") }
                NavigationLink { FormPage() } label: { Text("FormPage") }
                NavigationLink { TabPage() } label: { Text("底部Tabbar") }
                
                // Modal, PopOver
                NavigationLink { AlertPage() } label: { Text("AlertPage") }
                NavigationLink { ActionSheetPage() } label: { Text("ActionSheetPage") }
                NavigationLink { ModalPage() } label: { Text("ModalPage") }
                NavigationLink { PopOverPage() } label: { Text("PopOverPage") }
                NavigationLink { MenuPage() } label: { Text("点击更多Menu弹窗") }

                NavigationLink { GirdPage() } label: { Text("GirdPage") }
                
                NavigationLink { SlideMenu() } label: { Text("左侧菜单") }
                
                NavigationLink { ProgressSliderPage() } label: { Text("滑动条") }
                
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
