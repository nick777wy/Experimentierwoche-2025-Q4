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

#Preview {
    ContentView()
}
