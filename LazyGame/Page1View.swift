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
  @State private var showpage2 = false
    @State private var difficulty = 0
    let gender : String
    @Binding var StudentType : String
    let name: String
    var filterStudents : [Student]{
        Student.demoStudent.filter{ (student1) -> Bool in
        student1.name == StudentType
      }
    }
    
    var body: some View {
        
      ZStack{
       
        VStack{
//            Button("回到上一頁"){
//                showfirstpage=false
//            }
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
                ForEach(teacher.demoTeacher.indices) { teacher1 in
                    DisclosureGroup(teacher.demoTeacher[teacher1].name){
                      VStack{
                        Text("性別:" + teacher.demoTeacher[teacher1].gender )
                        HStack{
                            Text("難易度:" + teacher.demoTeacher[teacher1].hard)
                            Image(systemName:"star")
                        }
                        Text(teacher.demoTeacher[teacher1].description)
                      }

                    } 
                  }
              }
                Label("選擇要挑戰的老師", systemImage: "lock.open.fill")
                Picker(selection: $TeacherIndex, label: Text("選擇要挑戰的老師"), content: {
                  ForEach(teacher.demoTeacher.indices){ item in
                    Text(teacher.demoTeacher[item].name)
                  }
                    Text("隨機")
                }).pickerStyle(SegmentedPickerStyle())
               
                
            } label: {
                Label("可挑戰的老師", systemImage: "lock.open.fill")
            }
            Spacer()
            Button{
                print(StudentType)
                showpage2 = true
                difficulty = filterStudents[0].difficulty
                print("filter=" + filterStudents[0].name)
            }label: {
                Text(" 開始挑戰！")
                  .font(.system(size: 35))
                  .foregroundColor(Color.white)
                  .background(Color.red)
              }
            .fullScreenCover(isPresented: $showpage2, content: {
                Page2View(gender: gender, StudentType: filterStudents[0].name, name: name, selectedTeacher: teacher.demoTeacher[TeacherIndex].name, difficulty:difficulty, showsecondpage: $showpage2)
            }).offset(x: 85, y: 0)
          }
           

            
          ColorPicker("為你的懶學生選顏色", selection: $bgcolor)
        }
      }.background(bgcolor)
        
    }
}

struct Page1View_Previews: PreviewProvider {
    static var previews: some View {
        Page1View(gender: "男",StudentType: .constant("小學生") , name: "jacky")
    }
}

struct Student: Identifiable{
    let id = UUID()
    let name: String
    let difficulty: Int
}
extension Student{
  static let demoStudent = [
    Student(name: "小學生", difficulty: 3),
    Student(name: "國中生", difficulty: 4),
    Student(name: "高中生", difficulty: 2),
    Student(name: "大學生", difficulty: 1),
    Student(name: "研究生", difficulty: 0)
  ]
}
struct teacher: Identifiable{
    let id = UUID()
    let name: String
    let gender: String
    let hard: String
    let description: String
    
}
extension teacher{
  static let demoTeacher = [
    teacher(name:"彼得潘" , gender:"男",  hard:"1", description: "輕鬆翹課 沒問題的"),
    teacher(name:"馬哥" , gender:"男",  hard:"3", description: ""),
    teacher(name:"程大刀" , gender:"男",  hard:"5", description: ""),
    teacher(name:"泡芙阿姨" , gender:"女",  hard:"7", description: ""),
    teacher(name:"胖虎" , gender:"男",   hard:"9", description: "")
  ]
}

