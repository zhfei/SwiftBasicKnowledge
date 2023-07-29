//
//  Landmark.swift
//  ChinaLandmark
//
//  Created by zhoufei on 2023/7/28.
//

import Foundation
import CoreLocation

struct Landmark: Identifiable {
    var id: Int
    var category: String
    var name: String
    var city: String
    var proviance: String
    
    var latitude: Double
    var longitude: Double
    var locationCoordition: CLLocationCoordinate2D {
        CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    var imageName: String
    var isFavorite: Bool
    var isFeatured: Bool
    
}

let landmarks = [
    Landmark(id: 1, category: "古迹",name: "天安门", city: "北京", proviance:"北京市", latitude: 39.9087243, longitude: 116.3952859, imageName: "phone7", isFavorite: true, isFeatured: true),
    Landmark(id: 2, category: "现代建筑",name: "东方明珠", city: "上海", proviance:"上海市", latitude: 31.2396935, longitude: 121.4975613, imageName: "phone8", isFavorite: false, isFeatured: false)
]

let featuredLandmards = landmarks.filter {$0.isFeatured}
