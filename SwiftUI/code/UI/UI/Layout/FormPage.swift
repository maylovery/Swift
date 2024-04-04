//
//  FormPage.swift
//  UI
//
//  Created by Tao Yu on 2024/4/4.
//

import SwiftUI
/*
 
 NavigationView 是 SwiftUI 中的一个容器视图，用于在应用程序中管理导航和视图层次结构。它提供了导航栏和导航视图的基本功能，使得你可以在应用程序中轻松地设置和管理多个视图之间的导航关系。

 NavigationView 主要有以下用途：

 提供导航栏: NavigationView 在顶部提供了一个导航栏，你可以在其中添加标题、按钮、搜索栏等内容，并且可以方便地控制导航栏的外观和行为。

 管理视图堆栈: NavigationView 可以管理一个视图堆栈，使得你可以在多个视图之间进行导航。你可以通过 NavigationLink 将视图添加到导航堆栈中，并在用户点击导航链接时自动导航到相应的视图。

 支持后退导航: 在导航堆栈中，用户可以通过向后导航栏的返回按钮返回到上一个视图。NavigationView 自动处理了后退导航的行为，你不需要额外的代码来实现后退功能。

 提供默认样式和行为: NavigationView 提供了默认的导航样式和行为，包括动画过渡、视图切换等。你可以根据需要自定义导航的外观和行为，但通常情况下，使用默认的导航行为就可以满足大部分需求
 
 
 */
// Form 表单 分成三个section 基本信息 联系信息 Submit
struct FormPage: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var age = ""
    @State private var email = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("基本信息")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Age", text: $age)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("联系信息")) {
                    TextField("邮箱", text: $email)
                        .keyboardType(.emailAddress)
                }
                
                Section {
                    Button(action: {
                        // Perform form submission action here
                        print("Submit button tapped")
                    }) {
                        Text("Submit")
                    }
                }
            }
            .navigationBarTitle("个人信息")
        }
    }
}

#Preview {
    FormPage()
}
