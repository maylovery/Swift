//
//  ContentView.swift
//  UI
//
//  Created by Tao Yu on 2024/4/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack(spacing: 10) {
            
            NavigationLink { TextView() } label: { Text("UILabel-Text") }
            NavigationLink { TextFieldView() } label: { Text("登陆界面") }
            NavigationLink { ImageView() } label: { Text("图片") }
            NavigationLink { ButtonView() } label: { Text("按钮") }
            NavigationLink { CustomeModiferView() } label: { Text("自定义Modifer") }

            NavigationLink { PickView() } label: { Text("Picker") }

        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
