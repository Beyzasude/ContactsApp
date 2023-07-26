//
//  ContactTableViewCell.swift
//  ContactsApp
//
//  Created by Beyza Sude Erol on 25.07.2023.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var cellContactNameLabel: UILabel!
    @IBOutlet weak var cellContactImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
