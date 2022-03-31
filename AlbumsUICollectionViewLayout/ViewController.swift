//
//  ViewController.swift
//  AlbumsUICollectionViewLayout
//
//  Created by Ilya Volkov on 22.03.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect(origin: view.frame.origin, size: CGSize(width: view.frame.width, height: view.frame.height - 83)), collectionViewLayout: createCompositionalLayout())
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        collectionView.register(AlbumsCollectionViewCell.self, forCellWithReuseIdentifier: AlbumsCollectionViewCell.identifier)
        collectionView.register(MediaFileTypeCollectionViewCell.self, forCellWithReuseIdentifier: MediaFileTypeCollectionViewCell.identifier)
        
        collectionView.register(SectionHeaderForAlbums.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: SectionHeaderForAlbums.identifier)
        collectionView.register(SectionHeaderForMediaFileTypes.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: SectionHeaderForMediaFileTypes.identifier)
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationController()
    }
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupNavigationController() {
        navigationItem.title = "Альбомы"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"))
        navigationController?.navigationBar.layoutMargins = .init(top: 0,
                                                                  left: 20,
                                                                  bottom: 0,
                                                                  right: 0)
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowColor = .clear
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
        
    var models = AlbumModel.configure()
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let sectionType = self.models[sectionIndex].type
            
            if sectionType == "Люди и места" {
                return self.createPeopleAndPlacesSection()
            } else if sectionType == "Типы медиафайлов" {
                return self.createMediaFileTypesSection()
            } else if sectionType == "Другое" {
                return self.createOtherSection()
            } else {
                return self.createMyAlbumsSection()
            }
        }
        return layout
    }
    
    private func createMyAlbumsSection() -> NSCollectionLayoutSection {
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(45))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 5, bottom: 65, trailing: 5)
        
        let verticalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: verticalGroupSize, subitems: [item])
        
        let horizontalGroupSize = NSCollectionLayoutSize(widthDimension: .estimated(view.frame.size.width / 2.15),
                                                         heightDimension: .estimated(view.frame.size.width / 0.825))
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: horizontalGroupSize, subitems: [verticalGroup])
        
        let section = NSCollectionLayoutSection(group: horizontalGroup)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [header]
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 13, bottom: 0, trailing: 13)
        
        return section
    }
    
    private func createPeopleAndPlacesSection() -> NSCollectionLayoutSection {
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(45))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        header.contentInsets = NSDirectionalEdgeInsets(top: 54, leading: 0, bottom: 0, trailing: 0)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(view.frame.size.width * 0.93),
                                               heightDimension: .estimated(view.frame.size.width * 0.44))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 54, leading: 13, bottom: 0, trailing: 13)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    private func createMediaFileTypesSection() -> NSCollectionLayoutSection {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.25))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        header.contentInsets = NSDirectionalEdgeInsets(top: 165, leading: 0, bottom: 0, trailing: 0)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(view.frame.size.width * 0.13))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 115, leading: 13, bottom: 0, trailing: 13)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    private func createOtherSection() -> NSCollectionLayoutSection {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.25))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        header.contentInsets = NSDirectionalEdgeInsets(top: 120, leading: 0, bottom: 0, trailing: 0)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(view.frame.size.width * 0.13))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 75, leading: 13, bottom: 0, trailing: 13)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models[section].options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = models[indexPath.section].type
        let modelItem = models[indexPath.section].options[indexPath.row]
        if sectionType == "Мои альбомы" || sectionType == "Люди и места" {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AlbumsCollectionViewCell.identifier,
                for: indexPath) as? AlbumsCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: modelItem)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MediaFileTypeCollectionViewCell.identifier,
                for: indexPath) as? MediaFileTypeCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: modelItem)
            cell.accessories = [.disclosureIndicator()]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let section = models[indexPath.section]
        if section.isHeaderWithButton {
            guard let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: SectionHeaderForAlbums.identifier,
                    for: indexPath) as? SectionHeaderForAlbums else {
                    return UICollectionReusableView()
                }
            header.configureHeader(with: section)
            return header
        } else {
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionHeaderForMediaFileTypes.identifier,
                for: indexPath) as? SectionHeaderForMediaFileTypes else {
                return UICollectionReusableView()
            }
            header.configureHeader(with: section)
            return header
        }
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row].name
        print("Нажата ячейка", model)
    }
}

