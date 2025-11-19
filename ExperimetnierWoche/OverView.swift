//
//  OverView.swift
//  ExperimetnierWoche
//
//  Created by Nick Wysmyk on 19.11.25.
//

import SwiftUI

struct OverView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    NavigationLink {
                        CameraView()
                    } label: {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.black)
                            .frame(height: 150)
                            .shadow(color: Color(UIColor.systemBlue), radius: 10, x: 5, y: 5)
                            .overlay(
                                VStack {
                                    Text("camera".capitalized)
                                        .font(.largeTitle)
                                        .bold()
                                }
                                    .padding()
                            )
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("experimentier woche".capitalized)
        }
    }
}

#Preview {
    OverView()
}
