//
//  ProfileTableViewCell.swift
//  UsersApp
//
//  Created by Игорь on 23.03.2021.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    


    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
//    @IBOutlet weak var fieldNameCellView: UILabel!
//    @IBOutlet weak var fieldValueCellView: UILabel!
    @IBOutlet weak var fieldValueCellView: UITextField!
    
    @IBOutlet weak var fieldNameCellView: UILabel!
    

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
