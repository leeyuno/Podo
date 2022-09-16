//
//  PodoApp.swift
//  Podo
//
//  Created by 이윤오 on 2022/09/16.
//

import SwiftUI

@main
struct PodoApp: App {
    @StateObject private var photoManager = PhotoManager(loadImmediately: true)
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                GeometryReader { geometry in
                    ContentView()
                        .environmentObject(photoManager)
                        .navigationBarHidden(geometry.size.isLandscape)
                        .statusBar(hidden: geometry.size.isLandscape)
                }
            }
        }
    }
}
