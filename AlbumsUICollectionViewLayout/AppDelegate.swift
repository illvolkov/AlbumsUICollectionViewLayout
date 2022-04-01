//
//  AppDelegate.swift
//  AlbumsUICollectionViewLayout
//
//  Created by Ilya Volkov on 22.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .clear
        
        let mediaLibraryViewController = UIViewController()
        let forYouViewController = UIViewController()
        let albumsViewController = ViewController()
        let searchViewController = UIViewController()
        
        let albumsNavigationController = UINavigationController(rootViewController: albumsViewController)
        
        
        
        mediaLibraryViewController.tabBarItem = UITabBarItem(title: "Медиатека",
                                                             image: UIImage(systemName: "photo.fill.on.rectangle.fill"),
                                                             tag: 0)
        forYouViewController.tabBarItem = UITabBarItem(title: "Для вас",
                                                       image: UIImage(systemName: "list.bullet.rectangle.portrait.fill"),
                                                       tag: 1)
        albumsViewController.tabBarItem = UITabBarItem(title: "Альбомы",
                                                       image: UIImage(systemName: "rectangle.stack.fill"),
                                                       tag: 2)
        searchViewController.tabBarItem = UITabBarItem(title: "Поиск",
                                                       image: UIImage(systemName: "magnifyingglass"),
                                                       tag: 3)
        
        tabBarController.setViewControllers([mediaLibraryViewController,
                                             forYouViewController,
                                             albumsNavigationController,
                                             searchViewController], animated: false)
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }



}

