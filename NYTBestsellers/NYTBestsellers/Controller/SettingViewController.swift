//
//  SettingViewController.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    let settingView = SettingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(settingView)
    }

}
