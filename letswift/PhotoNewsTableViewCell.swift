//
//  PhotoNewsTableViewCell.swift
//  letswift
//
//  Created by Jung Kim on 22/09/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import UIKit

class PhotoNewsTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    @IBOutlet var samplePhoto: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
