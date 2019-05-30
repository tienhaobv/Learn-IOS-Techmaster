//
//  ViewController.swift
//  LifeCicrleApp
//
//  Created by Ngô Hào on 5/16/19.
//  Copyright © 2019 Ngô Hào. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("viewDidAppear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("viewDidDisappear")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("viewWillAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("viewWillDisappear")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews")
    }
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        print("viewLayoutMarginsDidChange")
    }
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        print("viewSafeAreaInsetsDidChange")
    }
    
}

