//
//  AlbumController.swift
//  AlbumsUICollectionViewLayout
//
//  Created by Ilya Volkov on 05.04.2022.
//

import UIKit

final class AlbumController: UIViewController {
    
    //MARK: - View
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect(origin: view.frame.origin, size: CGSize(width: view.frame.width, height: view.frame.height)), collectionViewLayout: createCompositionalLayout())
        
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
    
    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationController()
    }
    
    //MARK: - Settings
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupNavigationController() {
        navigationItem.title = Strings.navigationItemTitle
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: Icons.navigationItemButtonIcon))
        navigationController?.navigationBar.layoutMargins = .init(top: 0,
                                                                  left: Offsets.navigationItemTitleLeftOffset,
                                                                  bottom: 0,
                                                                  right: 0)
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowColor = .clear
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    //Модели данных
    var models = AlbumModel.configure()
    
    //Конфигурация секций
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let sectionType = self.models[sectionIndex].type
            
            switch sectionType {
            case Strings.peopleAndPlacesSectionType:
                return self.createPeopleAndPlacesSection()
            case Strings.mediaFileTypesSectionType:
                return self.createMediaFileTypesSection()
            case Strings.otherSectionType:
                return self.createOtherSection()
            default:
                return self.createMyAlbumsSection()
            }
        }
        return layout
    }
    
    //MARK: - Sections
    
    //Настройка секции Мои альбомы
    private func createMyAlbumsSection() -> NSCollectionLayoutSection {
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Sizes.fractionalSize1),
                                                heightDimension: .absolute(Sizes.headerAbsoluteSize45))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Sizes.fractionalSize1),
                                              heightDimension: .fractionalHeight(Sizes.fractionalSize0_5))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets.init(top: 0,
                                                          leading: Offsets.itemLeadingTrailngOffset5,
                                                          bottom: Offsets.itemMyAlbumsBottomOffset,
                                                          trailing: Offsets.itemLeadingTrailngOffset5)
        
        let verticalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Sizes.fractionalSize1),
                                                       heightDimension: .fractionalHeight(Sizes.fractionalSize1))
        let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: verticalGroupSize, subitems: [item])
        
        let horizontalGroupSize = NSCollectionLayoutSize(widthDimension: .estimated(view.frame.size.width / Sizes.groupMyAlbumsWidthDivisionSize),
                                                         heightDimension: .estimated(view.frame.size.width / Sizes.groupMyAlbumsHeightDivisionSize))
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: horizontalGroupSize, subitems: [verticalGroup])
        
        let section = NSCollectionLayoutSection(group: horizontalGroup)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [header]
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 0,
                                                             leading: Offsets.sectionLeadingTrailngOffset13,
                                                             bottom: 0,
                                                             trailing: Offsets.sectionLeadingTrailngOffset13)
        
        return section
    }
    
    //Настройка секции Люди и места
    private func createPeopleAndPlacesSection() -> NSCollectionLayoutSection {
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Sizes.fractionalSize1),
                                                heightDimension: .absolute(Sizes.headerAbsoluteSize45))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        header.contentInsets = NSDirectionalEdgeInsets(top: view.frame.width * Offsets.topMultiplierOffset0_145,
                                                       leading: 0,
                                                       bottom: 0,
                                                       trailing: 0)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Sizes.fractionalSize0_5),
                                              heightDimension: .fractionalHeight(Sizes.fractionalSize1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                     leading: Offsets.itemLeadingTrailngOffset5,
                                                     bottom: 0,
                                                     trailing: Offsets.itemLeadingTrailngOffset5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(view.frame.size.width * Sizes.groupPeopleAndPlacesWidthDivisionSize),
                                               heightDimension: .estimated(view.frame.size.width * Sizes.groupPeopleAndPlacesHeightDivisionSize))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: view.frame.width * Offsets.topMultiplierOffset0_145,
                                                        leading: Offsets.sectionLeadingTrailngOffset13,
                                                        bottom: 0,
                                                        trailing: Offsets.sectionLeadingTrailngOffset13)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    //Настройка секции Типы медиафайлов
    private func createMediaFileTypesSection() -> NSCollectionLayoutSection {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Sizes.fractionalSize1),
                                                heightDimension: .fractionalWidth(Sizes.fractionSize0_25))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        header.contentInsets = NSDirectionalEdgeInsets(top: view.frame.width * Offsets.headerMediaFileTypesMultiplierTopOffset,
                                                       leading: 0,
                                                       bottom: 0,
                                                       trailing: 0)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Sizes.fractionalSize1),
                                              heightDimension: .fractionalHeight(Sizes.fractionalSize1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Sizes.fractionalSize1),
                                               heightDimension: .estimated(view.frame.size.width * Sizes.groupMultiplierSize0_13))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: view.frame.width * Offsets.multiplierTopOffset0_3,
                                                        leading: Offsets.sectionLeadingTrailngOffset13,
                                                        bottom: 0,
                                                        trailing: Offsets.sectionLeadingTrailngOffset13)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    //Настройка секции Другое
    private func createOtherSection() -> NSCollectionLayoutSection {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Sizes.fractionalSize1),
                                                heightDimension: .fractionalWidth(Sizes.fractionSize0_25))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        header.contentInsets = NSDirectionalEdgeInsets(top: view.frame.width * Offsets.multiplierTopOffset0_3,
                                                       leading: 0,
                                                       bottom: 0,
                                                       trailing: 0)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Sizes.fractionalSize1),
                                              heightDimension: .fractionalHeight(Sizes.fractionalSize1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Sizes.fractionalSize1),
                                               heightDimension: .estimated(view.frame.size.width * Sizes.groupMultiplierSize0_13))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: view.frame.width * Offsets.sectionOtherMultiplierTopOffset,
                                                        leading: Offsets.sectionLeadingTrailngOffset13,
                                                        bottom: 0,
                                                        trailing: Offsets.sectionLeadingTrailngOffset13)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
}

