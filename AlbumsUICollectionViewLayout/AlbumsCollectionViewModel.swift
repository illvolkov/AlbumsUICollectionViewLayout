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
    let albumName: String
    let numberOfPhoto: String
    let isPeopleItem: Bool
    let isListItem: Bool
    let isHeartIcon: Bool
}

final class AlbumModel {
    static func configure() -> [Section] {
        let model = [
            
            Section(type: "Мои альбомы", options: [
                
            AlbumItem(photo: UIImage(named: "recent"),
                      albumName: "Недавние",
                      numberOfPhoto: "1400",
                      isPeopleItem: false,
                      isListItem: false,
                      isHeartIcon: false),
            AlbumItem(photo: UIImage(named: "favorites"),
                      albumName: "Избранное",
                      numberOfPhoto: "20",
                      isPeopleItem: false,
                      isListItem: false,
                      isHeartIcon: true),
            AlbumItem(photo: UIImage(named: "color.pop"),
                      albumName: "Color Pop",
                      numberOfPhoto: "1",
                      isPeopleItem: false,
                      isListItem: false,
                      isHeartIcon: false),
            AlbumItem(photo: UIImage(named: "instagram"),
                      albumName: "Instagram",
                      numberOfPhoto: "74",
                      isPeopleItem: false,
                      isListItem: false,
                      isHeartIcon: false),
            AlbumItem(photo: UIImage(named: "pinterest"),
                      albumName: "Pinterest",
                      numberOfPhoto: "2",
                      isPeopleItem: false,
                      isListItem: false,
                      isHeartIcon: false),
            AlbumItem(photo: UIImage(named: "vhs.movies"),
                      albumName: "VHSMovies",
                      numberOfPhoto: "3",
                      isPeopleItem: false,
                      isListItem: false,
                      isHeartIcon: false),
            AlbumItem(photo: UIImage(named: "no.picture"),
                      albumName: "Adobe Scan Exports",
                      numberOfPhoto: "0",
                      isPeopleItem: false,
                      isListItem: false,
                      isHeartIcon: false),
            AlbumItem(photo: UIImage(named: "no.picture"),
                      albumName: "WHOOSH",
                      numberOfPhoto: "0",
                      isPeopleItem: false,
                      isListItem: false,
                      isHeartIcon: false),
            AlbumItem(photo: UIImage(named: "no.picture"),
                      albumName: "RCD",
                      numberOfPhoto: "0",
                      isPeopleItem: false,
                      isListItem: false,
                      isHeartIcon: false),
        ]),

        Section(type: "Люди и места", options: [

            AlbumItem(photo: nil,
                      albumName: "Люди",
                      numberOfPhoto: "9",
                      isPeopleItem: true,
                      isListItem: false,
                      isHeartIcon: false),
            AlbumItem(photo: UIImage(named: "places"),
                      albumName: "Места",
                      numberOfPhoto: "5",
                      isPeopleItem: false,
                      isListItem: false,
                      isHeartIcon: false),
        ])
//
//        Section(type: "media file types and other", options: [
//
//            AlbumItem(photo: UIImage(systemName: "video"),
//                      albumName: "Видео",
//                      numberOfPhoto: "207",
//                      isPeopleItem: false,
//                      isListItem: true,
//                      isHeartIcon: false),
//            AlbumItem(photo: UIImage(systemName: "person.crop.square"),
//                      albumName: "Селфи",
//                      numberOfPhoto: "95",
//                      isPeopleItem: false,
//                      isListItem: true,
//                      isHeartIcon: false),
//            AlbumItem(photo: UIImage(systemName: "livephoto"),
//                      albumName: "Фото Live Photos",
//                      numberOfPhoto: "2",
//                      isPeopleItem: false,
//                      isListItem: true,
//                      isHeartIcon: false),
//            AlbumItem(photo: UIImage(systemName: "cube"),
//                      albumName: "Портреты",
//                      numberOfPhoto: "67",
//                      isPeopleItem: false,
//                      isListItem: true,
//                      isHeartIcon: false),
//            AlbumItem(photo: UIImage(systemName: "pano"),
//                      albumName: "Панорамы",
//                      numberOfPhoto: "1",
//                      isPeopleItem: false,
//                      isListItem: true,
//                      isHeartIcon: false),
//            AlbumItem(photo: UIImage(systemName: "timelapse"),
//                      albumName: "Таймлапс",
//                      numberOfPhoto: "9",
//                      isPeopleItem: false,
//                      isListItem: true,
//                      isHeartIcon: false),
//            AlbumItem(photo: UIImage(systemName: "slowmo"),
//                      albumName: "Замедленно",
//                      numberOfPhoto: "5",
//                      isPeopleItem: false,
//                      isListItem: true,
//                      isHeartIcon: false),
//            AlbumItem(photo: UIImage(systemName: "camera.viewfinder"),
//                      albumName: "Снимки экрана",
//                      numberOfPhoto: "170",
//                      isPeopleItem: false,
//                      isListItem: true,
//                      isHeartIcon: false),
//            AlbumItem(photo: UIImage(systemName: "square.stack.3d.forward.dottedline"),
//                      albumName: "Анимированные",
//                      numberOfPhoto: "1",
//                      isPeopleItem: false,
//                      isListItem: true,
//                      isHeartIcon: false)
//            ]),
//
//        Section(type: "media file types and other", options: [
//
//            AlbumItem(photo: UIImage(systemName: "square.and.arrow.down"),
//                      albumName: "Импортированные",
//                      numberOfPhoto: "254",
//                      isPeopleItem: false,
//                      isListItem: true,
//                      isHeartIcon: false),
//            AlbumItem(photo: UIImage(systemName: "eye.slash"),
//                      albumName: "Скрытые",
//                      numberOfPhoto: "0",
//                      isPeopleItem: false,
//                      isListItem: true,
//                      isHeartIcon: false),
//            AlbumItem(photo: UIImage(systemName: "trash"),
//                      albumName: "Недавно удаленные",
//                      numberOfPhoto: "47",
//                      isPeopleItem: false,
//                      isListItem: true,
//                      isHeartIcon: false)
//            ])
        ]
        
        return model
    }
}
