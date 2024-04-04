//
//  ButtonView.swift
//  UI
//
//  Created by Tao Yu on 2024/4/4.
//

import SwiftUI

struct ButtonView: View {
    @State private var text = ""

    
    var body: some View {
        VStack(spacing: 10) {
            Button {
                print("====")
            } label: {
                Text("先点击后label")
            }
            
            Button("带图片", image: ImageResource(name: "icon_selected", bundle: Bundle.main)) {
                print("====")
            }
            
            Button {
                print("====")
            } label: {
                HStack(spacing: 10) {
                    Image("login_icon_weixin", bundle: nil)
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                        .scaledToFit()
                    Text("登录")
                }.frame(width: 140, height: 40)
            }
            .background(.red)
            .cornerRadius(10)
            
            
            
            
            NavigationLink(destination: PullDownButtonView()) {
                Text("按钮-点击跳转PullDownButtonView")
            }
            
            NavigationLink(destination: EditButtonView()) {
                Text("EditButtonView")
            }
            
            VStack {
                TextField("输入文本", text: $text)
//                PasteButton(payloadType: String.Type) { value in
//                    text = String(describing: value.first ?? "")
//                }
            }.padding()
            
        }.navigationTitle("按钮")
    }
}

#Preview {
    ButtonView()
}


// 列表左滑删除，BarItem的EditButton， 控制List的编辑状态
struct EditButtonView: View {
    @State private var items = ["Item 1", "Item 2", "Item 3"]

    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
                .onDelete(perform: delete) // 删除
                .onMove(perform: move) // 移动操作
            }
            .navigationBarTitle("Items")
            .navigationBarItems(trailing: EditButton()) // 添加 EditButton 到导航栏
        }
    }

    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }

}

// 监听滚动位置，当滚动到一定位置时显示按钮
struct PullDownButtonView: View {
    @State private var showButton = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(0..<30) { index in
                        Text("Item \(index)")
                            .frame(width: 200, height: 50)
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                }
                .padding()

                GeometryReader { geometry in
                    VStack {
                        if showButton {
                            Button(action: {
                                // 按钮被点击时执行的操作
                                print("Button tapped!")
                            }) {
                                Text("Pull Down Button")
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(10)
                            }
                            .frame(width: geometry.size.width, height: 50)
                            .padding(.top, 20)
                        } else {
                            Spacer()
                                .frame(height: 50)
                        }
                    }
                    .onAppear {
                        // 监听滚动位置，当滚动到一定位置时显示按钮
                        let offsetY = geometry.frame(in: .global).minY
                        if offsetY < 0 {
                            withAnimation {
                                self.showButton = true
                            }
                        } else {
                            withAnimation {
                                self.showButton = false
                            }
                        }
                    }
                }
                .frame(height: 50)
            }
            .navigationBarTitle("Pull Down Button")
        }
    }

}

// 自定义样式 Modifier
