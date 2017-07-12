//
//  ArticleListViewController.swift
//  Qiita
//
//  Created by 新妻健介 on 2017/07/07.
//  Copyright © 2017年 新妻健介. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class ArticleListViewController: UITableViewController {

    let apiURL = "https://qiita.com/api/v2/items"
    
    var QiitaArticles = [QiitaData]()
    var imageCache = NSCache<AnyObject, AnyObject>()
//    var qiitaData[QiitaArticles]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getQiitaArticles()
    }
    
    func getQiitaArticles() {
        Alamofire.request("https://qiita.com/api/v2/items").responseJSON { response in
            guard let resp = response.result.value else {
                return
            }
            let json = JSON(resp)
            json.forEach { (_, qiitaUserData) in
//                let dict = [
//                    "title": qiitaUserData["title"].string!,
//                    "userId": qiitaUserData["user"]["id"].string!,
//                    "imageURL": qiitaUserData["user"]["profile_image_url"].string!
//                ]
//                self.QiitaArticles.append(dict)
                let qiitaData = QiitaData()
                qiitaData.title = qiitaUserData["title"].string!
                qiitaData.userName = qiitaUserData["user"]["id"].string!
                qiitaData.userImageURL = qiitaUserData["user"]["profile_image_url"].string!
                qiitaData.pageURL = qiitaUserData["url"].string!
                self.QiitaArticles.append(qiitaData)
            }
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.QiitaArticles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "qiitaArticleListCell", for: indexPath) as! ItemTableViewCell
        
        
        // Configure the cell...
        let qiitaData = QiitaArticles[indexPath.row]
        cell.title.text = qiitaData.title
        cell.title.numberOfLines = 0
        cell.userName.text = qiitaData.userName
        cell.itemURL = qiitaData.pageURL

        if let userImageURL = qiitaData.userImageURL {
            let url = URL(string: userImageURL)!
            cell.itemImage.af_setImage(withURL: url)
            return cell
        }
        return cell
    }
    
//    func segueToSecondViewController() {
//        self.performSegue(withIdentifier: "goToWebView", sender: self.qiitaData.pageURL)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? ItemTableViewCell {
            if segue.identifier == "goToWebView" {
                if let webViewController = segue.destination as? WebViewController {
                    webViewController.qiitaURL = cell.itemURL
                }
            }
        }

    }
}
