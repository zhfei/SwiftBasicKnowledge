//
//  ProfileEditor.swift
//  ChinaLandmark
//
//  Created by zhoufei on 2023/10/10.
//

import SwiftUI

struct ProfileEditor: View {
    //传递的参数是一个Binding类型，外界创建时传递参数ProfileEditor(profileCopy: $profileCopy)
    //创建#Preview预览时，可以定义一个常量来模拟Binding类型ProfileEditor(profileCopy: .constant(User.default))
    @Binding var profileCopy: User
        
    var body: some View {
        List{
            HStack {
                Text("昵称").font(.headline)
                Divider()
                TextField("昵称", text: $profileCopy.username)
            }
            
            Toggle(isOn: $profileCopy.prefersNotifications, label: {
                Text("允许通知")
            })
            
            VStack(alignment: .leading) {
                Text("喜欢的季节").bold()
                Picker("季节列表", selection: $profileCopy.prefersSeason) {
                    //[item]数组内的元素item要遵守Identifiable协议
                    //enum枚举类型添加var id: String {rawValue}计算属性，struct结构体添加var id: String存储属性
                    ForEach(User.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                    //(menu, wheel, segmented)
                }.pickerStyle(.segmented)
            }.padding(.top)
            
            VStack(alignment: .leading){
                Text("生日").bold()
                DatePicker( "生日选择", selection: $profileCopy.birthday, displayedComponents: .date)
            }.padding(.top)
            
            
        }
    }
}

#Preview {
    ProfileEditor(profileCopy: .constant(User.default))
}
