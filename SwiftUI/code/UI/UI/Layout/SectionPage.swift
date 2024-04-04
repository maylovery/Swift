//
//  SectionPage.swift
//  UI
//
//  Created by Tao Yu on 2024/4/4.
//

import SwiftUI

/*
 在 SwiftUI 中，
 Section 是用于创建表单或列表中的分组的视图容器。
 它通常与 List 或者 Form 一起使用，用于将相关的内容分组显示。Section 允许你为每个分组添加一个标题，以及可选的页脚和页眉。
 */

struct SectionPage: View {
    var body: some View {
            List {
                Section(header: Text("Section 1")) {
                    Text("Item 1")
                    Text("Item 2")
                }
                
                Section(header: Text("Section 2")) {
                    Text("Item 3")
                    Text("Item 4")
                    Text("Item 5")
                }
                Section(header: Text("Section 3"), footer: Text("Footer Text")) {
                    // Content
                    Text("Item 6")
                    Text("Item 7")
                }
            }
            .listStyle(GroupedListStyle()) // 可选的，设置列表样式
            .navigationBarTitle("List with Sections") // 可选的，设置导航栏标题
        }
}
