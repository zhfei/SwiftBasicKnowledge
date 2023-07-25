//
//  Landmark.swift
//  WorldLandMark
//
//  Created by zhoufei on 2023/7/25.
//

import Foundation


struct Landmark: Identifiable {
    var id = UUID()
    let name: String
}

let landmarks = [
    Landmark(name: "北京"),
    Landmark(name: "纽约")
]
