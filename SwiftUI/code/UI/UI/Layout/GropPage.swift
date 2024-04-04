//
//  GropPage.swift
//  UI
//
//  Created by Tao Yu on 2024/4/4.
//

import SwiftUI
/*
 在 SwiftUI 中，Group 是一个容器视图，它允许你将多个视图组合在一起，以便在布局时共享一组视图。Group 通常用于在布局中创建视图的逻辑组合，但不会添加额外的样式或修饰。

 Group 不会影响视图的布局方式，它只是将其包含的视图作为一个整体来处理。因此，在 Group 中添加的视图将按照它们在代码中的顺序来布局。

 */
struct GropPage: View {
    var body: some View {
        VStack {
            // 在这个示例中，我们在两个不同的 Group 中放置了一组文本视图。每个 Group 都有自己的样式修饰，但它们不会影响到其他视图。Group 只是在逻辑上将视图组合在一起，方便管理和处理。
            Group {
                HStack{
                    Text("Hello")
                    Text("World")
                }
                HStack{
                    Text("第")
                    Text("2行")
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            
            Group {
                HStack{
                    Text("This")
                    Text("is")
                    Text("a")
                    Text("group")
                }
                HStack{
                    Text("第")
                    Text("4行")
                }
            }
            .padding()
            .background(Color.green)
            .foregroundColor(Color.white)
            
            Text("下面是GropBox")
            GropBoxPage()
        }

    }
}

#Preview {
    GropPage()
}

struct GropBoxPage: View {
    var body: some View {
        VStack {
            GroupBox(label: Text("Group Box Title")) {
                Text("1-Content inside GroupBox")
                Text("2-Content inside GroupBox")
                Text("3-Content inside GroupBox")
                Text("4-Content inside GroupBox")
            }
            .padding()
        }
    }
}
