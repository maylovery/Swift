//
//  PopOverPage.swift
//  UI
//
//  Created by Tao Yu on 2024/4/5.
//

import SwiftUI


struct PopOverPage: View {
    @State private var showPopover = false   //控制显示或隐藏小气泡，初始状态为隐藏
    var body: some View {
        VStack {
            Text("Tap Me!")   //创建一个文字标签
                .padding()
                .onTapGesture {   //为文字标签添加点击手势
                    self.showPopover.toggle()   //点击文字切换气泡显示或隐藏
                }
                .background(     //气泡作为文字标签背景
                    Group {       //使用Group包装气泡以便在需要时显示
                        if showPopover {  //当showPopover为true时，创建气泡
                            VStack {
                                Text("Hello, I'm popover!") //气泡中显示的文字
                                    .padding()
                                    .foregroundColor(.white) //文字颜色为白色
                                    .background(Color.blue)  //气泡背景颜色为蓝色
                                    .cornerRadius(10)  //气泡圆角设为10
                            }
                            .transition(.move(edge: .top))  //气泡出现和消失时的动画
                            .animation(.default)
                        }
                    }
                )
        }
    }

}

#Preview {
    PopOverPage()
}


/*
 当用户点击文本时，showingPopover 状态将被切换，从而触发小气泡的显示和隐藏。
 arrowEdge 参数指定了小气泡的箭头位置，这里我们设置为顶部。
 此效果是开全界面
 */
struct PopOverPage1: View {
    @State private var showingPopover = false
    var body: some View {
        Text("Click me")
            .padding()
            .onTapGesture {
                showingPopover.toggle()
            }
            .popover(isPresented: $showingPopover, arrowEdge: .top) {
                Text("Popover Content")
                    .padding()
            }
    }
}

