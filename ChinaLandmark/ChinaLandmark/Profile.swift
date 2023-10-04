//
//  Profile.swift
//  ChinaLandmark
//
//  Created by zhoufei on 2023/10/4.
//

import SwiftUI

struct Profile: View {
    let profile = User.default
    
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年M月d日"
        return dateFormatter
    }
    
    var body: some View {
        List {
            Text("\(profile.username)").font(.title).bold()
            Text("允许通知：\(profile.prefersNotifications ? "是" : "否")")
            Text("喜欢的季节：\(profile.prefersSeason.rawValue)")
            Text("生日：\(dateFormatter.string(from: profile.birthday))")
            VStack(alignment: .leading){
                Text("最近的徒步旅行").font(.headline)
                Image("phone7")
                //尺寸
                    .resizable()
                //NavigationLink内部的Image默认使用按钮样式，如有NavigationView，它会帮忙清掉默认样式
                    .renderingMode(.original)
                //内容填充样式
                    .scaledToFill()
                    .frame(height: 150)
                //圆角
                    .cornerRadius(8)
                //剪裁超出视图外的内容
                    .clipped()
            }
        }
    }
}

#Preview {
    Profile()
}
