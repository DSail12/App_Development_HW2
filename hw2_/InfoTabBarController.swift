//
//  InfoTabBarController.swift
//  hw2_
//
//  Created by Eugene Zvyagin on 01.07.2023.
// 

import UIKit

final class InfoTabBarController: UITabBarController {

    weak var infoDelegate: InfoTabBarControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .orange
        tabBar.unselectedItemTintColor = .gray
        tabBar.barTintColor = .black

        let flowLayout = UICollectionViewFlowLayout()

        let friendsVC = FriendsViewController()
        let groupsVC = GroupsViewController()
        let photosVC = PhotosViewController(collectionViewLayout: flowLayout)

        friendsVC.title = "Friends"
        groupsVC.title = "Groups"
        photosVC.title = "Photos"

        friendsVC.tabBarItem.image = UIImage(systemName: "person")
        groupsVC.tabBarItem.image = UIImage(systemName: "person.2")
        photosVC.tabBarItem.image = UIImage(systemName: "photo")

        viewControllers = [friendsVC, groupsVC, photosVC]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        infoDelegate.clearData()
    }
}
