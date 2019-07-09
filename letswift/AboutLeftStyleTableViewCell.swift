//
//  AboutLeftStyleTableViewCell.swift
//  letswift
//
//  Created by JK on 14/09/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import UIKit

class AboutLeftStyleTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.profileImageView.layer.cornerRadius = 38
        self.profileImageView.clipsToBounds = true
//        self.profileImageView.layer.borderWidth = 3
//        self.profileImageView.layer.borderColor = UIColor.init(white: 0.93, alpha: 0.5).cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
