//
//  AlbumsCollectionViewItem.swift
//  AlbumsUICollectionViewLayout
//
//  Created by Ilya Volkov on 24.03.2022.
//

import Foundation
import UIKit

final class AlbumsCollectionViewCell: UICollectionViewListCell {
    
    static let identifier = "AlbumsCollectionViewCell"
        
    private lazy var albumImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = contentView.frame.width * 0.03
        image.layer.masksToBounds = true
        return image
    }()
    
    private lazy var peopleImageOne = createPeopleImage(with: UIImage(named: "people.image.one"))
    private lazy var peopleImageTwo = createPeopleImage(with: UIImage(named: "people.image.two"))
    private lazy var peopleImageThree = createPeopleImage(with: UIImage(named: "people.image.three"))
    private lazy var peopleImageFour = createPeopleImage(with: UIImage(named: "people.image.four"))
    
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
    
    private lazy var heartIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "heart.fill")
        icon.tintColor = .white
        return icon
    }()
    
    private func createPeopleImage(with peopleImage: UIImage?) -> UIImageView {
        let imageView = UIImageView()
        
        imageView.layer.cornerRadius = 12
        imageView.image = peopleImage
        
        return imageView
    }
    
    private func setupDisplay(with model: AlbumItem) {
        if model.isPeopleItem {
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
            peopleImageTwo.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
            
            peopleImageTwo.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            peopleImageTwo.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
            
            peopleImageThree.topAnchor.constraint(equalTo: peopleImageOne.bottomAnchor).isActive = true
            peopleImageThree.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
            
            peopleImageFour.topAnchor.constraint(equalTo: peopleImageTwo.bottomAnchor).isActive = true
            peopleImageFour.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
            
            albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
            albumNameLabel.topAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            albumNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
            
            numberOfPhotoLabel.translatesAutoresizingMaskIntoConstraints = false
            numberOfPhotoLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor).isActive = true
            numberOfPhotoLabel.widthAnchor.constraint(equalTo: albumNameLabel.widthAnchor).isActive = true
        } else {
            contentView.addSubview(albumImage)
            contentView.addSubview(albumNameLabel)
            contentView.addSubview(numberOfPhotoLabel)
            
            if model.isListItem {
                albumImage.translatesAutoresizingMaskIntoConstraints = false
                albumImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
                albumImage.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
                
                albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
                albumNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
                albumNameLabel.leftAnchor.constraint(equalTo: albumImage.rightAnchor).isActive = true
                
                numberOfPhotoLabel.translatesAutoresizingMaskIntoConstraints = false
                numberOfPhotoLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
                numberOfPhotoLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,
                                                          constant: -20).isActive = true
            } else {
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
                    contentView.addSubview(heartIcon)
                    
                    heartIcon.translatesAutoresizingMaskIntoConstraints = false
                    heartIcon.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
                    heartIcon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
                    heartIcon.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.13).isActive = true
                    heartIcon.heightAnchor.constraint(equalTo: heartIcon.widthAnchor).isActive = true
                }
            }
        }

    }
    
    func configure(with model: AlbumItem) {
        albumImage.image = model.photo
        albumImage.tintColor = model.isListItem ? .systemBlue : nil
        albumNameLabel.text = model.albumName
        albumNameLabel.textColor = model.isListItem ? .systemBlue : nil
        numberOfPhotoLabel.text = model.numberOfPhoto
        setupDisplay(with: model)
    }

}
