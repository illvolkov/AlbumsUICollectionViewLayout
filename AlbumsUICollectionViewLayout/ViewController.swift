//
//  ViewController.swift
//  AlbumsUICollectionViewLayout
//
//  Created by Ilya Volkov on 22.03.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationController()
    }
    
    private func setupHierarchy() {
        
    }
    
    private func setupLayout() {
        
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


}

