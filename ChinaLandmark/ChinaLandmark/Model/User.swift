//
//  User.swift
//  ChinaLandmark
//
//  Created by zhoufei on 2023/10/4.
//

import Foundation

struct User {
    var username: String
    var prefersNotifications = true
    var prefersSeason = Season.winter
    var birthday = Date()
    //单例模式
    static let `default` = Self(username: "Jack")
    
    
    enum Season: String, CaseIterable {
        case spring = "🌺"
        case summer = "☀️"
        case autumn = "🍂"
        case winter = "⛄️"
    }
}






