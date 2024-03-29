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
    let isSeparatorView: Bool
}

final class AlbumModel {
    static func configure() -> [Section] {
        let model = [
            
            Section(type: Strings.myAlbumsSectionType, isHeaderWithButton: true, options: [
                
                AlbumItem(image: UIImage(named: Images.recentImageName),
                      name: Strings.recentItemName,
                      amountOfMedia: Strings.recentAmountOfMedia,
                      isSeparatorView: false),
                AlbumItem(image: UIImage(named: Images.favoritesImageName),
                      name: Strings.favoritesItemName,
                      amountOfMedia: Strings.favoritesAmountOfMedia,
                      isSeparatorView: false),
                AlbumItem(image: UIImage(named: Images.colorPopImageName),
                      name: Strings.colorPopItemName,
                      amountOfMedia: Strings.amountOfMedia1,
                      isSeparatorView: false),
                AlbumItem(image: UIImage(named: Images.instagramImageName),
                      name: Strings.instagramItemName,
                      amountOfMedia: Strings.instagramAmountOfMedia,
                      isSeparatorView: false),
                AlbumItem(image: UIImage(named: Images.pinterestImageName),
                      name: Strings.pinterestItemName,
                      amountOfMedia: Strings.amountOfMedia2,
                      isSeparatorView: false),
                AlbumItem(image: UIImage(named: Images.vhsMoviesImageName),
                      name: Strings.vhsMoviesItemName,
                      amountOfMedia: Strings.vhsMoviesAmountOfMedia,
                      isSeparatorView: false),
                AlbumItem(image: UIImage(named: Images.imageNameNoPicture),
                      name: Strings.adobeScanExportItemName,
                      amountOfMedia: Strings.amountOfMedia0,
                      isSeparatorView: false),
                AlbumItem(image: UIImage(named: Images.imageNameNoPicture),
                      name: Strings.whooshItemName,
                      amountOfMedia: Strings.amountOfMedia0,
                      isSeparatorView: false),
                AlbumItem(image: UIImage(named: Images.imageNameNoPicture),
                      name: Strings.rcdItemName,
                      amountOfMedia: Strings.amountOfMedia0,
                      isSeparatorView: false),
        ]),

            Section(type: Strings.peopleAndPlacesSectionType, isHeaderWithButton: false, options: [

                AlbumItem(image: nil,
                      name: Strings.peopleItemName,
                      amountOfMedia: Strings.amountOfMedia9,
                      isSeparatorView: false),
                AlbumItem(image: UIImage(named: Images.placesImageName),
                      name: Strings.placesItemName,
                      amountOfMedia: Strings.amountOfMedia5,
                      isSeparatorView: false)
        ]),

            Section(type: Strings.mediaFileTypesSectionType, isHeaderWithButton: false, options: [

                AlbumItem(image: UIImage(systemName: Images.videoImageName),
                      name: Strings.videoItemName,
                      amountOfMedia: Strings.videoAmountOfMedia,
                      isSeparatorView: true),
                AlbumItem(image: UIImage(systemName: Images.selfieImageName),
                      name: Strings.selfieItemName,
                      amountOfMedia: Strings.selfieAmountOfMedia,
                      isSeparatorView: true),
                AlbumItem(image: UIImage(systemName: Images.livephotoImageName),
                      name: Strings.livephotosItemName,
                      amountOfMedia: Strings.amountOfMedia2,
                      isSeparatorView: true),
                AlbumItem(image: UIImage(systemName: Images.portraitsImageName),
                      name: Strings.portraitsItemName,
                      amountOfMedia: Strings.portraitsAmountOfMedia,
                      isSeparatorView: true),
                AlbumItem(image: UIImage(systemName: Images.panoramasImageName),
                      name: Strings.panoramasItemName,
                      amountOfMedia: Strings.amountOfMedia1,
                      isSeparatorView: true),
                AlbumItem(image: UIImage(systemName: Images.timelapseImageName),
                      name: Strings.timelapseItemName,
                      amountOfMedia: Strings.amountOfMedia9,
                      isSeparatorView: true),
                AlbumItem(image: UIImage(systemName: Images.slowlyImageName),
                      name: Strings.slowlyItemName,
                      amountOfMedia: Strings.amountOfMedia5,
                      isSeparatorView: true),
                AlbumItem(image: UIImage(systemName: Images.screenshotsImageName),
                      name: Strings.screenshotsItemName,
                      amountOfMedia: Strings.screenshotsAmountOfMedia,
                      isSeparatorView: true),
                AlbumItem(image: UIImage(systemName: Images.animatedImageName),
                      name: Strings.animatedItemName,
                      amountOfMedia: Strings.amountOfMedia1,
                      isSeparatorView: false)
            ]),

            Section(type: Strings.otherSectionType, isHeaderWithButton: false, options: [

                AlbumItem(image: UIImage(systemName: Images.importedImageName),
                      name: Strings.importedItenName,
                      amountOfMedia: Strings.importedAmountOfMedia,
                      isSeparatorView: true),
                AlbumItem(image: UIImage(systemName: Images.hiddenImageName),
                      name: Strings.hiddenItemName,
                      amountOfMedia: Strings.amountOfMedia0,
                      isSeparatorView: true),
                AlbumItem(image: UIImage(systemName: Images.recentlyDeletedImageName),
                      name: Strings.recentlyDeletedItemName,
                      amountOfMedia: Strings.recentlyDeletedAmountOfMedia,
                      isSeparatorView: false)
            ])
        ]
        
        return model
    }
}

