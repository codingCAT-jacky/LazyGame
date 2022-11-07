//
//  Page1View.swift
//  LazyGame
//
//  Created by User15 on 11/7/22.
//

import SwiftUI

struct Page1View: View {
    let studentarr = [
      Student(name: "小學生", difficulty: 3),
      Student(name: "國中生", difficulty: 4),
      Student(name: "高中生", difficulty: 2),
      Student(name: "大學生", difficulty: 1),
      Student(name: "研究生", difficulty: 0)
    ]
   let teacher = ["彼得潘","馬尚彬","程華懷","馬永昌","胖虎"]
  let gender : String
  let StudentType : String
    var body: some View {
      ZStack{
        VStack{
          Image("懶惰學生")
          Text("你是一個平常打ＬＯＬ打到吐的學生")
          Text("於是你需要一些時間翹課來補眠")
          Text("不過翹課可不能被老師發現了")
          Text("警慎的選擇翹課的時間避開老師的點名！")
          Spacer()
          List{
                DisclosureGroup("老師列表") {
                  ForEach(teacher.indices){ item in
                    Text(teacher[item])

                }
                DisclosureGroup("") {

                }
          }

        }
      }
      }
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


