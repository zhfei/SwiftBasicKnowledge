//
//  LandmarkList.swift
//  ChinaLandmark
//
//  Created by zhoufei on 2023/7/29.
//

import SwiftUI

struct LandmarkList: View {
    
    @State var isOpen: Bool = false
    
    var body: some View {
        NavigationView{
            
//            ForEach() {
//                Toggle(isOn: $isOpen) {
//                    Text("开关")
//                }

                List(landmarks) { item in
                    NavigationLink(destination: LandmarkDetail(landmark: item)) {
                        if isOpen {
                            if item.isFeatured {
                                LandmarkListCell(landmark: item)
                            }
                        } else {
                            LandmarkListCell(landmark: item)
                        }
                        
                    }
                    
                }
//            }
            
            .navigationBarTitle(Text("中国地标"))
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
