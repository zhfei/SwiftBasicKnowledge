//
//  LandmarkList.swift
//  ChinaLandmark
//
//  Created by zhoufei on 2023/7/29.
//

import SwiftUI

struct LandmarkList: View {
    
    @State private var isOpen: Bool = false
    //@ObservedObject: 全局环境变量绑定
    @ObservedObject var userData: UserData = UserData()
    
    var body: some View {
        NavigationView{
            List{
                // $isOpen: 传入的是@State变量的引用，是双向绑定的效果，内部会自动对值取反操作
                Toggle(isOn: $isOpen) {
                    Text("只展示收藏")
                }
                ForEach(userData.userLandmarks) { item in
                    if !isOpen || item.isFeatured {
                        NavigationLink(destination: LandmarkDetail(landmark: item, userData: userData)) {
                            LandmarkListCell(landmark: item)
                        }
                    }
                }
                .navigationBarTitle(Text("中国地标"))
            }
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    struct DeviceType: Identifiable {
        var id = UUID()
        var name: String
    }
    
    static var previews: some View {
        //使用ForEach展示多个设备
        ForEach([DeviceType(name: "iPhone 12"),DeviceType(name: "iPhone 13")]){ deviceItem in
            LandmarkList().previewDevice(PreviewDevice(rawValue: deviceItem.name))
                .previewDisplayName(deviceItem.name)
        }
        
    }
}
