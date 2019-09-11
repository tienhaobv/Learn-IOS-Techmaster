//
//  WebViewController.swift
//  DemoSlideMenu
//
//  Created by Ba Thoc on 9/5/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import WebKit
import SVProgressHUD

class WebViewController: UIViewController {

    var webView : WKWebView!
    
    override func loadView() {
        super.loadView()
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self

        setupSlideMenuItem()
        let url = URL(string: "https://translate.google.com")!
        webView.load(URLRequest(url: url))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension WebViewController: WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("did Strat")
        SVProgressHUD.show(UIImage(named: "menu")!, status: "menu day")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish")
        SVProgressHUD.dismiss(withDelay: 3)
    }
}
