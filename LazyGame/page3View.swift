//
//  page3View.swift
//  LazyGame
//
//  Created by User07 on 2022/11/28.
//

import SwiftUI

struct page3View: View {
    @State private var dates = Date()
    @State private var bagAmount = 0.0
    @State private var scale : CGFloat = 1
    @State private var message = ""
    let teacher1:String
    
    var body: some View {
        ZStack{
            VStack{
                Text("你被抓到了，老師現在很生氣!\n快重新選擇日期跟求情！")
                font(.system(size: 20))
                .background(Color.red)
                Image(teacher1)
                    .resizable()
                    .scaleEffect(CGFloat.scale)
                Text("輸入和老師求情的話")
                TextEditor(text: $message)
                            .frame(height: 300)
                            .padding()
                Stepper("\(bagAmount) 求情值", value: $bagAmount, in: 0...12, step: 0.25)
                
                            Slider(value: $scale, in: 0...1)
            }
            
        }
        
        
    }
}

struct page3View_Previews: PreviewProvider {
    static var previews: some View {
        page3View(teacher1: "泡芙阿姨2")
    }
}
