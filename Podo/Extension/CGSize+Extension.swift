//
//  CGSize+Extension.swift
//  Podo
//
//  Created by 이윤오 on 2022/09/16.
//

import SwiftUI

extension CGSize {
    var isLandscape: Bool {
        width > height
    }

    var isPortrait: Bool {
        width < height
    }

    var isSquare: Bool {
        width == height
    }
}
