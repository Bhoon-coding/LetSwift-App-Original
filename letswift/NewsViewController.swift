//
//  NewsViewController.swift
//  letswift
//
//  Created by JK on 11/09/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var mediaArray = [Media]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "News"
        if #available(iOS 11, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        NotificationCenter.default.addObserver(self, selector: #selector(NewsViewController.dataUpdated), name: API.NotificationNewsUpdated, object: nil)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.estimatedRowHeight = 132
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    @objc func dataUpdated(_ notification: Notification) {
        self.tableView.reloadData()
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NetworkManager.shared().newsList.count + NetworkManager.shared().photoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row < NetworkManager.shared().newsList.count) {
            let photoField = NetworkManager.shared().newsList[indexPath.row]["photo"] ?? ""
            if photoField.count > 4 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "photoNewsCell", for: indexPath) as! PhotoNewsTableViewCell
                cell.titleLabel.text = NetworkManager.shared().newsList[indexPath.row]["title"] ?? ""
                cell.subtitleLabel.text = NetworkManager.shared().newsList[indexPath.row]["datetime"] ?? ""
                cell.descriptionTextLabel.text = NetworkManager.shared().newsList[indexPath.row]["description"] ?? ""
                cell.samplePhoto.sd_setImage(with: URL(string: photoField), completed: { (image, error, cachaType, url) in

                })
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
                cell.titleLabel.text = NetworkManager.shared().newsList[indexPath.row]["title"] ?? ""
                cell.subtitleLabel.text = NetworkManager.shared().newsList[indexPath.row]["datetime"] ?? ""
                cell.descriptionTextLabel.text = NetworkManager.shared().newsList[indexPath.row]["description"] ?? ""
                return cell
            }
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as! PhotoTableViewCell
            let rowIndex = indexPath.row - NetworkManager.shared().newsList.count
            cell.titleLabel.text = NetworkManager.shared().photoList[rowIndex]["title"] as? String ?? ""
            cell.subtitleLabel.text = NetworkManager.shared().photoList[rowIndex]["datetime"] as? String ?? ""
            let photoList = NetworkManager.shared().photoList[rowIndex]["list"] as! Array<String>
            cell.samplePhotos[0].sd_setImage(with: URL(string:photoList[0]), completed: { (image, error, cacheType, url) in
//                DispatchQueue.main.async {
//                    self.tableView.reloadRows(at: [indexPath], with: .none)
//                }
            })
            cell.samplePhotos[1].sd_setImage(with: URL(string:photoList[1]), completed: { (image, error, cacheType, url) in
//                DispatchQueue.main.async {
//                    self.tableView.reloadRows(at: [indexPath], with: .none)
//                }
            })
            cell.samplePhotos[2].sd_setImage(with: URL(string:photoList[2]), completed: { (image, error, cacheType, url) in
//                DispatchQueue.main.async {
//                    self.tableView.reloadRows(at: [indexPath], with: .none)
//                }
            })

            return cell
        }
    }
}

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if (indexPath.row < NetworkManager.shared().newsList.count) {
            
        }
        else {
            let rowIndex = indexPath.row - NetworkManager.shared().newsList.count
            let photoArray = NetworkManager.shared().photoList[rowIndex]["list"] as! Array<String>
            mediaArray.removeAll()
            for photo in photoArray {
                let mediaItem = Media(url: URL(string: photo)!)
                mediaArray.append(mediaItem)
            }
            let browser = MediaBrowser(delegate: self)
            browser.enableSwipeToDismiss = true
            browser.enableGrid = true
            browser.startOnGrid = true
            self.navigationController?.pushViewController(browser, animated: true)
        }
    }
}

extension NewsViewController: MediaBrowserDelegate {
    func numberOfMedia(in mediaBrowser: MediaBrowser) -> Int {
        return mediaArray.count
    }
    
    func media(for mediaBrowser: MediaBrowser, at index: Int) -> Media {
        return mediaArray[index]
    }
    
    func thumbnail(for mediaBrowser: MediaBrowser, at index: Int) -> Media {
        return mediaArray[index]
    }
}

