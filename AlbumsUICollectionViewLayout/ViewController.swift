//
//  ViewController.swift
//  AlbumsUICollectionViewLayout
//
//  Created by Ilya Volkov on 22.03.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        collectionView.register(AlbumsCollectionViewCell.self, forCellWithReuseIdentifier: AlbumsCollectionViewCell.identifier)
        collectionView.register(SectionHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: SectionHeader.identifier)
        
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
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
        
    var models = AlbumModel.configure()
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let section = self.models[sectionIndex]
            switch section.type {
            default:
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
                                                         heightDimension: .estimated(view.frame.size.width / 0.85))
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: horizontalGroupSize, subitems: [verticalGroup])
        
        let section = NSCollectionLayoutSection(group: horizontalGroup)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [header]
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 13, bottom: 0, trailing: 13)
        
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
        let model = models[indexPath.section].options[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AlbumsCollectionViewCell.identifier,
            for: indexPath) as? AlbumsCollectionViewCell else {
            return UICollectionViewCell()
        }
        if model.isListItem {
            cell.accessories = [.disclosureIndicator()]
        }
        cell.configure(with: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let model = models[indexPath.section]
        switch model.type {
        default:
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionHeader.identifier,
                for: indexPath) as? SectionHeader else {
                return UICollectionReusableView()
            }
            header.configreHeader(with: model)
            return header
        }
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

