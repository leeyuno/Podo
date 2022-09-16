//
//  AlbumData.swift
//  Podo
//
//  Created by 이윤오 on 2022/09/16.
//

import SwiftUI
import Photos
import PhotosUI
//import Foundation

final class AlbumModel: ObservableObject {
    @Published var albums: [Album] = load()
}

struct Album: Hashable {
    let name: String?
    let count: Int?
    let collection: PHAssetCollection?

    init(name:String, count:Int, collection:PHAssetCollection) {
          self.name = name
          self.count = count
          self.collection = collection
        }
}

func load() -> [Album] {
    var album:[Album] = [Album]()
    
    let options = PHFetchOptions()
    let userAlbums = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: options)
    userAlbums.enumerateObjects{ (object: AnyObject!, count: Int, stop: UnsafeMutablePointer) in
        if object is PHAssetCollection {
            let obj:PHAssetCollection = object as! PHAssetCollection
            
            let fetchOptions = PHFetchOptions()
            fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
            fetchOptions.predicate = NSPredicate(format: "mediaType = %d", PHAssetMediaType.image.rawValue)
            
            let newAlbum = Album(name: obj.localizedTitle!, count: obj.estimatedAssetCount, collection: obj)
            album.append(newAlbum)
        }
    }
    
    return album
}
