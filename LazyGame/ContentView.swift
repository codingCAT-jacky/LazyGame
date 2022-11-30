//
//  ContentView.swift
//  LazyGame
//
//  Created by User15 on 11/7/22.
//

import SwiftUI

struct ContentView: View {
  let Gender = ["男","女"]
 
  @State private var Name = ""
  @State private var GenderIndex = 0
  @State private var StudentIndex = 0
    @State var StudetType = ""
  @State private var showAlert = false
  @State private var showpage1 = false
   
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
                        ForEach(Student.demoStudent.indices){ item in
                            Text(Student.demoStudent[item].name)
                        }
                      })
                      .onChange(of: StudentIndex, perform: { value in
                        StudetType = Student.demoStudent[value].name
                      })
                    }.offset(x: 0, y: 0)
                Button(action: {
                      showAlert = true
                }) {
                      VStack {
                         Text("確認")
                          .font(.system(size: 25))
                          .foregroundColor(Color.white)
                          .background(Color.red)


                      }
                }.alert(isPresented: $showAlert, content: {
                  if(Name==""){
                    return Alert(title: Text("你沒名字"))
                  }
                  else{
                    return Alert(title: Text("懶學生已就緒！"))
                  }

              }).offset(x: 0, y: -130)
                Button{
                    showpage1 = true
                }label: {
                    Text(" 我要翹課！")
                      .font(.system(size: 35))
                      .foregroundColor(Color.white)
                      .background(Color.red)

                  }
                .fullScreenCover(isPresented: $showpage1, content: {
                    Page1View(gender: Gender[GenderIndex] , StudentType: $StudetType, name:Name)
                })
                .offset(x: 0, y:-60)
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
