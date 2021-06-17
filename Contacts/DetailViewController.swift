//
//  DetailViewController.swift
//  Contacts
//
//  Created by Ronald Fornis Paglinawan on 17/06/21.
//

import UIKit

class DetailViewController: UIViewController {

    /// IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    /// class variables and constants
    var name = ""
    var email = ""
    var mobile = ""
    var address = ""
    var friends = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // assign the values recieved
        nameLabel.text = name
        emailLabel.text = email
        mobileLabel.text = mobile
        addressLabel.text = address
        
        // add a navigation bar button programmatically
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Friends", style: .plain, target: self, action: #selector(showFriends))
    }
    
    @objc func showFriends() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "FriendsViewController") as? FriendsViewController
        vc?.friends = friends
        
        navigationController?.pushViewController(vc!, animated: true)
    }
}
