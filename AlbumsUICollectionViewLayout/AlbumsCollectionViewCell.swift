//
//  AlbumsCollectionViewItem.swift
//  AlbumsUICollectionViewLayout
//
//  Created by Ilya Volkov on 24.03.2022.
//

import Foundation
import UIKit

final class AlbumsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AlbumsCollectionViewCell"
        
    private lazy var albumImage: UIImageView = {
        let image = UIImageView()
        
        image.layer.cornerRadius = contentView.frame.width * 0.03
        image.layer.masksToBounds = true
        
        return image
    }()
    
    private lazy var peopleImageOne = createPeopleImage(with: UIImage(named: "people.photo.one"))
    private lazy var peopleImageTwo = createPeopleImage(with: UIImage(named: "people.photo.two"))
    private lazy var peopleImageThree = createPeopleImage(with: UIImage(named: "people.photo.three"))
    private lazy var peopleImageFour = createPeopleImage(with: UIImage(named: "people.photo.four"))
    
    private lazy var albumNameLabel: UILabel = {
        let label = UILabel()
        
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        return label
        
    }()
    
    private lazy var numberOfPhotoLabel: UILabel = {
        let label = UILabel()
        
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.alpha = 0.7
        
        return label
    }()
    
    private lazy var favoritesIcon: UIImageView = {
        let icon = UIImageView()
        
        icon.image = UIImage(systemName: "heart.fill")
        icon.tintColor = .white
        
        return icon
    }()
    
    private func createPeopleImage(with peopleImage: UIImage?) -> UIImageView {
        let imageView = UIImageView()
        
        imageView.layer.cornerRadius = contentView.frame.width * 0.25
        imageView.layer.masksToBounds = true
        imageView.image = peopleImage
        
        return imageView
    }
    
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
            peopleImageOne.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.49).isActive = true
            peopleImageOne.heightAnchor.constraint(equalTo: peopleImageOne.widthAnchor).isActive = true
            
            peopleImageTwo.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            peopleImageTwo.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
            peopleImageTwo.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.49).isActive = true
            peopleImageTwo.heightAnchor.constraint(equalTo: peopleImageTwo.widthAnchor).isActive = true
            
            peopleImageThree.topAnchor.constraint(equalTo: peopleImageOne.bottomAnchor, constant: 3).isActive = true
            peopleImageThree.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
            peopleImageThree.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.49).isActive = true
            peopleImageThree.heightAnchor.constraint(equalTo: peopleImageThree.widthAnchor).isActive = true
            
            peopleImageFour.topAnchor.constraint(equalTo: peopleImageTwo.bottomAnchor, constant: 3).isActive = true
            peopleImageFour.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
            peopleImageFour.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.49).isActive = true
            peopleImageFour.heightAnchor.constraint(equalTo: peopleImageFour.widthAnchor).isActive = true
            
            albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
            albumNameLabel.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 6).isActive = true
            albumNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
            albumNameLabel.heightAnchor.constraint(equalTo: albumNameLabel.widthAnchor, multiplier: 0.11).isActive = true
            
            numberOfPhotoLabel.translatesAutoresizingMaskIntoConstraints = false
            numberOfPhotoLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 3).isActive = true
            numberOfPhotoLabel.widthAnchor.constraint(equalTo: albumNameLabel.widthAnchor).isActive = true
            numberOfPhotoLabel.heightAnchor.constraint(equalTo: albumNameLabel.heightAnchor).isActive = true
            
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
                albumNameLabel.topAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: 6).isActive = true
                albumNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
                albumNameLabel.heightAnchor.constraint(equalTo: albumNameLabel.widthAnchor, multiplier: 0.11).isActive = true
                
                numberOfPhotoLabel.translatesAutoresizingMaskIntoConstraints = false
                numberOfPhotoLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 3).isActive = true
                numberOfPhotoLabel.widthAnchor.constraint(equalTo: albumNameLabel.widthAnchor).isActive = true
                numberOfPhotoLabel.heightAnchor.constraint(equalTo: albumNameLabel.heightAnchor).isActive = true
            
                if model.isHeartIcon {
                    contentView.addSubview(favoritesIcon)
                    
                    favoritesIcon.translatesAutoresizingMaskIntoConstraints = false
                    favoritesIcon.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
                    favoritesIcon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
                    favoritesIcon.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.13).isActive = true
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
