//
//  CardView.swift
//  FirstApp
//
//  Created by zhoufei on 2023/11/4.
//

import SwiftUI

struct CardView: View {
    // MARK: Properties
    var gradient: [Color] = [Color("Color01"),Color("Color02")]
    
    // MARK: Body
    var body: some View {
        ZStack{
            Text("卡片")
                .background(Color.blue)
                .frame(width: 60,height: 60) //对内容标签无效
        }
        .frame(width: 335, height: 545)
        .background(LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

// MARK: Preview
#Preview {
    CardView()
        .previewLayout(.sizeThatFits) //展示组件尺寸
//        .previewDevice("iPhone 11") //展示设备尺寸
}
