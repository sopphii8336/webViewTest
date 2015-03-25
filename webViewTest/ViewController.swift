//
//  ViewController.swift
//  webViewTest
//
//  Created by etrex kuo on 2015/3/19.
//  Copyright (c) 2015年 etrex. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        FileFunc.CopyFileToDocument("index", ofType: "html")
        var url = FileFunc.GetUrl("index.html")
        var request = NSURLRequest(URL: url)
        webView.loadRequest(request)
        webView.delegate = self
        //webView.scalesPageToFit = true
    }
    
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool{
        var url = request.URL.absoluteString!
        var prefix = "myoffice://"
        if(url.hasPrefix(prefix)){
            var action = url.substringFromIndex(prefix.utf16Count)
            webAlert(action)
            return false
        }
        return true
    }

    func webViewDidFinishLoad(webView: UIWebView){
        //webAlert("ㄏㄏ")
    }
    
    func webAlert(message:String){
        webView.stringByEvaluatingJavaScriptFromString("alert('\(message)');");
    }
}

