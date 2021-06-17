//
//  peopleTableViewCell.swift
//  Contacts
//
//  Created by Ronald Fornis Paglinawan on 17/06/21.
//

import UIKit

class peopleTableViewCell: UITableViewCell {
    
    /// IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
