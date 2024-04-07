//
//  ControlView.swift
//  UI
//
//  Created by Tao Yu on 2024/4/4.
//

import SwiftUI

struct ControlView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            ToggleView()
            SliderView()
            StepView()
            ProgressPage()
        }.padding(.horizontal, 16)
    }
}

#Preview {
    ControlView()
}


struct ToggleView: View {
    @State var isON = false
    var body: some View {
        Toggle(isON ? "打开" : "关闭", isOn: $isON)
    }
}

struct SliderView: View {
    @State private var offset: Float = 0.0
    var body: some View {
        VStack {
            Text("滑动进度：\(offset)")
            Slider(value: $offset)
        }
    }
}


struct StepView: View {
    @State private var value: Int = 0
    var body: some View {
        VStack {
            Text("总计：\(value)")
            Stepper("每次加减2", value: $value, step: 2)
        }
    }
}


struct ProgressPage: View {
    @State var value: Float = 0
    @State var total: Float = 100

    var body: some View {
        VStack {
            ProgressView("开始", value: value, total: total)
            ProgressView().progressViewStyle(.circular)
            
            Button {
                value += 1
            } label: {
                Text("加1")
            }

        }
    }
}
