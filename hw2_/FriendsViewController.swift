//
//  FriendsViewController.swift
//  hw2_
//
//  Created by Eugene Zvyagin on 01.07.2023.
// 

import UIKit

final class FriendsViewController: UITableViewController {

    private let friends = Friend.getFriends()
    private let cellID = "friend"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        tableView.register(FriendViewCell.self, forCellReuseIdentifier: cellID)
        tableView.rowHeight = 130
        tableView.separatorStyle = .none
    }

    // MARK: - TableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        guard let cell = cell as? FriendViewCell else { return UITableViewCell() }
        
        let friend = friends[indexPath.row]
        cell.configure(with: friend)
        cell.backgroundColor = .black
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatVC = ChatViewController()
        
        chatVC.friend = friends[indexPath.row]
        navigationController?.pushViewController(chatVC, animated: true)
    }
}
