//
//  StackPage.swift
//  UI
//
//  Created by Tao Yu on 2024/4/8.
//

import SwiftUI

struct StackPage: View {
    var body: some View {
        List {
            Section("Stack") {
                //包括leading、trailing、center
                VStack(alignment:.leading, spacing: 20){
                    Text("orange").background(.orange).font(.caption)
                    Text("red").background(.red).font(.title)
                    Text("blue").background(.blue).font(.largeTitle)
                    Text("yellow").background(.yellow).font(.callout)
                }
                .border(.gray)
                
                //包括bottom、top、firstTextBaseline、lastTextBaseline、center、
                HStack(alignment:.bottom, spacing: 20){
                    Text("orange").background(.orange).font(.caption)
                    Text("red").background(.red).font(.title)
                    Text("blue").background(.blue).font(.largeTitle)
                    Text("yellow").background(.yellow).font(.callout)
                }
                .border(.gray)
                
                //包括leading、trailing、bottom、top、bottomLeading、topLeading、bottomtrailing、toptrailing、center
                ZStack(alignment: .bottomTrailing){
                    Text("orange").background(.orange).font(.caption)
                    Text("red").background(.red).font(.title)
                    Text("blue").background(.blue).font(.largeTitle)
                    Text("yellow").background(.yellow).font(.callout)
                }
                .border(.gray)
            }
            
            Section("Position") {
                VStack (spacing:50){
                    // 文字边框 green 偏移20.25.。 原内容边框 是灰色
                    Text("Offset by passing CGSize()")
                        .border(Color.green)
                        .offset(CGSize(width: 20, height: 25))
                        .border(Color.gray)
                    
                    Text("Offset by passing horizontal & vertical distance")
                        .border(Color.green)
                        .offset(x: 20, y: 50)
                        .border(Color.gray)
                }
            }
            
            Section("绝对位置position") {
                // 距离父视图的偏移量 
                Text("Position by passing a CGPoint()")
                    .background(Color.blue)
                    .position(CGPoint(x: 100, y: 100))
                    .background(Color.green)
                    
                Text("Position by passing the x and y coordinates")
                    .background(Color.blue)
                    .position(CGPoint(x: 100, y: 100))
                    .background(Color.green)
            }
            
            
        }
    }
}
/*
 ViewBuilder是VStack包装的底层实现

 
 */

#Preview {
    StackPage()
}
