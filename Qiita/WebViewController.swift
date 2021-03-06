//
//  WebViewController.swift
//  Qiita
//
//  Created by 新妻健介 on 2017/07/12.
//  Copyright © 2017年 新妻健介. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    var qiitaURL: String?
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let qiitaURL = qiitaURL {
            if let url = URL(string: qiitaURL) {
                let request = URLRequest(url: url)
                webView.loadRequest(request)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
