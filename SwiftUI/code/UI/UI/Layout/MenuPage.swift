//
//  MenuPage.swift
//  UI
//
//  Created by Tao Yu on 2024/4/6.
//

import SwiftUI

struct MenuPage: View {
    var body: some View {
        Menu {
            Button {
                
            } label: {
                Text("Play")
                    .foregroundColor(.white)
            }
            
            Button {
                
            } label: {
                Text("Play next")
                    .foregroundColor(.white)
            }
            
            Button {
                
            } label: {
                Text("Add to playlist queue")
                    .foregroundColor(.white)
            }
            
            
            Button {
                
            } label: {
                Text("Add to playlist")
                    .foregroundColor(.white)
            }
            
            
            Button {
                
            } label: {
                Text("Rename")
                    .foregroundColor(.white)
            }
            
            
            Button {
                
            } label: {
                Text("Tag Editor")
                    .foregroundColor(.white)
            }
            
            
            Button {
                
            } label: {
                Text("Go to artist")
                    .foregroundColor(.white)
            }
            
            Button {
                
            } label: {
                Text("Delete form device")
                    .foregroundColor(.white)
            }
            
            Button {
                
            } label: {
                Text("Share")
                    .foregroundColor(.white)
            }
            

        } label: {
            Text("更多")
        }
        .environment(\.colorScheme, .dark)

    }
}

#Preview {
    MenuPage()
}
