//
//  UserData.swift
//  ChinaLandmark
//
//  Created by zhoufei on 2023/7/30.
//

import SwiftUI
import Combine

//类中包裹的是已经存在的环境变量landmarks，它作为信号的发射源，可以在数据修改时发生信号
class UserData: ObservableObject {
    @Published var userLandmarks:[Landmark] = landmarks
    
}





