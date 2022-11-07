//
//  ContentView.swift
//  LazyGame
//
//  Created by User15 on 11/7/22.
//

import SwiftUI

struct ContentView: View {
  let Gender = ["男","女"]
  let StudentType = ["小學生", "國中生", "高中生", "大學生", "研究生"]
  @State private var Name = ""
  @State private var GenderIndex = 0
  @State private var StudentIndex = 0
      var body: some View {
        NavigationView{
          ZStack{
            VStack{
              Text("懶學生模擬器")
                .font(.system(size: 40))
                .foregroundColor(.blue)
                .offset(x: 0, y: 0)
              Image("生氣老師")
                .resizable()
                .frame(width: 250, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .offset(x: 0, y: 0)

                    Form{
                          TextField("輸入學生名", text: $Name)
                      Picker(selection: $GenderIndex, label: Text("性別"), content: {
                        ForEach(Gender.indices){ item in
                          Text(Gender[item])
                        }
                      })
                      Picker(selection: $StudentIndex, label: Text("學生類型"), content: {
                        ForEach(StudentType.indices){ item in
                          Text(StudentType[item])
                        }
                      })
                    }.offset(x: 0, y: 0)

              NavigationLink(
                  destination: Page1View(gender: Gender[GenderIndex] , StudentType: StudentType[StudentIndex]),
                  label: {
                    Text(" 我要翹課！")
                      .foregroundColor(.red)
                      .border(Color.blue)
                      .clipped()
                  }).offset(x: 0, y: -100)
              
            }


          }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
