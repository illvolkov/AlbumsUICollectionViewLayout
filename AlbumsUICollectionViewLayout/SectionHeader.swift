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

final class SectionHeaderForMediaFileTypes: UICollectionViewCell, SectionHeader {
    static let identifier = "SectionHeaderForMediaFileTypes"
    
    lazy var titleSection: UILabel = {
        let title = UILabel()
        
        title.font = .systemFont(ofSize: contentView.frame.width * 0.06, weight: .bold)
        title.textAlignment = .left
        title.textColor = .black
        
        return title
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        view.alpha = 0.4
        
        return view
    }()
    
    func configureHeader(with section: Section) {
        titleSection.text = section.type
        setupDisplay(with: section)
    }
    

    func setupDisplay(with section: Section) {
        contentView.addSubview(titleSection)
        contentView.addSubview(separatorView)

        titleSection.translatesAutoresizingMaskIntoConstraints = false
        titleSection.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        titleSection.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true

        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        separatorView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 6).isActive = true
        separatorView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.001).isActive = true
    }
}

final class SectionHeaderForAlbums: UICollectionViewCell, SectionHeader {
    
    static let identifier = "SectionHeaderForAlbums"
    
    lazy var titleSection: UILabel = {
        let title = UILabel()
        
        title.font = .systemFont(ofSize: contentView.frame.width * 0.06, weight: .bold)
        title.textAlignment = .left
        title.textColor = .black
        
        return title
    }()
    
    lazy var seeAllButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Все", for: .normal)
        button.tintColor = .systemBlue

        return button
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        view.alpha = 0.4
        
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
        titleSection.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        titleSection.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true

        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        separatorView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 6).isActive = true
        separatorView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.001).isActive = true

        seeAllButton.frame = CGRect(x: contentView.frame.width * 0.89,
                                    y: contentView.frame.height * 0.15,
                                    width: contentView.frame.width * 0.1,
                                    height: contentView.frame.width * 0.1)

    }
}
