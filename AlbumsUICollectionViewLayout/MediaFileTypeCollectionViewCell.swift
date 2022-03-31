//
//  MediaFileTypeCollectionViewCell.swift
//  AlbumsUICollectionViewLayout
//
//  Created by Ilya Volkov on 29.03.2022.
//

import Foundation
import UIKit

final class MediaFileTypeCollectionViewCell: UICollectionViewListCell {
    
    static let identifier = Strings.mediaFileTypeCollectionViewCellIdentifier
    
    //MARK: - Views
    private lazy var albumIcon: UIImageView = {
        let image = UIImageView()
        image.tintColor = .systemBlue
        return image
    }()
    
    private lazy var albumNameLabel: UILabel = {
        let label = UILabel()
        
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: contentView.frame.width * Sizes.albumNameLabelFontMultiplierSize)
        return label
        
    }()
    
    private lazy var numberOfPhotoLabel: UILabel = {
        let label = UILabel()
        
        label.adjustsFontSizeToFitWidth = true
        label.alpha = Display.numberOfPhotoLabelAlpha
        
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        view.alpha = Display.separatorViewAlpha
        
        return view
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()

        separatorView.removeFromSuperview()
    }
    
    //MARK: - Settings
    
    private func setupDisplay(with model: AlbumItem) {
        contentView.addSubview(albumIcon)
        contentView.addSubview(albumNameLabel)
        contentView.addSubview(numberOfPhotoLabel)
        if model.isSeparatorView {
            contentView.addSubview(separatorView)
            
            separatorView.translatesAutoresizingMaskIntoConstraints = false
            separatorView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Offsets.leftOffset47).isActive = true
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            separatorView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
            separatorView.heightAnchor.constraint(equalTo: contentView.widthAnchor,
                                                  multiplier: Sizes.separatorViewHeightMultiplierSize).isActive = true
        }
        
        albumIcon.translatesAutoresizingMaskIntoConstraints = false
        albumIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        albumIcon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor,
                                           constant: Offsets.albumIconCenterXOffset).isActive = true
        
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        albumNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Offsets.leftOffset47).isActive = true
        
        numberOfPhotoLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfPhotoLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        numberOfPhotoLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,
                                                  constant: Offsets.numberOfPhotoLabelRightOffset).isActive = true
    }
    
    func configure(with model: AlbumItem) {
        albumIcon.image = model.image
        albumNameLabel.text = model.name
        numberOfPhotoLabel.text = model.amountOfMedia
        setupDisplay(with: model)
    }
}

//MARK: - Constants

extension MediaFileTypeCollectionViewCell {
    enum Offsets {
        static let leftOffset47: CGFloat = 47
        static let albumIconCenterXOffset: CGFloat = -152
        static let numberOfPhotoLabelRightOffset: CGFloat = -6
    }
    
    enum Sizes {
        static let separatorViewHeightMultiplierSize: CGFloat = 0.001
        static let albumNameLabelFontMultiplierSize: CGFloat = 0.058
    }
    
    enum Display {
        static let numberOfPhotoLabelAlpha: CGFloat = 0.5
        static let separatorViewAlpha: CGFloat = 0.4
    }
    
    enum Strings {
        static let mediaFileTypeCollectionViewCellIdentifier: String = "MediaFileTypeCollectionViewCell"
    }
}
