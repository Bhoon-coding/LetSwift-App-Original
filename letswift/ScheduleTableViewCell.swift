//
//  ScheduleTableViewCell.swift
//  letswift
//
//  Created by JK on 12/09/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imageView?.layer.cornerRadius = 5
        self.imageView?.clipsToBounds = true
        self.imageView?.image = #imageLiteral(resourceName: "unknown")
        if (UIScreen.main.bounds.width == 320) {
            self.textLabel?.font = UIFont.systemFont(ofSize: 15)
            self.detailTextLabel?.font = UIFont.systemFont(ofSize: 11)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.frame = CGRect(x: 20, y: 8, width: 40, height: 40)
        if imageView?.image != nil {
            var lastFrame = self.textLabel?.frame
            lastFrame?.origin.x = 68
            self.textLabel?.frame = lastFrame!
            lastFrame = self.detailTextLabel?.frame
            lastFrame?.origin.x = 68
            self.detailTextLabel?.frame = lastFrame!
        }
    }

}
