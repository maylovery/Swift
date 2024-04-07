//
//  SearchablePage.swift
//  UI
//
//  Created by Tao Yu on 2024/4/7.
//

import SwiftUI

struct SearchablePage: View {
    /*
     如果给List添加.searchable，必须配合NavigationView
     给Text添加搜索框，可以给搜索框添加可选值，还可以给这些值设置响应
     */
    
    @ObservedObject fileprivate var vm = ViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.filtedItems) {item in
                    NavigationLink(item.name, destination:  item.detailView)
                }
            }
            .navigationTitle(Text("搜索页面"))
            .searchable(text: $vm.searchedItem, prompt: "输入您想要搜索的省会名称")
        }
    }
}

#Preview {
    SearchablePage()
}

//创建一个model项
fileprivate struct ItemModel: Identifiable {
    var id = UUID()
    var name: String
    var detailView: DetailView
}

//创建一个详情View
fileprivate struct DetailView: View, Identifiable {
    var id = UUID()
    var detail: String
    @State var text = ""
    var body: some View {
        VStack (alignment: .leading){
            Text(detail)
                .font(.largeTitle)
                .foregroundColor(.gray).bold()
                .searchable(text: $text){
                    Text("大同").searchCompletion("大同")
                    Text("太原").searchCompletion("太原")
                    Text("太原").searchCompletion("太原")
                    Text("太原").searchCompletion("太原")
                    Text("太原").searchCompletion("太原")
                }
            Spacer()
        }
       
    }
}

//定义一个数组
fileprivate let datas: [ItemModel] = [
    ItemModel(name: "太原", detailView: DetailView(detail: "山西省会")),
    ItemModel(name: "西安", detailView: DetailView(detail: "陕西省会")),
    ItemModel(name: "银川", detailView: DetailView(detail: "宁夏省会")),
    ItemModel(name: "西宁", detailView: DetailView(detail: "青海省会")),
    ItemModel(name: "呼和浩特", detailView: DetailView(detail: "内蒙省会")),
    ItemModel(name: "郑州", detailView: DetailView(detail: "河南省会"))
]

//创建一个viewModel，提供了数组项
//并且还有一个filtedItems用来过滤每一项
fileprivate class ViewModel: ObservableObject {
    
    @Published var allItems: [ItemModel] = datas
    @Published var searchedItem: String = ""
    // 如果有 searchedItem就是过滤之后的值
    var filtedItems: [ItemModel] {
        searchedItem.isEmpty ? allItems : allItems.filter({ str in
            str.name.lowercased().contains(searchedItem.lowercased())
        })
    }
}
