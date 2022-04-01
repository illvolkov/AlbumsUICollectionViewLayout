//
//  AlbumsCollectionViewItem.swift
//  AlbumsUICollectionViewLayout
//
//  Created by Ilya Volkov on 24.03.2022.
//

import Foundation
import UIKit

final class AlbumsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = Strings.albumsCollectionViewCellIdentifier
    
    //MARK: - Views
    
    private lazy var albumImage: UIImageView = {
        let image = UIImageView()
        
        image.layer.cornerRadius = contentView.frame.width * Sizes.albumImageCornerRadiusMultiplier
        image.layer.masksToBounds = true
        
        return image
    }()
    
    private lazy var peopleImageOne = createPeopleImage(with: UIImage(named: Images.peopleOneImageName))
    private lazy var peopleImageTwo = createPeopleImage(with: UIImage(named: Images.peopleTwoImageName))
    private lazy var peopleImageThree = createPeopleImage(with: UIImage(named: Images.peopleThreeImageName))
    private lazy var peopleImageFour = createPeopleImage(with: UIImage(named: Images.peopleFourImageName))
    
    private lazy var albumNameLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.font = .systemFont(ofSize: contentView.frame.width * Sizes.multiplierFontSize0_091)
        
        return label
    }()
    
    private lazy var numberOfPhotoLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.font = .systemFont(ofSize: contentView.frame.width * Sizes.multiplierFontSize0_091)
        label.alpha = Display.numberOfPhotoLabelAlpha
        
        return label
    }()
    
    private lazy var favoritesIcon: UIImageView = {
        let icon = UIImageView()
        
        icon.image = UIImage(systemName: Images.favoritesImageName)
        icon.tintColor = .white
        
        return icon
    }()
    
    private func createPeopleImage(with peopleImage: UIImage?) -> UIImageView {
        let imageView = UIImageView()
        
        imageView.layer.cornerRadius = contentView.frame.width * Sizes.peopleImageCornerRadiusMultiplier
        imageView.layer.masksToBounds = true
        imageView.image = peopleImage
        
        return imageView
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        peopleImageOne.removeFromSuperview()
        peopleImageTwo.removeFromSuperview()
        peopleImageThree.removeFromSuperview()
        peopleImageFour.removeFromSuperview()
    }
    
    //MARK: - Settings 
    
    //Настройка отображения вьюх
    private func setupDisplay(with model: AlbumItem) {
        if model.isPeopleAndPlacesItem {
            contentView.addSubview(peopleImageOne)
            contentView.addSubview(peopleImageTwo)
            contentView.addSubview(peopleImageThree)
            contentView.addSubview(peopleImageFour)
            contentView.addSubview(albumNameLabel)
            contentView.addSubview(numberOfPhotoLabel)
            
            peopleImageOne.translatesAutoresizingMaskIntoConstraints = false
            peopleImageTwo.translatesAutoresizingMaskIntoConstraints = false
            peopleImageThree.translatesAutoresizingMaskIntoConstraints = false
            peopleImageFour.translatesAutoresizingMaskIntoConstraints = false
            
            peopleImageOne.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            peopleImageOne.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
            peopleImageOne.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: Sizes.widthMultiplier0_49).isActive = true
            peopleImageOne.heightAnchor.constraint(equalTo: peopleImageOne.widthAnchor).isActive = true
            
            peopleImageTwo.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            peopleImageTwo.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
            peopleImageTwo.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: Sizes.widthMultiplier0_49).isActive = true
            peopleImageTwo.heightAnchor.constraint(equalTo: peopleImageTwo.widthAnchor).isActive = true
            
            peopleImageThree.topAnchor.constraint(equalTo: peopleImageOne.bottomAnchor, constant: Offsets.topOffset3).isActive = true
            peopleImageThree.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
            peopleImageThree.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: Sizes.widthMultiplier0_49).isActive = true
            peopleImageThree.heightAnchor.constraint(equalTo: peopleImageThree.widthAnchor).isActive = true
            
            peopleImageFour.topAnchor.constraint(equalTo: peopleImageTwo.bottomAnchor, constant: Offsets.topOffset3).isActive = true
            peopleImageFour.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
            peopleImageFour.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: Sizes.widthMultiplier0_49).isActive = true
            peopleImageFour.heightAnchor.constraint(equalTo: peopleImageFour.widthAnchor).isActive = true
            
            albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
            albumNameLabel.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Offsets.topOffset6).isActive = true
            albumNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
            
            numberOfPhotoLabel.translatesAutoresizingMaskIntoConstraints = false
            numberOfPhotoLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: Offsets.topOffset3).isActive = true
            numberOfPhotoLabel.widthAnchor.constraint(equalTo: albumNameLabel.widthAnchor).isActive = true
            
        } else {
            contentView.addSubview(albumImage)
            contentView.addSubview(albumNameLabel)
            contentView.addSubview(numberOfPhotoLabel)
                
            albumImage.translatesAutoresizingMaskIntoConstraints = false
            albumImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            albumImage.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
            albumImage.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
            albumImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
                
            albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
            albumNameLabel.topAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: Offsets.topOffset6).isActive = true
            albumNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true

            numberOfPhotoLabel.translatesAutoresizingMaskIntoConstraints = false
            numberOfPhotoLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: Offsets.topOffset3).isActive = true
            numberOfPhotoLabel.widthAnchor.constraint(equalTo: albumNameLabel.widthAnchor).isActive = true
            
                if model.isHeartIcon {
                    contentView.addSubview(favoritesIcon)
                    
                    favoritesIcon.translatesAutoresizingMaskIntoConstraints = false
                    favoritesIcon.leftAnchor.constraint(equalTo: contentView.leftAnchor,
                                                        constant: Offsets.favoritesIconLeftOffset).isActive = true
                    favoritesIcon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                          constant: Offsets.favoritesIconBottomOffset).isActive = true
                    favoritesIcon.widthAnchor.constraint(equalTo: contentView.widthAnchor,
                                                         multiplier: Sizes.favoritesIconWidthMultiplier0_13).isActive = true
                    favoritesIcon.heightAnchor.constraint(equalTo: favoritesIcon.widthAnchor).isActive = true
                }
            }
        }
    
    func configure(with model: AlbumItem) {
        albumImage.image = model.image
        albumNameLabel.text = model.name
        numberOfPhotoLabel.text = model.amountOfMedia
        setupDisplay(with: model)
    }

}

//MARK: - Constants

extension AlbumsCollectionViewCell {
    enum Offsets {
        static let topOffset3: CGFloat = 3
        static let topOffset6: CGFloat = 6
        static let favoritesIconLeftOffset: CGFloat = 5
        static let favoritesIconBottomOffset: CGFloat = -5
    }
    
    enum Sizes {
        static let widthMultiplier0_49: CGFloat = 0.49
        static let multiplierFontSize0_091: CGFloat = 0.091
        static let favoritesIconWidthMultiplier0_13: CGFloat = 0.13
        static let albumImageCornerRadiusMultiplier: CGFloat = 0.03
        static let peopleImageCornerRadiusMultiplier: CGFloat = 0.25
    }
    
    enum Display {
        static let numberOfPhotoLabelAlpha: CGFloat = 0.6
    }
    
    enum Strings {
        static let albumsCollectionViewCellIdentifier: String = "AlbumsCollectionViewCell"
    }
    
    enum Images {
        static let peopleOneImageName: String = "people.photo.one"
        static let peopleTwoImageName: String = "people.photo.two"
        static let peopleThreeImageName: String = "people.photo.three"
        static let peopleFourImageName: String = "people.photo.four"
        static let favoritesImageName: String = "heart.fill"
    }
}
