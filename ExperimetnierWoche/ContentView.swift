//
//  ContentView.swift
//  ExperimetnierWoche
//
//  Created by Nick Wysmyk on 19.11.25.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State var backgroundColor: Color = Color(UIColor.systemGray6)
    
    var body: some View {
        ZStack {
            
            backgroundColor
            
            CameraView()
        }
    }
}

struct CameraView: UIViewControllerRepresentable {
    
    class Coordinator: NSObject {
        var parent: CameraView
        init(parent: CameraView) {
            self.parent = parent
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        
        // Session konfigurieren
        let session = AVCaptureSession()
        session.sessionPreset = .photo
        
        guard let camera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
              let input = try? AVCaptureDeviceInput(device: camera) else {
            return controller
        }
        
        session.addInput(input)
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill
        
        // Spiegelung aktivieren (für Frontkamera)
        previewLayer.connection?.automaticallyAdjustsVideoMirroring = false
        previewLayer.connection?.isVideoMirrored = true
        
        previewLayer.frame = controller.view.bounds
        controller.view.layer.addSublayer(previewLayer)
        
        session.startRunning()
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Nichts nötig
    }
}


#Preview {
    ContentView()
}
