//
//  PictureTrackingView.swift
//  ARCamera
//
//  Created by zhoufei on 2023/12/21.
//

import SwiftUI
import RealityKit
import ARKit

struct MutablePicturesTrackingView: View {
    @State var isSaved: Bool
    
    var body: some View {
        VStack {
            PicturesTrackingViewContainer()
            Divider()
            HStack {
                Button {
                    theARView2?.saveWorldMap(block: {
                        isSaved.toggle()
                    })
                } label: {
                    VStack {
                        Text("保存worldMap")
                        if isSaved {
                            Text("保存worldMap成功")
                        }
                    }
                }
                Spacer()
                Button {
                    theARView2?.loadARWorldMap()
                } label: {
                    Text("加载worldMap")
                }

            }.padding(.bottom,20)
        }
    }
}

private var theARView2: ARView?
var mapSaveURL: URL = {
    do {
        let url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("arworldmap.arexperience")
        return url
    } catch {
        fatalError("路径获取失败\(error.localizedDescription)")
    }
}()

var mapDataFromFile: Data? {
    return try? Data(contentsOf: mapSaveURL)
}

struct PicturesTrackingViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let config = ARWorldTrackingConfiguration()
//        guard let trackedImageLib = ARReferenceImage.referenceImages(inGroupNamed: "ARImageResources", bundle: Bundle.main) else {
//            fatalError("无法加载图像参考库")
//        }
        
        var trackedImageLib = Set<ARReferenceImage>()
        let image = UIImage(named: "toy_drummer")
        let referenceImage = ARReferenceImage(image!.cgImage!, orientation: .up, physicalWidth: 0.15)
        referenceImage.name = "toy_drummer"
        trackedImageLib.insert(referenceImage)
        
        config.detectionImages = trackedImageLib
        config.maximumNumberOfTrackedImages = 1
        arView.session.run(config, options: [])
        arView.session.delegate = arView
        theARView2 = arView
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}


extension ARView: ARSessionDelegate {
    public func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        print("加载模型失败\(anchors)")
        session.getCurrentWorldMap { worldMap, error in
            print("加载模型失败\(anchors)")
        }
    }
    
    public func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        guard let imageAnchor = anchors.first as? ARImageAnchor else {
            return
        }
        if let refrenceImageName = imageAnchor.referenceImage.name {
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
            
        } else {
            print("图像锚点类型错误\(imageAnchor.referenceImage)")
        }
        
        
    }
    
    fileprivate func changeImagesLib() {
        let config = self.session.configuration as! ARWorldTrackingConfiguration
        
        guard let referenceImagesLib = ARReferenceImage.referenceImages(inGroupNamed: "ARImageResources2", bundle: Bundle.main) else {
            fatalError("无法加载参考图像库")
        }
        config.detectionImages = referenceImagesLib
        config.maximumNumberOfTrackedImages = 1
        self.session.run(config, options: [.resetTracking, .removeExistingAnchors])
    }
    
    fileprivate func addReferenceImages() {
        let config = self.session.configuration as! ARWorldTrackingConfiguration
        let image = UIImage(named: "toy_biplan")
        let referenceImage = ARReferenceImage(image!.cgImage!, orientation: .up, physicalWidth: 0.2)
        referenceImage.name = "toy_biplan"

        config.detectionImages.insert(referenceImage)
        config.maximumNumberOfTrackedImages = 1
        self.session.run(config, options: [])
    }
    

    
    fileprivate func saveWorldMap(block:@escaping ()->()) {
        self.session.getCurrentWorldMap { worldMap, error in
            guard let map = worldMap else {
                print("无法获取当前地图\(String(describing: error?.localizedDescription))")
                return
            }
            
            do {
                let data = try NSKeyedArchiver.archivedData(withRootObject: map, requiringSecureCoding: true)
                try data.write(to: mapSaveURL, options: [.atomic])
                
                if block != nil {
                    block()
                }
            } catch {
                
            }
        }
    }
    
    fileprivate func loadARWorldMap() {
        let worldMap: ARWorldMap = {
            guard let data = mapDataFromFile else {
                fatalError("ARWorldMapFile不存在")
            }
            
            do {
                guard let worldMap = try NSKeyedUnarchiver.unarchivedObject(ofClass: ARWorldMap.self, from: data) else {
                    fatalError("worldMap格式不正确")
                }
                return worldMap
            } catch {
                fatalError("\(error.localizedDescription)")
            }
        }()
        
        let config = ARWorldTrackingConfiguration()
        var trackedImageLib = Set<ARReferenceImage>()
        let image = UIImage(named: "toy_robot_vintage")
        let referenceImage = ARReferenceImage(image!.cgImage!, orientation: .up, physicalWidth: 0.15)
        referenceImage.name = "toy_robot_vintage"
        trackedImageLib.insert(referenceImage)
        
//        config.trackingImages = trackedImageLib
        config.maximumNumberOfTrackedImages = 1
        config.initialWorldMap = worldMap
        config.detectionImages = trackedImageLib
        
  
        
        self.session.run(config, options: [.resetTracking, .removeExistingAnchors])
        
        for anchor in worldMap.anchors {
            do {
                // 创建球体
                let sphere = MeshResource.generateSphere(radius: 0.05)

                // 创建球体的材质
                let material = SimpleMaterial(color: .red, isMetallic: false)

                // 创建球体的 Entity
                let sphereEntity = ModelEntity(mesh: sphere, materials: [material])
                let imageAnchorEntity = AnchorEntity(anchor: anchor)
                imageAnchorEntity.addChild(sphereEntity)
                self.scene.addAnchor(imageAnchorEntity)
            } catch {
                print("加载模型失败",error.localizedDescription)
            }
//            if let imageAnchor = anchor as? ARImageAnchor {
//                let modelName = imageAnchor.referenceImage.name ?? ""
//                
//                do {
//                    let myModelEntity = try Entity.loadModel(named: modelName)
//                    let imageAnchorEntity = AnchorEntity(anchor: imageAnchor)
//                    imageAnchorEntity.addChild(myModelEntity)
//                    self.scene.addAnchor(imageAnchorEntity)
//                } catch {
//                    print("加载模型失败",error.localizedDescription)
//                }
//            }
        }
    }
   
}




#Preview {
    PictureTrackingView()
}