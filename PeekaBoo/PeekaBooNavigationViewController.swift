//
//  PeekaBooNavigationViewController.swift
//  PeekaBoo
//
//  Created by Gabriel Mesquita on 2018-10-19.
//  Copyright © 2018 Instantiate inc. All rights reserved.
//

import UIKit

class PeekaBooNavigationViewController: UINavigationController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.layer.shadowColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1).cgColor
        navigationBar.layer.shadowOffset = CGSize(width: 0, height: 5)
        navigationBar.layer.shadowOpacity = 0.8
        navigationBar.layer.shadowRadius = 5
    }
}