//MARK: - UICollectionViewDataSource methods

extension AlbumController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models[section].options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = models[indexPath.section].type
        let modelItem = models[indexPath.section].options[indexPath.row]
        //Тип ячейки устанавливается в зависимости от тайтла хедера секции
        if sectionType == Strings.myAlbumsSectionType || sectionType == Strings.peopleAndPlacesSectionType {
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

//MARK: - UICollectionViewDelegate methods

extension AlbumController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let itemName = models[indexPath.section].options[indexPath.row].name
        print("Нажата ячейка", itemName)
    }
}

//MARK: - Constants

extension AlbumController {
    enum Offsets {
        static let sectionLeadingTrailngOffset13: CGFloat = 13
        static let sectionOtherMultiplierTopOffset: CGFloat = 0.18
        static let multiplierTopOffset0_3: CGFloat = 0.3
        static let topMultiplierOffset0_145: CGFloat = 0.145
        static let itemLeadingTrailngOffset5: CGFloat = 5
        static let itemMyAlbumsBottomOffset: CGFloat = 65
        static let navigationItemTitleLeftOffset: CGFloat = 20
        static let headerMediaFileTypesMultiplierTopOffset: CGFloat = 0.43
    }
    
    enum Sizes {
        static let fractionalSize1: CGFloat = 1
        static let fractionalSize0_5: CGFloat = 0.5
        static let fractionSize0_25: CGFloat = 0.25
        static let headerAbsoluteSize45: CGFloat = 45
        static let groupMultiplierSize0_13: CGFloat = 0.132
        static let groupMyAlbumsWidthDivisionSize: CGFloat = 2.15
        static let groupMyAlbumsHeightDivisionSize: CGFloat = 0.825
        static let groupPeopleAndPlacesWidthDivisionSize: CGFloat = 0.93
        static let groupPeopleAndPlacesHeightDivisionSize: CGFloat = 0.44
    }
    
    enum Strings {
        static let navigationItemTitle: String = "Альбомы"
        static let myAlbumsSectionType: String = "Мои альбомы"
        static let peopleAndPlacesSectionType: String = "Люди и места"
        static let mediaFileTypesSectionType: String = "Типы медиафайлов"
        static let otherSectionType: String = "Другое"
    }
    
    enum Icons {
        static let navigationItemButtonIcon: String = "plus"
    }
}

