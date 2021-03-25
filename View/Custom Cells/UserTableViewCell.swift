//
//  UserTableViewCell.swift
//  UsersApp
//
//  Created by Игорь on 21.03.2021.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    private var urlString: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userSubtitle: UILabel!
    @IBOutlet weak var userTitle: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
