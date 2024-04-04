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
           List {
               // SegmentedPickerStyle
               Picker("Select an Option", selection: $selectedOption) {
                   ForEach(0..<3) { index in
                       Text(self.options[index])
                   }
               }
               .pickerStyle(SegmentedPickerStyle())
               .padding()

               // MenuPickerStyle
               Picker("Select an Option", selection: $selectedOption) {
                   ForEach(0..<3) { index in
                       Text(self.options[index])
                   }
               }.labelStyle(.titleOnly)
               .pickerStyle(MenuPickerStyle())

               // WheelPickerStyle
               Picker("Select an Option", selection: $selectedOption) {
                   ForEach(0..<3) { index in
                       Text(self.options[index])
                   }
               }
               .pickerStyle(WheelPickerStyle())
               .padding(0)
               
               DatePickView()
           }
           .padding(0)
       }
    /*
     pickerStyle
     
     SegmentedPickerStyle: 分段选择器样式，显示为一组水平的选项。
     PalettePickerStyle: PalettePickerStyle 样式一样
     WheelPickerStyle:     滚轮选择器样式，允许用户通过滚动手势选择选项。
     MenuPickerStyle:      菜单选择器样式，显示为下拉菜单，用户点击后弹出选项列表。
     DefaultPickerStyle:    MenuPickerStyle 类似
     RadioGroupPickerStyle: 单选按钮组样式，选项以单选按钮的形式显示。
     InlinePickerStyle:    内联选择器样式，可以与其他内容一起显示在界面中，而不是作为弹出式菜单或者分段控件 和 WheelPickerStyle 样式一样
     */
}

#Preview {
    PickView()
}


struct DatePickView: View {
    @State private var selectedDate = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        VStack {
            //
            DatePicker("日期选择", selection: $selectedDate, displayedComponents: [.date])
                .datePickerStyle(WheelDatePickerStyle()) // 可选，使用滚轮样式
                .labelsHidden()                         // 可选，隐藏标签
                .frame(maxHeight: 200)
            
            Text("Selected Date: \(selectedDate, formatter: dateFormatter)")
                .padding()
        }
        .padding()
    }
}
