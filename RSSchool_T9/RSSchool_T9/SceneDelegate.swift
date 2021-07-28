//
// 📰 🐸
// Project: RSSchool_T9
//
// Author: Uladzislau Volchyk
// On: 23.07.21
//
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else {
            fatalError("LOL, be careful, drink some water")
        }
        
        window = UIWindow(windowScene: scene)
        
        window?.rootViewController = self.rootViewController()
        window?.makeKeyAndVisible()
    }

    // make tabBarViewController
    func rootViewController() -> UIViewController {
        // items ViewController  plug
        let itemsViewController = UIViewController() // will be change on custom itemsVC
        
        itemsViewController.view.backgroundColor = .orange
        /// set tabBarItem appearance
        itemsViewController.tabBarItem = UITabBarItem.init(title: "Items", image: UIImage.init(systemName: "square.grid.2x2"), tag: 0)
        
        // settings ViewController plug
        let settingsViewController = UIViewController() // will be change on custom itemsVC
        
        settingsViewController.view.backgroundColor = .purple
        /// set tabBarItem appearance
        settingsViewController.tabBarItem = UITabBarItem.init(title: "Settings", image: UIImage.init(systemName: "gear"), tag: 0)
        
        
        //MARK: - TabBarController settings
        let tabBarController = UITabBarController()
        var tabBarControllers: [UIViewController] = []
        /// add viewControllers
        tabBarControllers.append(itemsViewController)
        tabBarControllers.append(settingsViewController)
        tabBarController.viewControllers = tabBarControllers
        /// set VC to default
        tabBarController.selectedViewController = itemsViewController
        /// off btn edit
        tabBarController.customizableViewControllers = nil
        /// set appearance
        tabBarController.tabBar.tintColor = .red
        tabBarController.tabBar.barTintColor = .white
        
        
        return tabBarController
    }

}
