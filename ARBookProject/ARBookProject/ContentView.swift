//
//  ContentView.swift
//  ARBookProject
//
//  Created by zhoufei on 2023/12/2.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)

        // Create a cube model
        let mesh = MeshResource.generateBox(size: 0.1, cornerRadius: 0.005)
        let material = SimpleMaterial(color: .gray, roughness: 0.15, isMetallic: true)
        let model = ModelEntity(mesh: mesh, materials: [material])
        
        // Circle model
        let mesh1 = MeshResource.generateText("Hello World",extrusionDepth: 0.05,font: .systemFont(ofSize: 0.1),containerFrame: CGRect(),alignment: .center,lineBreakMode: .byWordWrapping)
        let material1 = SimpleMaterial(color: .red, isMetallic: true)
        let model1 = ModelEntity(mesh: mesh1, materials: [material1])
        model1.transform.translation = SIMD3(0,0.03,0)

        // Create horizontal plane anchor for the content
        let anchor = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: SIMD2<Float>(0.2, 0.2)))
        anchor.children.append(model)
        anchor.children.append(model1)

        // Add the horizontal plane anchor to the scene
        arView.scene.anchors.append(anchor)

        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#Preview {
    ContentView()
}
