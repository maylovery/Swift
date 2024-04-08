//
//  PushPopPage.swift
//  UI
//
//  Created by Tao Yu on 2024/4/8.
//

import SwiftUI

struct SuccessView: View {
    var body: some View {
        Text("Success View")
            .navigationTitle("Success")
    }
}

struct FailureView: View {
    var body: some View {
        Text("Failure View")
            .navigationTitle("Failure")
    }
}

struct PushPopPage: View {
    @State private var showDetailView = false
    @State private var isSuccess = false // 根据接口返回的结果设定
    
    var body: some View {
        VStack {
            Button("Push Detail View") {
                // 模拟接口调用
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    // 根据 isSuccess 来决定是否推送不同的目标视图
                    self.showDetailView = true
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            NavigationLink(
                destination: {
                    if isSuccess {
                        return AnyView(SuccessView())
                    } else {
                        return AnyView(FailureView())
                    }
                }(),
                isActive: $showDetailView
            ) {
                EmptyView()
            }
            .hidden() // 隐藏实际的导航链接
        }
    }
}

#Preview {
    PushPopPage()
}
