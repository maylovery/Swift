//
//  ContentView.swift
//  YueShi
//
//  Created by Tao Yu on 2024/4/5.
//

import SwiftUI
import Lottie
import RswiftResources
private let rootURLs: [String] = [
    "moon_home",
    "voice_channel",
    "consult_home",
    "message_home",
    "community_home",
]

struct ContentView: View {
    @State var selectIndex = 0
    @SceneStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    
    var body: some View {
        VStack {
            TabView(selection: $selectIndex) {
                MoonHome().tabItem {
                    TabItem(title: "月面",
                            image: R.image.tabItemHomeDefault,
                            selectImage: R.image.tabItemHomeSelected,
                            isSelected: selectIndex == 0)
                }
                VoiceChannel().tabItem {
                    TabItem(title: "聊聊", 
                            image: R.image.tabItemTeaPartyDefault,
                            selectImage: R.image.tabItemTeaPartySelected,
                            isSelected: selectIndex == 1)
                }
                ConsultHome().tabItem {
                    TabItem(title: "聊愈", 
                            image: R.image.tabItemPracticeDefault,                            
                            selectImage: R.image.tabItemPracticeSelected,
                            isSelected: selectIndex == 2)
                }
                MessageHome().tabItem {
                    TabItem(title: "消息", 
                            image: R.image.tabItemMineDefault,
                            selectImage: R.image.tabItemMineSelected,
                            isSelected: selectIndex == 3)
                }
                CommunityHome().tabItem {
                    TabItem(title: "社区", 
                            image: R.image.tabItemCommunityDefault,
                            selectImage: R.image.tabItemCommunitySelected,
                            isSelected: selectIndex == 4)
                }
            }.accentColor(.black)
        }
        .padding()
        .onAppear {
            if isFirstLaunch {
                print("First launch")
                isFirstLaunch = false
            } else {
                print("Not the first launch")
            }
            
            // check loginState 
        }
    }
}

#Preview {
    ContentView()
}

struct TabItem: View {
    var title: String
    var image: RswiftResources.ImageResource
    var selectImage: RswiftResources.ImageResource
    var isSelected: Bool
    var body: some View {
        VStack {
            Text("\(title)").foregroundColor(isSelected ? .black : .gray)
            if isSelected {
                Image(selectImage)
            } else {
                Image(image)
            }
        }
    }
}
