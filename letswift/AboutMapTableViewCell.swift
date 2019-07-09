//
//  AboutMapTableViewCell.swift
//  letswift
//
//  Created by JK on 14/09/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import UIKit

class AboutMapTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func naverMapButtonTouched(_ sender: Any) {
        let url = URL(string: "http://naver.me/Gd51XHzK")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    @IBAction func appleMapButtonTouched(_ sender: Any) {
        let url = URL(string: "https://maps.apple.com/?address=22%20Teherallo7gil,%20Gangnamgu,%20Seoul,%20South%20Korea&auid=6576063783808425146&ll=37.500764,127.030642&lsp=9902&q=The%20Korea%20Science%20and%20Technology%20Center&_ext=ChoKBQgEEJQBCgQIBRADCgUIBhDfAQoECAoQABIkKT7doNSLv0JAMRq/deaYwV9AObyyxjCywEJAQVIRPGtSwl9A&t=m")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
}
