//
//  SlideMenu.swift
//  UI
//
//  Created by Tao Yu on 2024/4/6.
//

import SwiftUI

class SettingStore: ObservableObject {
    static let shared = SettingStore()
    @Published var isShowMenu: Bool = false
}

// 左滑菜单
struct SlideMenu: View {
    @StateObject var store = SettingStore.shared
    
    // 代码执行返回pop
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presetMode
    
    var body: some View {
        ZStack {
            VStack {
                Text("这是主菜单")
                
                Button {
                    dismiss.callAsFunction()
//                    presetMode.wrappedValue.dismiss()
                } label: {
                    Text("点击返回")
                }
                
                Button {
                    store.isShowMenu = true
                } label: {
                    Text("点击展开")
                }
            }
            SideMenuView(isShowing: $store.isShowMenu)
        }
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    SlideMenu()
}


struct SideMenuView: View {
    @Binding var isShowing: Bool
    // 左侧滑入滑出
    var moveAnimation: AnyTransition = .move(edge: .leading)
    var body: some View {
        ZStack {
            if isShowing {
                // 底部左侧
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                // 左侧内容
                GeometryReader() { geometry in
                    HStack {
                        ScrollView {
                            // 头像，昵称，信息，设置等
                            VStack {
                               Text("头像")
                            }
                            .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            VStack {
                                Text("基本信息")
                            }
                            .frame(height: 100)
                            
                            VStack {
                                Text("设置1")
                                Text("设置2")
                                Text("设置3")
                                Text("设置4")
                                Text("设置5")
                            }
                            .frame(height: 200)
                        }
                        .frame(width: geometry.size.width * 0.7)
                        .background(.white)
                        .transition(moveAnimation)
                        
                        Spacer()
                    }
                    
                }
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom )
        .ignoresSafeArea()
        
        .animation(.easeInOut, value: isShowing)
    }
}
