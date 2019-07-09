//
//  AboutViewController.swift
//  letswift
//
//  Created by JK on 11/09/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let quoteList = [
        ["name":"강현정", "quote":"웅, 감자 엄마 :)", "profile":"강현정.png"],
        ["name":"구범모", "quote":"사진 찍는 개발자입니다! 스태프 미모지 제작자이기도 하죠! 🐵🤖🐱🐶👽🦊💩🐷🐼🐰🐔🦄🦁🐲💀🐻🐯🐨🦖👻", "profile":"구범모.png"],
        ["name":"김은영", "quote":"🗼도쿄에서 iOS 엔지니어로 근무하고 있습니다. 라멘말고 라면이 먹고싶어요!👩‍🌾", "profile":"김은영.png"],
        ["name":"손창우", "quote":"저도 나중에 발표해보고 싶어요", "profile":"손창우.png"],
        ["name":"윤중현", "quote":"403 forbidden === tokijh", "profile":"윤중현.png"],
        ["name":"이규진", "quote":"운동어플 다짐을 개발하고 있습니다. 같이 몸무게 리팩토링해요💪🏻", "profile":"이규진.png"],
        ["name":"이동진", "quote":"BAAMMM 🤜", "profile":"이동진.png"],
        ["name":"이재성", "quote":"게임하는 개발자", "profile":"이재성.png"],
        ["name":"이태현", "quote":"초콜릿을 주면 안물어요.", "profile":"이태현.png"],
        ["name":"정상엽", "quote":"자주 정신력이 Leaked되는 개발자입니다.", "profile":"정상엽.png"],
        ["name":"정현아", "quote":"개발능력이 Optional 입니다. ( ※ 강제언랩핑 주의 )", "profile":"정현아.png"],
        ["name":"조성현", "quote":"🙌 🙌 🙌", "profile":"조성현.png"],
        ["name":"최송이", "quote":"안녕하세요 :) Zedd입니다.", "profile":"최송이.png"],
        ["name":"하태경", "quote":"guard let introduce = nothingOnBranin else { return \"잘부탁드립니다 :)\" }", "profile":"하태경.png"],
        ["name":"김정", "quote":"달콤한 스위프트와 후덕한 오브젝티브-C의 혼혈왕자", "profile":"김정.png"],
        ["name":"이승윤", "quote":"NAVER에서 신기술을 모바일에 넣는 작업을 하고 있습니다. 오픈소스와 커뮤니티활동을 즐겨합니다", "profile":"이승윤.png"],
        ["name":"전수열", "quote":"StyleShare에서 iOS 애플리케이션을 개발하고 있습니다. 오픈소스와 개발자 커뮤니티에 관심이 많습니다.", "profile":"전수열.png"],
    ]
    var randomList : [[String:String]] = [[:]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "About"
        if #available(iOS 11, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        randomList = quoteList
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var indexPathList : [IndexPath] = []
        for i in 0..<(randomList.count-1) {
            randomList.sort { (_,_) in arc4random() < arc4random() }
            indexPathList.append(IndexPath.init(row: i, section: 0) )
        }
        indexPathList.remove(at: 0)
        self.tableView.reloadRows(at: indexPathList, with: .fade)
    }
}

extension AboutViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomList.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "mapCell", for: indexPath)
            return cell
        }
        else {
            if indexPath.row % 2 == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "leftCell", for: indexPath) as! AboutLeftStyleTableViewCell
                let rowIndex = indexPath.row - 1
                let profile = randomList[rowIndex]["profile"] ?? ""
                cell.profileImageView.image = UIImage.init(named: profile)
                cell.quoteLabel.text = randomList[rowIndex]["quote"] ?? ""
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "rightCell", for: indexPath) as! AboutRightStyleTableViewCell
                let rowIndex = indexPath.row - 1
                let profile = randomList[rowIndex]["profile"] ?? ""
                cell.profileImageView.image = UIImage.init(named: profile)
                cell.quoteLabel.text = randomList[rowIndex]["quote"] ?? ""
                return cell
            }
        }
    }
}

extension AboutViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200
        }
        else {
            return 110
        }
    }
}
