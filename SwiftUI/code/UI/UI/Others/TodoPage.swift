//
//  TodoPage.swift
//  UI
//
//  Created by Tao Yu on 2024/4/8.
//

import SwiftUI

#Preview {
    TodoPage()
}


struct Todo {
    let name: String
    let category: String
}

struct TodoPage: View {
    
    @State private var todos = [
        Todo(name:"Write SwiftUI book",category: "work"),
        Todo(name:"Read Bible",category: "personal"),
        Todo(name:"Bring kids out to play",category: "family"),
        Todo(name:"Fetch wife",category: "family"),
        Todo(name:"family",category: "family")
    ]
    @State private var showAddTodoView = false
    
    func addTodo(){
        todos.append(Todo(name: "newTodo", category: "work"))
    }
    
    var body: some View {
        NavigationView{
            List{
                ForEach(todos, id:\.name){ (todo) in
                    
                    NavigationLink(destination:
                        VStack{
                             Text(todo.name)
                             Image(todo.category)
                                 .resizable()
                                 .frame(width: 200, height: 200)
                         }
                     ){
                        HStack{
                            Image(todo.category) .resizable().frame(width: 50, height: 50)
                            Text(todo.name)
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    //加给单个item的
                    todos.remove(atOffsets: indexSet)
                })
                .onMove(perform: { indices, newOffset in
                    //设置位置可移动
                    todos.move(fromOffsets: indices, toOffset: newOffset)
                })
            }
            .navigationBarTitle("Todo Items")
            .navigationBarItems(
                leading: Button(action: {
                    self.showAddTodoView.toggle()
                },
                label: {
                    Text("Add")
                }).sheet(isPresented: $showAddTodoView){
                    AddTodoView(showAddTodoView: self.$showAddTodoView, todos: self.$todos)
                },
                trailing: EditButton()
            )
        }
    }
}

struct AddTodoView: View {
    @Binding var showAddTodoView: Bool
    @State private var name: String = ""
    @State private var selectedCategory = 0
    var categoryTypes = ["family","personal","work"]
    // 反向传值
    @Binding var todos: [Todo]
    
    var body: some View {
        
        VStack{
            Text("Add Todo").font(.largeTitle)
            TextField("To Do name",text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.black).padding()
            Text("Select Category")
            Picker("",selection: $selectedCategory){
                ForEach(0 ..< categoryTypes.count){
                    Text(self.categoryTypes[$0])
                }
            }.pickerStyle(SegmentedPickerStyle())
        }.padding()

        Button(action: {
            self.showAddTodoView = false
            todos.append(Todo(name: name, category: categoryTypes[selectedCategory]))
        },
        label: {
            Text("Done")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portraitUpsideDown)
        }
    }
}
