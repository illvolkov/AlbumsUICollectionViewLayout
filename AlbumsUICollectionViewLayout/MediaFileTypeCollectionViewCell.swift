//
//  MediaFileTypeCollectionViewCell.swift
//  AlbumsUICollectionViewLayout
//
//  Created by Ilya Volkov on 29.03.2022.
//

import Foundation
import UIKit

final class MediaFileTypeCollectionViewCell: UICollectionViewListCell {
    
    static let identifier = "MediaFileTypeCollectionViewCell"
    
    private lazy var albumIcon: UIImageView = {
        let image = UIImageView()
        image.tintColor = .systemBlue
        return image
    }()
    
    private lazy var albumNameLabel: UILabel = {
        let label = UILabel()
        
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: contentView.frame.width * 0.058)
        return label
        
    }()
    
    private lazy var numberOfPhotoLabel: UILabel = {
        let label = UILabel()
        
        label.adjustsFontSizeToFitWidth = true
        label.alpha = 0.5
        
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        view.alpha = 0.4
        
        return view
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()

        separatorView.removeFromSuperview()
    }
    
    private func setupDisplay(with model: AlbumItem) {
        contentView.addSubview(albumIcon)
        contentView.addSubview(albumNameLabel)
        contentView.addSubview(numberOfPhotoLabel)
        if model.isSeparatorView {
            contentView.addSubview(separatorView)
            
            separatorView.translatesAutoresizingMaskIntoConstraints = false
            separatorView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 47).isActive = true
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            separatorView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
            separatorView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.001).isActive = true
        }
        
        albumIcon.translatesAutoresizingMaskIntoConstraints = false
        albumIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        albumIcon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -152).isActive = true
        
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        albumNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 47).isActive = true
        
        numberOfPhotoLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfPhotoLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        numberOfPhotoLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -6).isActive = true
    }
    
    func configure(with model: AlbumItem) {
        albumIcon.image = model.image
        albumNameLabel.text = model.name
        numberOfPhotoLabel.text = model.amountOfMedia
        setupDisplay(with: model)
    }
}
