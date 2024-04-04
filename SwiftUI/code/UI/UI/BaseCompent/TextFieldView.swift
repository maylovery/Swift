//
//  TextFieldView.swift
//  UI
//
//  Created by Tao Yu on 2024/4/4.
//

import SwiftUI

struct TextFieldView: View {
    @State var name = ""
    @State var password = ""

    let namePlace = Text("请输入昵称")
    let passPlace = Text("请输入密码")

    var body: some View {
        VStack(spacing: 10) {
            HStack{
                Text("昵称：")
                TextField("请输入昵称", text: $name)
                    .padding(10)
                    .frame(height: 50)
                    .textFieldStyle(.roundedBorder)
            }
            HStack{
                Text("密码：")
                SecureField("请输入密码", text: $password)
                    .padding(10)
                    .frame(height: 50)
                    .textFieldStyle(.roundedBorder)
            }
            Button("登陆") {
                print("登陆--\(name)-\(password)")
            }
        }.offset(y: -120)
            .padding(20)
    }
}

#Preview {
    TextFieldView()
}
