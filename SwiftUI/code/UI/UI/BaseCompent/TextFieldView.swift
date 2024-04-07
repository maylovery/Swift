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

    @State var str = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Section("TextField") {
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
            }
            
            Section("TextEditor") {
                TextEditor(text:.constant("Placeholder"))
                    .frame(width: 100, height: 30, alignment: .center)
            }
            
            
            Section("TextField") {
                //TextField，预览无法操作
                TextField("首字母默认大写", text: $str).frame(width: 100, height: 56, alignment: .center)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)    //自动纠错
//                    .border(.red, width: 1)
//                    .cornerRadius(20)
                    .overlay{
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.red, lineWidth: 10)
                            .padding(-10)
                    }
                    .onSubmit {
                        print("我点击了！")
                    }
                    .contentShape(Rectangle())  //追加热区设置
                    .onTapGesture {
                        print("tap")
                        //热区
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
            }
        }.offset(y: -120)
            .padding(20)
    }
}

#Preview {
    TextFieldView()
}
