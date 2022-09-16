//
//  Bundle+PhotoAlbumBrowser.swift
//  Podo
//
//  Created by 이윤오 on 2022/09/16.
//

import Foundation

extension Bundle {
    var name: String? {
        object(forInfoDictionaryKey: kCFBundleNameKey as String) as? String
    }
}
