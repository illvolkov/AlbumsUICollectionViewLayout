//
//  SectionHeaders.swift
//  AlbumsUICollectionViewLayout
//
//  Created by Ilya Volkov on 27.03.2022.
//

import Foundation
import UIKit

final class SectionHeader: UICollectionViewCell {
    
    static let identifier = "SectionHeader"
    
    private lazy var titleSection: UILabel = {
        let title = UILabel()
        
        title.font = .systemFont(ofSize: contentView.frame.width * 0.06, weight: .bold)
        title.textAlignment = .left
        title.textColor = .black
        
        return title
    }()
    
    private lazy var seeAllButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Все", for: .normal)
        button.tintColor = .systemBlue

        return button
    }()
    
    func configreHeader(with sectionType: Section) {
        addSubview(titleSection)
        backgroundColor = .white
        titleSection.text = sectionType.type
        if sectionType.type == "Мои альбомы" {
            addSubview(seeAllButton)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleSection.translatesAutoresizingMaskIntoConstraints = false
        titleSection.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        titleSection.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
                
        seeAllButton.frame = CGRect(x: contentView.frame.width * 0.89,
                                    y: contentView.frame.height * 0.15,
                                    width: contentView.frame.width * 0.1,
                                    height: contentView.frame.width * 0.1)

    }
}
