//
//  ViewController.swift
//  webViewTest
//
//  Created by etrex kuo on 2015/3/19.
//  Copyright (c) 2015年 etrex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if FileFunc.CheckFileInDocument("index.html") == false{
            FileFunc.CopyFileToDocument("index", ofType: "html")
        }
        var url = FileFunc.GetUrl("index.html")
        var request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }
}

