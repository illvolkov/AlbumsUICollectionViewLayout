//
//  SectionHeaders.swift
//  AlbumsUICollectionViewLayout
//
//  Created by Ilya Volkov on 27.03.2022.
//

import Foundation
import UIKit

protocol SectionHeader {
    var titleSection: UILabel { get set }
    var separatorView: UIView { get set }
    func configureHeader(with section: Section)
    func setupDisplay(with section: Section)
}

//Конфигурация хедера без кнопки
final class SectionHeaderForMediaFileTypes: UICollectionViewCell, SectionHeader {
    static let identifier = Strings.sectionHeaderForMediaFileTypesIdentifier
    
    //MARK: - Views
    
    lazy var titleSection: UILabel = {
        let title = UILabel()
        
        title.font = .systemFont(ofSize: contentView.frame.width * Sizes.titleSectionFontMultiplierSize, weight: .bold)
        title.textAlignment = .left
        title.textColor = .black
        
        return title
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        view.alpha = Display.separatorViewAlpha
        
        return view
    }()
    
    //MARK: - Settings
    
    func setupDisplay(with section: Section) {
        contentView.addSubview(titleSection)
        contentView.addSubview(separatorView)

        titleSection.translatesAutoresizingMaskIntoConstraints = false
        titleSection.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Offsets.topOffset10).isActive = true
        titleSection.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Offsets.leftOffset5).isActive = true

        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        separatorView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Offsets.leftOffset6).isActive = true
        separatorView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalTo: contentView.widthAnchor,
                                              multiplier: Sizes.heightMultiplierSize0_001).isActive = true
    }
    
    func configureHeader(with section: Section) {
        titleSection.text = section.type
        setupDisplay(with: section)
    }
}

final class SectionHeaderForAlbums: UICollectionViewCell, SectionHeader {
    
    static let identifier = Strings.sectionHeaderForAlbumsIdentifier
    
    lazy var titleSection: UILabel = {
        let title = UILabel()
        
        title.font = .systemFont(ofSize: contentView.frame.width * Sizes.titleSectionFontMultiplierSize, weight: .bold)
        title.textAlignment = .left
        title.textColor = .black
        
        return title
    }()
    
    lazy var seeAllButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle(Strings.seeAllButtonTitle, for: .normal)
        button.tintColor = .systemBlue

        return button
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        view.alpha = Display.separatorViewAlpha
        
        return view
    }()
    
    func configureHeader(with section: Section) {
        titleSection.text = section.type
        setupDisplay(with: section)
    }
    

    func setupDisplay(with section: Section) {
        contentView.addSubview(titleSection)
        contentView.addSubview(separatorView)
        contentView.addSubview(seeAllButton)

        titleSection.translatesAutoresizingMaskIntoConstraints = false
        titleSection.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Offsets.topOffset10).isActive = true
        titleSection.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Offsets.leftOffset5).isActive = true

        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        separatorView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Offsets.leftOffset6).isActive = true
        separatorView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalTo: contentView.widthAnchor,
                                              multiplier: Sizes.heightMultiplierSize0_001).isActive = true

        seeAllButton.frame = CGRect(x: contentView.frame.width * Offsets.seeAllButtonXMultiplierOffset,
                                    y: contentView.frame.height * Offsets.seeAllButtonYMultiplierOffset,
                                    width: contentView.frame.width * Sizes.seeAllButtonWidth,
                                    height: contentView.frame.width * Sizes.seeAllButtonWidth)

    }
}

//MARK: - SectionHeaderForMediaFileTypes constants

extension SectionHeaderForMediaFileTypes {
    enum Offsets {
        static let topOffset10: CGFloat = 10
        static let leftOffset5: CGFloat = 5
        static let leftOffset6: CGFloat = 6
    }
    
    enum Sizes {
        static let heightMultiplierSize0_001: CGFloat = 0.001
        static let titleSectionFontMultiplierSize: CGFloat = 0.06
    }
    
    enum Display {
        static let separatorViewAlpha: CGFloat = 0.4
    }
    
    enum Strings {
        static let sectionHeaderForMediaFileTypesIdentifier: String = "SectionHeaderForMediaFileTypes"
    }
}

//MARK: - SectionHeaderForAlbums constants

extension SectionHeaderForAlbums {
    enum Offsets {
        static let topOffset10: CGFloat = 10
        static let leftOffset5: CGFloat = 5
        static let leftOffset6: CGFloat = 6
        static let seeAllButtonXMultiplierOffset: CGFloat = 0.89
        static let seeAllButtonYMultiplierOffset: CGFloat = 0.15
    }
    
    enum Sizes {
        static let heightMultiplierSize0_001: CGFloat = 0.001
        static let seeAllButtonWidth: CGFloat = 0.1
        static let titleSectionFontMultiplierSize: CGFloat = 0.06
    }
    
    enum Display {
        static let separatorViewAlpha: CGFloat = 0.4
    }
    
    enum Strings {
        static let sectionHeaderForAlbumsIdentifier: String = "SectionHeaderForAlbums"
        static let seeAllButtonTitle: String = "Все"
    }
}
