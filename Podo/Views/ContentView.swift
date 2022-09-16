//
//  ContentView.swift
//  Podo
//
//  Created by 이윤오 on 2022/09/16.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var photoManager: PhotoManager
    
    var body: some View {
        if photoManager.isLoaded {
            let _ = print(photoManager.assets)
            PhotoList(
                assets: $photoManager.assets,
                albumName: $photoManager.albumName
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PhotoManager())
    }
}
