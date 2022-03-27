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
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        view.alpha = 0.4
        
        return view
    }()
    
    func configreHeader(with sectionType: Section) {
        addSubview(titleSection)
        contentView.addSubview(separatorView)
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
