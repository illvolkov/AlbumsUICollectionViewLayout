//
//  AlbumsCollectionViewModel.swift
//  AlbumsUICollectionViewLayout
//
//  Created by Ilya Volkov on 23.03.2022.
//

import Foundation
import UIKit

struct Section {
    let type: String
    let options: [AlbumItem]
}

struct AlbumItem {
    let photo: UIImage?
    let peoplePhotoOne, peoplePhotoTwo, peoplePhotoThree, peoplePhotoFour: UIImage?
    let albumName: String
    let numberOfPhoto: String
}