//MARK: - Constants

extension AlbumModel {
    
    enum Strings {
        static let myAlbumsSectionType: String = "Мои альбомы"
        static let peopleAndPlacesSectionType: String = "Люди и места"
        static let mediaFileTypesSectionType: String = "Типы медиафайлов"
        static let otherSectionType: String = "Другое"
        static let recentItemName: String = "Недавние"
        static let favoritesItemName: String = "Избранное"
        static let colorPopItemName: String = "Color Pop"
        static let instagramItemName: String = "Instagram"
        static let pinterestItemName: String = "Pinterest"
        static let vhsMoviesItemName: String = "VHSMovies"
        static let adobeScanExportItemName: String = "Adobe Scan Exports"
        static let whooshItemName: String = "WHOOSH"
        static let rcdItemName: String = "RCD"
        static let peopleItemName: String = "Люди"
        static let placesItemName: String = "Места"
        static let videoItemName: String = "Видео"
        static let selfieItemName: String = "Селфи"
        static let livephotosItemName: String = "Фото Live Photos"
        static let portraitsItemName: String = "Портреты"
        static let panoramasItemName: String = "Панорамы"
        static let timelapseItemName: String = "Таймлапс"
        static let slowlyItemName: String = "Замедленно"
        static let screenshotsItemName: String = "Снимки экрана"
        static let animatedItemName: String = "Анимированные"
        static let importedItenName: String = "Импортированные"
        static let hiddenItemName: String = "Скрытые"
        static let recentlyDeletedItemName: String = "Недавно удаленные"
        
        static let recentAmountOfMedia: String = "1400"
        static let favoritesAmountOfMedia: String = "20"
        static let amountOfMedia1: String = "1"
        static let amountOfMedia0: String = "0"
        static let amountOfMedia2: String = "2"
        static let amountOfMedia5: String = "5"
        static let amountOfMedia9: String = "9"
        static let instagramAmountOfMedia: String = "74"
        static let vhsMoviesAmountOfMedia: String = "3"
        static let videoAmountOfMedia: String = "207"
        static let selfieAmountOfMedia: String = "95"
        static let portraitsAmountOfMedia: String = "67"
        static let screenshotsAmountOfMedia: String = "170"
        static let importedAmountOfMedia: String = "74"
        static let recentlyDeletedAmountOfMedia: String = "47"
    }
    
    enum Images {
        static let recentImageName: String = "recent"
        static let favoritesImageName: String = "favorites"
        static let colorPopImageName: String = "color.pop"
        static let instagramImageName: String = "instagram"
        static let pinterestImageName: String = "pinterest"
        static let vhsMoviesImageName: String = "vhs.movies"
        static let imageNameNoPicture: String = "no.picture"
        static let placesImageName: String = "places"
        static let videoImageName: String = "video"
        static let selfieImageName: String = "person.crop.square"
        static let livephotoImageName: String = "livephoto"
        static let portraitsImageName: String = "cube"
        static let panoramasImageName: String = "pano"
        static let timelapseImageName: String = "timelapse"
        static let slowlyImageName: String = "slowmo"
        static let screenshotsImageName: String = "camera.viewfinder"
        static let animatedImageName: String = "square.stack.3d.forward.dottedline"
        static let importedImageName: String = "square.and.arrow.down"
        static let hiddenImageName: String = "eye.slash"
        static let recentlyDeletedImageName: String = "trash"
    }
}
