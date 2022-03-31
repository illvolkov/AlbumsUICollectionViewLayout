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
    let isHeaderWithButton: Bool
    let options: [AlbumItem]
}

struct AlbumItem {
    let image: UIImage?
    let name: String
    let amountOfMedia: String
    let isPeopleAndPlacesItem: Bool
    let isHeartIcon: Bool
    let isSeparatorView: Bool
}

final class AlbumModel {
    static func configure() -> [Section] {
        let model = [
            
        Section(type: "Мои альбомы", isHeaderWithButton: true, options: [
                
            AlbumItem(image: UIImage(named: "recent"),
                      name: "Недавние",
                      amountOfMedia: "1400",
                      isPeopleAndPlacesItem: false,
                      isHeartIcon: false,
                      isSeparatorView: false),
            AlbumItem(image: UIImage(named: "favorites"),
                      name: "Избранное",
                      amountOfMedia: "20",
                      isPeopleAndPlacesItem: false,
                      isHeartIcon: true,
                      isSeparatorView: false),
            AlbumItem(image: UIImage(named: "color.pop"),
                      name: "Color Pop",
                      amountOfMedia: "1",
                      isPeopleAndPlacesItem: false,
                      isHeartIcon: false,
                      isSeparatorView: false),
            AlbumItem(image: UIImage(named: "instagram"),
                      name: "Instagram",
                      amountOfMedia: "74",
                      isPeopleAndPlacesItem: false,
                      isHeartIcon: false,
                      isSeparatorView: false),
            AlbumItem(image: UIImage(named: "pinterest"),
                      name: "Pinterest",
                      amountOfMedia: "2",
                      isPeopleAndPlacesItem: false,
                      isHeartIcon: false,
                      isSeparatorView: false),
            AlbumItem(image: UIImage(named: "vhs.movies"),
                      name: "VHSMovies",
                      amountOfMedia: "3",
                      isPeopleAndPlacesItem: false,
                      isHeartIcon: false,
                      isSeparatorView: false),
            AlbumItem(image: UIImage(named: "no.picture"),
                      name: "Adobe Scan Exports",
                      amountOfMedia: "0",
                      isPeopleAndPlacesItem: false,
                      isHeartIcon: false,
                      isSeparatorView: false),
            AlbumItem(image: UIImage(named: "no.picture"),
                      name: "WHOOSH",
                      amountOfMedia: "0",
                      isPeopleAndPlacesItem: false,
                      isHeartIcon: false,
                      isSeparatorView: false),
            AlbumItem(image: UIImage(named: "no.picture"),
                      name: "RCD",
                      amountOfMedia: "0",
                      isPeopleAndPlacesItem: false,
                      isHeartIcon: false,
                      isSeparatorView: false),
        ]),

        Section(type: "Люди и места", isHeaderWithButton: false, options: [

            AlbumItem(image: nil,
                      name: "Люди",
                      amountOfMedia: "9",
                      isPeopleAndPlacesItem: true,
                      isHeartIcon: false,
                      isSeparatorView: false),
            AlbumItem(image: UIImage(named: "places"),
                      name: "Места",
                      amountOfMedia: "5",
                      isPeopleAndPlacesItem: false,
                      isHeartIcon: false,
                      isSeparatorView: false)
        ]),

        Section(type: "Типы медиафайлов", isHeaderWithButton: false, options: [

            AlbumItem(image: UIImage(systemName: "video", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16.5,
                                                                                                         weight: .regular,
                                                                                                         scale: .large)),
                      name: "Видео",
                      amountOfMedia: "207",
                      isPeopleAndPlacesItem: false,
                      isHeartIcon: false,
                      isSeparatorView: true),
            AlbumItem(image: UIImage(systemName: "person.crop.square", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16.5,
                                                                                                                      weight: .regular,
                                                                                                                      scale: .large)),
                      name: "Селфи",
                      amountOfMedia: "95",
                      isPeopleAndPlacesItem: false,
                      isHeartIcon: false,
                      isSeparatorView: true),
            AlbumItem(image: UIImage(systemName: "livephoto", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16.5,
                                                                                                             weight: .regular,
                                                                                                             scale: .large)),
                      name: "Фото Live Photos",
                      amountOfMedia: "2",
                      isPeopleAndPlacesItem: false,
                      isHeartIcon: false,
                      isSeparatorView: true),
            AlbumItem(image: UIImage(systemName: "cube", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16.5,
                                                                                                        weight: .regular,
                                                                                                        scale: .large)),
                      name: "Портреты",
                      amountOfMedia: "67",
                      isPeopleAndPlacesItem: false,
                      isHeartIcon: false,
                      isSeparatorView: true),
            AlbumItem(image: UIImage(systemName: "pano", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16.5,
                                                                                                        weight: .regular,
                                                                                                        scale: .large)),
                      name: "Панорамы",
                      amountOfMedia: "1",
                      isPeopleAndPlacesItem: false,
                      isHeartIcon: false,
                      isSeparatorView: true),
            AlbumItem(image: UIImage(systemName: "timelapse", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16.5,
                                                                                                             weight: .regular,
                                                                                                             scale: .large)),
                      name: "Таймлапс",
                      amountOfMedia: "9",
                      isPeopleAndPlacesItem: false,
                      isHeartIcon: false,
                      isSeparatorView: true),
            AlbumItem(image: UIImage(systemName: "slowmo", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16.5,
                                                                                                          weight: .regular,
                                                                                                          scale: .large)),
                      name: "Замедленно",
                      amountOfMedia: "5",
                      isPeopleAndPlacesItem: false,
                      isHeartIcon: false,
                      isSeparatorView: true),
            AlbumItem(image: UIImage(systemName: "camera.viewfinder", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16.5,
                                                                                                                     weight: .regular,
                                                                                                                     scale: .large)),
                      name: "Снимки экрана",
                      amountOfMedia: "170",
                      isPeopleAndPlacesItem: false,
                      isHeartIcon: false,
                      isSeparatorView: true),
            AlbumItem(image: UIImage(systemName: "square.stack.3d.forward.dottedline",
                                     withConfiguration: UIImage.SymbolConfiguration(pointSize: 16.5,
                                                                                    weight: .regular,
                                                                                    scale: .large)),
                      name: "Анимированные",
                      amountOfMedia: "1",
                      isPeopleAndPlacesItem: false,
                      isHeartIcon: false,
                      isSeparatorView: false)
            ]),

        Section(type: "Другое", isHeaderWithButton: false, options: [

            AlbumItem(image: UIImage(systemName: "square.and.arrow.down", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16.5,
                                                                                                                         weight: .regular,
                                                                                                                         scale: .large)),
                      name: "Импортированные",
                      amountOfMedia: "254",
                      isPeopleAndPlacesItem: false,
                      isHeartIcon: false,
                      isSeparatorView: true),
            AlbumItem(image: UIImage(systemName: "eye.slash", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16.5,
                                                                                                             weight: .regular,
                                                                                                             scale: .large)),
                      name: "Скрытые",
                      amountOfMedia: "0",
                      isPeopleAndPlacesItem: false,
                      isHeartIcon: false,
                      isSeparatorView: true),
            AlbumItem(image: UIImage(systemName: "trash", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16.5,
                                                                                                         weight: .regular,
                                                                                                         scale: .large)),
                      name: "Недавно удаленные",
                      amountOfMedia: "47",
                      isPeopleAndPlacesItem: false,
                      isHeartIcon: false,
                      isSeparatorView: false)
            ])
        ]
        
        return model
    }
}
