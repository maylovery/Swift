//
//  AlertPage.swift
//  UI
//
//  Created by Tao Yu on 2024/4/5.
//

import SwiftUI

struct AlertPage: View {
    @State var showAlert = false
    var body: some View {
        Button("Show Alert") {
            showAlert = true
        }
        .alert(isPresented: $showAlert) {
            // 系统样式
            Alert(
                title: Text("确定删除吗？"),
                message: Text("删除之后无法恢复？"),
                primaryButton: .default(Text("确定").foregroundColor(.red).font(.largeTitle), action: {
                    print("Button 1 is tapped.")
                }),
                secondaryButton: .default(Text("取消").foregroundColor(.orange), action: {
                    print("Button 2 is tapped.")
                })
            )
        }
    }
}

#Preview {
    AlertPage()
}


// 封装自定义样式Alert?

