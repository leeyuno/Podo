//
//  LivePhotoView.swift
//  Podo
//
//  Created by 이윤오 on 2022/09/16.
//

import SwiftUI
import PhotosUI

struct LivePhotoView: UIViewRepresentable {
    var livephoto: PHLivePhoto
    @State var isPlaying = false
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(livePhotoView: self)
    }
    
    func makeUIView(context: Context) -> PHLivePhotoView {
        let view = PHLivePhotoView()
        view.delegate = context.coordinator
        view.livePhoto = livephoto
        
        return view
    }
    
    func updateUIView(_ lpView: PHLivePhotoView, context: Context) {
        lpView.livePhoto = livephoto
        lpView.isMuted = false
        
        if isPlaying {
            lpView.startPlayback(with: .full)
        } else {
            lpView.stopPlayback()
        }
    }
    
    class Coordinator: NSObject, PHLivePhotoViewDelegate {
        var livePhotoView: LivePhotoView
        
        init(livePhotoView: LivePhotoView) {
            self.livePhotoView = livePhotoView
            super.init()
        }
        
        func livePhotoView(_ livePhotoView: PHLivePhotoView, didEndPlaybackWith playbackStyle: PHLivePhotoViewPlaybackStyle) {
            DispatchQueue.main.async {
                self.livePhotoView.isPlaying = false
            }
        }
    }
}
