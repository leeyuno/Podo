//
//  ContentView.swift
//  Podo
//
//  Created by 이윤오 on 2022/09/16.
//

import SwiftUI

struct ContentView: View {
    @GestureState var scale: CGFloat = 1.0
    @State private var sortingMode: Mode = .year
    var sortingModes: [String] = ["년", "월", "일"]
    
    enum Mode: String, CaseIterable {
        case year
        case month
        case day
        
        var title: String {
            switch self {
            case .year:
                return "년"
            case .month:
                return "월"
            case .day:
                return "일"
            }
        }
    }
    
    @EnvironmentObject var photoManager: PhotoManager
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .darkGray
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 16.0, weight: .medium)], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.darkGray, .font: UIFont.systemFont(ofSize: 14.0, weight: .regular)], for: .normal)
    }
    
    var body: some View {
        if photoManager.isLoaded {
//            let _ = print(photoManager.assets)
            VStack {
                PhotoList(
                    assets: $photoManager.assets,
                    albumName: $photoManager.albumName
                ).gesture(MagnificationGesture().onEnded({ action in
                    if action < 1 {
                        if sortingMode == .year {
                            sortingMode = .month
                        } else if sortingMode == .month {
                            sortingMode = .day
                        } else {
                            sortingMode = .day
                        }
                    } else {
                        if sortingMode == .day {
                            sortingMode = .month
                        } else if sortingMode == .month {
                            sortingMode = .year
                        } else {
                            sortingMode = .year
                        }
                    }
                }))
                
                Picker("사진 정렬 기준", selection: $sortingMode) {
                    ForEach(Mode.allCases, id: \.self) {
                        Text($0.title)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PhotoManager())
    }
}
