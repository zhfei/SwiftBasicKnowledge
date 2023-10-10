//
//  Profile.swift
//  ChinaLandmark
//
//  Created by zhoufei on 2023/10/4.
//

import SwiftUI

struct Profile: View {
    //全局环境变量
    @Environment(\.editMode) var editMode
    
    @State var profile = User.default
    
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年M月d日"
        return dateFormatter
    }
    
    var body: some View {
        
        VStack(alignment: .trailing){
            HStack{
                Button(action: {}) {
                    Text("完成")
                }
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
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
            } else {
                
                
                List{
                    HStack {
                        Text("昵称").font(.headline)
                        Divider()
                        TextField("昵称", text: $profile.username)
                    }
                    
                    Toggle(isOn: $profile.prefersNotifications, label: {
                        Text("允许通知")
                    })
                    
                    VStack(alignment: .leading) {
                        Text("喜欢的季节").bold()
                        Picker("季节列表", selection: $profile.prefersSeason) {
                            //[item]数组内的元素item要遵守Identifiable协议
//                            ForEach(["a"]){
//                                
//                            }
                            ForEach(Range(NSMakeRange(0, User.Season.allCases.count))!) { index in
                                Text(User.Season.allCases[index].rawValue).tag(index)
                            }
                            //(menu, wheel, segmented)
                        }.pickerStyle(.segmented)
                    }.padding(.top)
                    
                    VStack(alignment: .leading){
                        Text("生日").bold()
                        DatePicker( "生日选择", selection: $profile.birthday, displayedComponents: .date)
                    }.padding(.top)
                    
                    
                }
            }
        }.padding()
        
        
    }
}

#Preview {
    Profile()
}
