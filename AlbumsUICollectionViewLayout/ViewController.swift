//
//  ViewController.swift
//  AlbumsUICollectionViewLayout
//
//  Created by Ilya Volkov on 22.03.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: - TabBar
    
    //Настройка TabBarController
    static var tabBarVC: UITabBarController = {
        let tabBar = UITabBarController()
        tabBar.tabBar.backgroundColor = .clear
        
        let mediaLibraryViewController = UIViewController()
        mediaLibraryViewController.view.backgroundColor = .white
        
        let forYouViewController = UIViewController()
        forYouViewController.view.backgroundColor = .white
        
        let albumNavigationController = UINavigationController(rootViewController: AlbumController())
        
        let searchViewController = UIViewController()
        searchViewController.view.backgroundColor = .white
        
        mediaLibraryViewController.tabBarItem = UITabBarItem(title: Strings.mediaLibraryTabTitle,
                                                             image: UIImage(systemName: Icons.mediaLibraryTabIcon),
                                                             tag: 0)
        forYouViewController.tabBarItem = UITabBarItem(title: Strings.forYouTabTitle,
                                                       image: UIImage(systemName: Icons.forYouTabIcon),
                                                       tag: 1)
        albumNavigationController.tabBarItem = UITabBarItem(title: Strings.albumsTabTitle,
                                                            image: UIImage(systemName: Icons.albumsTabIcon),
                                                       tag: 2)
        searchViewController.tabBarItem = UITabBarItem(title: Strings.searchTabTitle,
                                                       image: UIImage(systemName: Icons.searchTabIcon),
                                                       tag: 3)
        
        tabBar.setViewControllers([mediaLibraryViewController,
                                   forYouViewController,
                                   albumNavigationController,
                                   searchViewController], animated: false)
        
        return tabBar
    }()
}

//MARK: - Constants

extension ViewController {
    enum Strings {
        static let mediaLibraryTabTitle: String = "Медиатека"
        static let forYouTabTitle: String = "Для вас"
        static let albumsTabTitle: String = "Альбомы"
        static let searchTabTitle: String = "Поиск"
    }
    
    enum Icons {
        static let mediaLibraryTabIcon: String = "photo.fill.on.rectangle.fill"
        static let forYouTabIcon: String = "heart.text.square.fill"
        static let albumsTabIcon: String = "rectangle.stack.fill"
        static let searchTabIcon: String = "magnifyingglass"
    }
}
