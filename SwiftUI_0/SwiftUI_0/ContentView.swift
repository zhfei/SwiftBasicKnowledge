//
//  ContentView.swift
//  SwiftUI_0
//
//  Created by 周飞 on 2020/7/25.
//  Copyright © 2020 zhf. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                Cell()
            }
        .navigationBarTitle("这是标题")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Cell: View {
    var body: some View {
        NavigationLink(destination: DetailView()){
            Image("cat").cornerRadius(8)
            VStack(alignment: .leading ) {
                Text("杭州西湖")
                Text("西藏-布达拉宫")
                    .bold()
                    .foregroundColor(.accentColor)
                
            }
        }
    }
}
