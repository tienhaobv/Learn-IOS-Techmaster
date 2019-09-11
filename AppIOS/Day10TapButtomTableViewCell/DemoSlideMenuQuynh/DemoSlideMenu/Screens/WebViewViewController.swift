//
//  WebViewViewController.swift
//  DemoSlideMenu
//
//  Created by Taof on 9/5/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import WebKit
import SVProgressHUD

class WebViewViewController: UIViewController {

    var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self
        self.setupSlideMenuItem()
        let url = URL(string: "https://google.com")!
        webView.load(URLRequest(url: url))
        
    }
    
}

extension WebViewViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("did start")
        SVProgressHUD.show()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("didFinish")
        SVProgressHUD.dismiss()
    }
    

}
