//
//  ListView.swift
//  UI
//
//  Created by Tao Yu on 2024/4/4.
//

import SwiftUI

struct ListView: View {
    let items = ["Item 1", "Item 2", "Item 3"]
    var body: some View {
        List {
            Text("Item 1")
            Text("Item 2")
            Text("Item 3")
            
            ForEach(items, id: \.self) { item in
                Text(item)
            }
        }
    }
}

#Preview {
    ListView()
}


struct ScrollDemo1View: View {
    // 使用 ScrollViewReader 和proxy 监听滚动，设置id,指定滚动到位置
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                ScrollViewReader { proxy in
                    VStack {
                        ForEach(1..<100) { index in
                            Text("Item \(index)")
                                .id(index)
                                .frame(width: geometry.size.width * 0.8, height: 50)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                                .padding()
                        }
                    }
                    .padding()
                    .onAppear {
                        withAnimation {
                            proxy.scrollTo(20)
                        }
                    }
                }
            }
            .background(Color.gray)
        }
    }
}
// 直接监听 geometry.frame(in: .global).minY ，拿不到数据
struct ScrollDemoView: View {
    @State private var offset: CGFloat = 0
    var body: some View {
        VStack {
            Text("ScrollView offset: \(offset)")
            ScrollView {
                
                ForEach(1...100, id: \.self) { i in
                    Text("Row \(i)")
                }.padding()

                GeometryReader { geometry in
                    Text("占位")
                        .frame(height: 20)
                        .onAppear {
                            withAnimation {
                                print("\(geometry.frame(in: .global).minY)")
                                self.offset = geometry.frame(in: .global).minY
                            }
                        }
                }
                
                
            }
        }
    }
}


// 真实可以拿到滚动数据
struct ScrollDemo2View: View {
    @State private var offset: CGFloat = 0
    var body: some View {
        VStack {
            Text("ScrollView offset: \(offset)")
            ScrollView {
                GeometryReader { geometry in
                    Color.clear.preference(key: OffsetPreferenceKey.self, value: geometry.frame(in: .global).minY)
                }
                .frame(height: 0)
                
                ForEach(1...100, id: \.self) { i in
                    Text("Row \(i)")
                        .padding()
                }
            }
            .onPreferenceChange(OffsetPreferenceKey.self) {
                self.offset = $0
            }
        }
    }
}

struct OffsetPreferenceKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = value + nextValue()
    }
}
