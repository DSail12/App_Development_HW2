//
//  GroupsViewController.swift
//  hw2_
//
//  Created by Eugene Zvyagin on 01.07.2023.
//  

import UIKit

final class GroupsViewController: UITableViewController {

    private let groups = Group.getGroups()
    private let cellID = "group"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        tableView.rowHeight = 130
        tableView.register(GroupViewCell.self, forCellReuseIdentifier: cellID)
        tableView.separatorStyle = .none
    }

    // MARK: - TableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        guard let cell = cell as? GroupViewCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = .black
        cell.selectionStyle = .none
        
        let group = groups[indexPath.row]
        cell.configure(with: group)
                
        return cell
    }
}
