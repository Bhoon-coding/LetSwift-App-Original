//
//  NetworkManager.swift
//  letswift
//
//  Created by JK on 11/09/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct API {
    static let baseURL = URL(string: "http://osxdev.org/letswift")!
    static let NotificationNewsUpdated = Notification.Name("NewsUpdated")
}

class NetworkManager {
    private static var sharedNetworkManager: NetworkManager = {
        let networkManager = NetworkManager(baseURL: API.baseURL)

        return networkManager
    }()
    
    // MARK: -
    let baseURL: URL
    private(set) var videoList : Array<Dictionary<String, Any>>
    private(set) var scheduleList : Array<Dictionary<String, String>>
    private(set) var workshopList : Array<Dictionary<String, String>>
    private(set) var newsList : Array<Dictionary<String, String>>
    private(set) var photoList : Array<Dictionary<String, Any>>
    
    private init(baseURL: URL) {
        self.baseURL = baseURL
        videoList = [Dictionary<String, Any>]()
        scheduleList = [Dictionary<String, String>]()
        workshopList = [Dictionary<String, String>]()
        newsList = [Dictionary<String, String>]()
        photoList = [Dictionary<String, Any>]()
    }
    
    class func shared() -> NetworkManager {
        return sharedNetworkManager
    }

    func getListData() {
        let listURL = URL(string: baseURL.absoluteString + "/list.php")!
        let data = try? Data.init(contentsOf: listURL)
        if  let data = data {
            let tempData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            if let dataDictionary = tempData as? Dictionary<String, Any> {
                self.videoList = dataDictionary["videos"] as? Array<Dictionary<String, Any>> ?? [Dictionary<String, Any>]()
                self.scheduleList = dataDictionary["schedule"] as? Array<Dictionary<String, String>> ?? [Dictionary<String, String>]()
                self.workshopList = dataDictionary["workshop"] as? Array<Dictionary<String, String>> ?? [Dictionary<String, String>]()
                self.newsList = dataDictionary["news"] as? Array<Dictionary<String, String>> ?? [Dictionary<String, String>]()
                NotificationCenter.default.post(name: API.NotificationNewsUpdated, object: nil)
                self.photoList = dataDictionary["photos"] as? Array<Dictionary<String, Any>> ?? [Dictionary<String, Any>]()
            }
        }
    }
}
