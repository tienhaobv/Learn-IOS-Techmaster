//
//  FriendList.swift
//  AutoLayout
//
//  Created by Techmaster on 3/22/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
class Friend {
    var avatar: String
    var name: String
    init (avatar: String, name: String) {
        self.avatar = avatar
        self.name = name
    }
}
class FriendList: UITableViewController {
    var friends = [
        Friend(avatar: "ferarrio_ava", name: "Stefania Ferarrio"),
        Friend(avatar: "burno_ava", name: "Burno Thawonse"),
        Friend(avatar: "john_ava", name: "John Bolta")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(FriendCell.self, forCellReuseIdentifier: "FriendCell")
        tableView.rowHeight = 100
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendCell
        let who = friends[indexPath.row]
        cell.avatar.image = UIImage(named: who.avatar)
        cell.name.text = who.name

        return cell
    }
    

    

}
