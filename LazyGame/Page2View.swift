//
//  Page2View.swift
//  LazyGame
//
//  Created by User15 on 11/8/22.
//

import SwiftUI

struct Page2View: View {
    @State private var pickedTime = Date()
    @State private var checkTime = 0
    @State private var showThirdpage = false
    @State private var success = false
    @State private var forward = ""
    @State private var num = 0
    var dateRange: ClosedRange<Date> {
            Date()...DateComponents(calendar: .current, year: 2022, month: 12, day: 6).date!
    }
    let gender: String
    let StudentType : String
    let name: String
    let selectedTeacher: String
    let difficulty: Int
    @Binding var showsecondpage :Bool
    var body: some View {
        ZStack{
            VStack{
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0, content: {
                    Text(name+","+usedparagraph.demousedparagraph[difficulty].description1+selectedTeacher+usedparagraph.demousedparagraph[difficulty].description2)
                        .font(.system(size: 18))
                        .background(Color.yellow)
//                        .frame(width: 400, height: 45, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    let _ = print("selectedTeacher", selectedTeacher)
                    Image(selectedTeacher)
                        .resizable()
                        .scaledToFit()
    //                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                })
                    
                    
                    
                
                List{
                        DatePicker("選擇翹課日", selection: $pickedTime, in: dateRange, displayedComponents: .date)
                        Text(pickedTime, style: .date)
                    if(success)
                    {
                        VStack{
                            Text("恭喜"+selectedTeacher+"沒抓到你，你保住了學分！")
                            Button("再次挑戰")
                            {
                                showsecondpage.toggle()
                            }
                        }
                    }
                }
                
//                Text("確認")
//                    .background(Color.red)
//                    .font(.system(size: 30))
//                    .contextMenu {
                
                HStack{
                    Button {
                        showsecondpage.toggle()
                    } label: {
                        Label("重新選擇要挑戰的老師", systemImage: "globe")
                    }

                    Button {
                        checkTime = Int.random(in: 0...6)
                        num = Int.random(in: 0...difficulty)
                        forward = selectedTeacher+"2"
                        if(num<checkTime)
                        {
                            print(forward)
                            showThirdpage.toggle()
                        }
                        else
                        {
                            print(checkTime)
                            print(num)
                            success.toggle()
                        }
                            
                        
                    } label: {
                        Label("確定翹課日期", systemImage: "location.circle")
                    }
                    .sheet(isPresented: $showThirdpage, content: {
                            page3View(teacher1:$forward) })
                          
                    
                }
                        
//                    }
//                    .offset(x:0,y:-100)
                
                
                     
                
            }
            
        }
    }
}

struct Page2View_Previews: PreviewProvider {
    static var previews: some View {
        Page2View(gender: "男", StudentType: "大學生", name: "jacky", selectedTeacher: "泡芙阿姨", difficulty: 2 ,showsecondpage: .constant(true))
    }
}
struct usedparagraph: Identifiable{
    let id = UUID()
    let description1: String
    let description2: String
}
extension usedparagraph{
  static let demousedparagraph = [
    usedparagraph(description1: "你是一個研究生\n",description2: "教授根本不在乎你有沒有來"),
    usedparagraph(description1: "你是一個大學生\n",description2: "教授一週會點一次名，避開那天！"),
    usedparagraph(description1: "你是一個高中生\n",description2: "老師一週會點兩次名，避開那兩天！"),
    usedparagraph(description1: "你是一個小學生\n",description2: "班導一週會點三次名，避開那三天！"),
    usedparagraph(description1: "你是一個國中生\n",description2: "班導一週會點四次名，避開那四天！")
  ]
}
