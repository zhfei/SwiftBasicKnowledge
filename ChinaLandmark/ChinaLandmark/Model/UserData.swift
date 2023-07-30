//
//  UserData.swift
//  ChinaLandmark
//
//  Created by zhoufei on 2023/7/30.
//

import SwiftUI
import Combine

class UserData: ObservableObject {
    @Published var userLandmarks:[Landmark] = landmarks
    
}





