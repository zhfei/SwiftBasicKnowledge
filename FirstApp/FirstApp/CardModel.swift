//
//  CardModel.swift
//  FirstApp
//
//  Created by zhoufei on 2023/11/5.
//

import SwiftUI

struct Card: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}






