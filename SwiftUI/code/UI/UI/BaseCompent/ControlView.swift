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
