//
//  VideoDescriptionTableViewCell.swift
//  letswift
//
//  Created by JK on 12/09/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import UIKit

class VideoDescriptionTableViewCell: UITableViewCell {
    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var videoDescriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
