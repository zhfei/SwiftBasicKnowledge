//
//  PageVC.swift
//  ChinaLandmark
//
//  Created by zhoufei on 2023/10/11.
//

import SwiftUI

struct PageVC: UIViewControllerRepresentable {
    let page = UIHostingController(rootView: Image(landmarks[0].imageName))
    let page1 = UIHostingController(rootView: Image(landmarks[1].imageName))
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        UIPageViewController(transitionStyle: .scroll, navigationOrientation: .vertical)
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers([page,page1], direction: .forward, animated: true)
    }
    
}

#Preview {
    PageVC()
}
