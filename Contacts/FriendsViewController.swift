//
//  FriendsViewController.swift
//  Contacts
//
//  Created by Ronald Fornis Paglinawan on 17/06/21.
//

import UIKit

class FriendsViewController: UIViewController {

    /// class variables and constants
    var friends = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}


// MARK: - UITableViewDataSource Protocols
extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as? friendsTableViewCell
        cell?.friendsLabel.text = friends[indexPath.row]

        return cell!
    }
}
