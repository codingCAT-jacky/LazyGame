//
//  Page1View.swift
//  LazyGame
//
//  Created by User15 on 11/7/22.
//

import SwiftUI

struct Page1View: View {
  @State private var isExpanded1 = true
  @State private var isExpanded2 = false
  @State private var TeacherIndex = 1
  @State private var bgcolor = Color.gray
    let studentarr = [
      Student(name: "小學生", difficulty: 3),
      Student(name: "國中生", difficulty: 4),
      Student(name: "高中生", difficulty: 2),
      Student(name: "大學生", difficulty: 1),
      Student(name: "研究生", difficulty: 0)
    ]
    let teacherarr = [
      teacher(name:"彼得潘" , gender:"男", hard: "0", description: "輕鬆翹課 沒問題的"),
      teacher(name:"馬尚彬" , gender:"男", hard: "3", description: ""),
      teacher(name:"程華懷" , gender:"男", hard: "5", description: ""),
      teacher(name:"張雅惠" , gender:"女", hard: "1", description: ""),
      teacher(name:"胖虎" , gender:"男", hard: "10", description: "")
    ]
    let gender : String
    let StudentType : String
    var body: some View {

      ZStack{
        VStack{
          
          Image("睡覺學生")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
          Text("你是一個平常打ＬＯＬ打到吐的學生")
          Text("於是你需要一些時間翹課來補眠")
          Text("不過翹課可不能被老師發現了")
          Text("警慎的選擇翹課的日子避開老師的點名！")
          Spacer()
          List{
            DisclosureGroup(isExpanded: $isExpanded1) {
              VStack(alignment: .leading) {
                  ForEach(teacherarr.indices) { teacher1 in
                    DisclosureGroup(teacherarr[teacher1].name){
                      VStack{
                        Text("性別:" + teacherarr[teacher1].gender )
                        HStack{
                            Text("難易度:" + teacherarr[teacher1].hard)
                            Image(systemName:"star")
                        }
                        Text(teacherarr[teacher1].description)
                      }

                    } 
                  }
              }
                Picker(selection: $TeacherIndex, label: Text("選擇要挑戰的老師"), content: {
                  ForEach(teacherarr.indices){ item in
                    Text(teacherarr[item].name)
                  }
                    Text("隨機")
                }).pickerStyle(SegmentedPickerStyle())
            } label: {
                Label("可挑戰的老師", systemImage: "lock.open.fill")
            }
            
          }
            
            
            
          ColorPicker("為你的懶學生選顏色", selection: $bgcolor)
        }
      }.background(bgcolor)
        
    }
}

struct Page1View_Previews: PreviewProvider {
    static var previews: some View {
      Page1View(gender: "男",StudentType: "小學生")
    }
}

struct Student: Identifiable{
    let id = UUID()
    let name: String
    let difficulty: Int

}
struct teacher: Identifiable{
    let id = UUID()
    let name: String
    let gender: String
    let hard: String
    let description: String
    
}


