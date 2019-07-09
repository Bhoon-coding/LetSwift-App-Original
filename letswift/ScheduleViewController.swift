//
//  ScheduleViewController.swift
//  letswift
//
//  Created by JK on 11/09/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var toggleButton: UIBarButtonItem!
    
    fileprivate var isSessionMode : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.title = "2018 Schedule"
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func toggleButtonTouched(_ sender: UIBarButtonItem) {
        if isSessionMode {
            sender.title = "Session"
        }
        else {
            sender.title = "Workshop"
        }
        isSessionMode.toggle()
        tableView.reloadData()
    }
}

extension ScheduleViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if isSessionMode {
            return NetworkManager.shared().scheduleList.count
        }
        else {
            return NetworkManager.shared().workshopList.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath)
        let scheduleDictionary : Dictionary<String, String>
        if isSessionMode {
            scheduleDictionary = NetworkManager.shared().scheduleList[indexPath.section]
        }
        else {
            scheduleDictionary = NetworkManager.shared().workshopList[indexPath.section]
        }
        cell.textLabel?.text = scheduleDictionary["title"]
        cell.detailTextLabel?.text = scheduleDictionary["name"] ?? ""
        let profileURL = scheduleDictionary["profile"] ?? ""
        if profileURL.count > 1 {
            cell.imageView?.sd_setImage(with: URL(string: profileURL)!, placeholderImage: #imageLiteral(resourceName: "unknown"), options: .continueInBackground, completed: { (image, error, cacheType, url) in
                cell.setNeedsLayout()
            })
        }
        else {
            cell.imageView?.image = nil
        }
        return cell
    }
}

extension ScheduleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let scheduleDictionary : Dictionary<String, String>
        if isSessionMode {
            scheduleDictionary = NetworkManager.shared().scheduleList[section]
        }
        else {
            scheduleDictionary = NetworkManager.shared().workshopList[section]
        }
        return scheduleDictionary["time"]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
}

