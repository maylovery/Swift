//
//  PickView.swift
//  UI
//
//  Created by Tao Yu on 2024/4/4.
//

import SwiftUI

struct PickView: View {
    @State private var selectedOption = 0
    let options = ["Option 1", "Option 2", "Option 3"]

    var body: some View {
           VStack {
               // SegmentedPickerStyle
               Picker("Select an Option", selection: $selectedOption) {
                   ForEach(0..<3) { index in
                       Text(self.options[index])
                   }
               }
               .pickerStyle(SegmentedPickerStyle())

               Text("Selected Option: \(options[selectedOption])")
                   .padding()
               
               // MenuPickerStyle
               Picker("Select an Option", selection: $selectedOption) {
                   ForEach(0..<3) { index in
                       Text(self.options[index])
                   }
               }
               .pickerStyle(MenuPickerStyle())

               // WheelPickerStyle
               Picker("Select an Option", selection: $selectedOption) {
                   ForEach(0..<3) { index in
                       Text(self.options[index])
                   }
               }
               .pickerStyle(WheelPickerStyle())

               // PalettePickerStyle
               Picker("Select an Option", selection: $selectedOption) {
                   ForEach(0..<3) { index in
                       Text(self.options[index])
                   }
               }
               .pickerStyle(PalettePickerStyle())

               // InlinePickerStyle
               Picker("Select an Option", selection: $selectedOption) {
                   ForEach(0..<3) { index in
                       Text(self.options[index])
                   }
               }
               .pickerStyle(InlinePickerStyle())

               
           }
           .padding()
       }
    /*
     pickerStyle
     SegmentedPickerStyle: 分段选择器样式，显示为一组水平的选项。
     WheelPickerStyle:     滚轮选择器样式，允许用户通过滚动手势选择选项。
     MenuPickerStyle:      菜单选择器样式，显示为下拉菜单，用户点击后弹出选项列表。
     RadioGroupPickerStyle: 单选按钮组样式，选项以单选按钮的形式显示。
     PalettePickerStyle: 
     InlinePickerStyle:    内联选择器样式，可以与其他内容一起显示在界面中，而不是作为弹出式菜单或者分段控件
     */
}

#Preview {
    PickView()
}
