//
//  ContentView.swift
//  WorldLandMark
//
//  Created by zhoufei on 2023/7/25.
//

import SwiftUI
 
struct ContentView: View {
    var body: some View {
        NavigationView {
             
             
            /*
             List,ForEach等要求被循环的每个元素都要有一个唯一的标识
             这样数据变更时，可以迅速定位刷新对应的UI，提高性能
             两种方法：
             1.ArrayData.identified(by: \.id) id为每个元素的唯一标识属性
             2.数组中的元素要遵循Identifiable协议（实现id协议）
              
             */
             
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/){ item in
                NavigationLink(destination: Text("万里长城")) {
                    HStack{
                        Image("icon_consult_default_avatar_assistant")
                        VStack {
                            Text("长城")
                            Text("北京")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                             
                        }
                    }
                }
                 
            }.navigationBarTitle(Text("世界地标"),displayMode: NavigationBarItem.TitleDisplayMode.large)
        }
         
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
