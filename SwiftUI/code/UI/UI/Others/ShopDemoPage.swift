//
//  ShopDemoPage.swift
//  UI
//
//  Created by Tao Yu on 2024/4/8.
//

import SwiftUI

struct ShopDemoPage: View {
    var ScreenWidth = UIScreen.main.bounds.size.width
    var img2 = ""
    var img1 = ""
    @State var items: [String] = ["1", "2", "3"]
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Divider()
                        .padding(EdgeInsets.init(top: 20, leading: 20, bottom: 0, trailing: 20))
                        .overlay {
                            AsyncImage(url: URL.init(string: img2), content: { img in
                                img.resizable()
                            }, placeholder: {
                                ProgressView()
                            })
                            .frame(width: 50, height: 50)
                            .cornerRadius(25)
                            .overlay {
                                Text("83").frame(width: 32, height: 20)
                                    .background(.red)
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                                    .padding(EdgeInsets.init(top: -30, leading: 30, bottom: 0, trailing: 0))
                                }
                            .padding(EdgeInsets.init(top: -64, leading: 300, bottom: 0, trailing: 0))
                        
                        // 左右滑动
                        TabView {
                           ForEach($items, id: \.self) {_ in
                               VStack {
                                   HStack {
                                       Text("重磅更新").foregroundColor(.blue).fontWeight(.bold)
                                       Spacer()
                                   }
                                   HStack {
                                       Text("地下城堡3：魂之诗").font(.title)
                                       Spacer()
                                   }
                                   HStack {
                                       Text("新地图“废械阵”上线").font(.title2).foregroundColor(.gray)
                                       Spacer()
                                   }
                                   AsyncImage(url: URL.init(string: img1)) { img in
                                       img.resizable()
                                   } placeholder: {
                                       ProgressView()
                                   }
                                   .frame(height: 220)
                                   .cornerRadius(10)
                                   .overlay {
                                       VStack {
                                           Spacer()
                                           HStack {
                                               AsyncImage(url: URL.init(string: img2)) { img in
                                                   img.resizable()
                                               } placeholder: {
                                                   ProgressView()
                                               }
                                               .frame(width: 50, height: 50).cornerRadius(12)
                                               VStack {
                                                   HStack {
                                                       Text("地下城堡3：魂之诗").foregroundColor(.white).font(.title3)
                                                       Spacer()
                                                   }
                                                   HStack {
                                                       Text("暗黑文字地牢探险").foregroundColor(.gray)
                                                       Spacer()
                                                   }
                                               }
                                               Spacer()
                                               VStack {
                                                   Button("获取") {
                                                       print("get")
                                                   }.foregroundColor(.white).font(Font.system(.title2).bold()).frame(width: 94, height: 40).background(.gray.opacity(0.8)).cornerRadius(20)
                                                   Text("App内购买").foregroundColor(.gray).font(.footnote)
                                               }.padding(.top, 15)
                                           }
                                           .padding(EdgeInsets.init(top: 0, leading: 16, bottom: 6, trailing: 16))
                                           .background(LinearGradient(colors: [.black.opacity(0.5), .clear], startPoint: .bottom, endPoint: .top)).cornerRadius(12)
                                       }
                                   }
                               }.padding(20)
                           }
                       }
                       .frame(width: ScreenWidth, height: 320)
                       .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        
                        
                        // 左右滑动的 tabblecell
                        VStack {
                           HStack {
                               Text("我们都在玩").font(.title).bold()
                               Spacer()
                               Button("查看全部") {
                                   print("all")
                               }.font(.title2)
                           }
                           HStack {
                               Text("探索本周游戏热点").foregroundColor(.gray).font(.title2)
                               Spacer()
                           }
                       }.padding(EdgeInsets.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                        
                        
                        TabView {
                            ForEach($items, id: \.self) {_ in
                                List(0..<3) {_ in
                                    HStack {
                                        AsyncImage(url: URL.init(string: img1)) { img in
                                            img.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 68, height: 68).cornerRadius(16)
                                        VStack {
                                            HStack {
                                                Text("地下城堡3：魂之诗").font(.title3)
                                                Spacer()
                                            }
                                            HStack {
                                                Text("暗黑文字地牢探险").foregroundColor(.gray)
                                                Spacer()
                                            }
                                        }
                                        Spacer()
                                        VStack {
                                            Button("获取") {
                                                print("get")
                                            }.foregroundColor(.blue).font(Font.system(.title2).bold()).frame(width: 94, height: 40).background(.gray.opacity(0.2)).cornerRadius(20)
                                            Text("App内购买").foregroundColor(.gray).font(.footnote)
                                        }
                                    }
                                }.listStyle(InsetListStyle())//.listRowSeparator(.hidden)
                            }
                        }
                        .frame(width: ScreenWidth, height: 270)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        
                    }
                }
            }
        }.navigationTitle("游戏")
    }
}

#Preview {
    ShopDemoPage()
}
