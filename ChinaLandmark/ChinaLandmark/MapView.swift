//
//  MapView.swift
//  ChinaLandmark
//
//  Created by zhoufei on 2023/7/28.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        return MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        //地图中心点经纬度
        let center = CLLocationCoordinate2DMake(39.9087243, 116.3952859)
        //比例尺
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        
        uiView.setRegion(MKCoordinateRegion(center: center, span: span), animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
