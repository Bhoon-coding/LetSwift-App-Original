//
//  VideoViewController.swift
//  letswift
//
//  Created by JK on 11/09/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import UIKit
import SafariServices

class VideoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Videos"
        if #available(iOS 11, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension VideoViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return NetworkManager.shared().videoList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let videoTable = NetworkManager.shared().videoList[section]["table"] as! Array<Dictionary<String, String>>
        return videoTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell", for: indexPath) as! VideoDescriptionTableViewCell
        let videoTable = NetworkManager.shared().videoList[indexPath.section]["table"] as! Array<Dictionary<String, String>>
        cell.videoDescriptionLabel.text = videoTable[indexPath.row]["title"] ?? ""
        let link = videoTable[indexPath.row]["link"] ?? ""
        if link.count > 1 {
            cell.accessoryType = .disclosureIndicator
        }
        else {
            cell.accessoryType = .none
        }
        return cell
    }
}

extension VideoViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let videoTable = NetworkManager.shared().videoList[indexPath.section]["table"] as! Array<Dictionary<String, String>>
        let link = videoTable[indexPath.row]["link"] ?? ""
        if link.count > 1 {
            let webVC = SFSafariViewController.init(url: URL(string: link)!)
            webVC.title = videoTable[indexPath.row]["title"] ?? ""
            self.navigationController?.pushViewController(webVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let yearTitle : String = (NetworkManager.shared().videoList[section]["year"] as? String) ?? ""
        return yearTitle
    }
}

