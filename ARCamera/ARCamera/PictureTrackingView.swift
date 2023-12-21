//
//  PictureTrackingView.swift
//  ARCamera
//
//  Created by zhoufei on 2023/12/21.
//

import SwiftUI
import RealityKit
import ARKit

struct PictureTrackingView: View {
    var body: some View {
        PictureTrackingViewContainer()
    }
}

var theARView: ARView?

struct PictureTrackingViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let config = ARImageTrackingConfiguration()
//        guard let trackedImageLib = ARReferenceImage.referenceImages(inGroupNamed: "ARImageResources", bundle: Bundle.main) else {
//            fatalError("无法加载图像参考库")
//        }
        
        var trackedImageLib = Set<ARReferenceImage>()
        let image = UIImage(named: "toy_drummer")
        let referenceImage = ARReferenceImage(image!.cgImage!, orientation: .up, physicalWidth: 0.15)
        referenceImage.name = "toy_drummer"
        trackedImageLib.insert(referenceImage)
        
        config.trackingImages = trackedImageLib
        config.maximumNumberOfTrackedImages = 1
        arView.session.run(config, options: [])
        arView.session.delegate = arView
        theARView = arView
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

extension ARView: ARSessionDelegate {
    public func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        guard let imageAnchor = anchors.first as? ARImageAnchor else {
            return
        }
        
        let refrenceImageName = imageAnchor.referenceImage.name ?? "toy_biplane"
        DispatchQueue.main.async {
            do {
                let myModelEntity = try Entity.loadModel(named: refrenceImageName)
                let imageAnchorEntity = AnchorEntity(anchor: imageAnchor)
                imageAnchorEntity.addChild(myModelEntity)
                self.scene.addAnchor(imageAnchorEntity)
            } catch {
                print("加载模型失败",error.localizedDescription)
            }
        }
        
    }
}


#Preview {
    PictureTrackingView()
}
