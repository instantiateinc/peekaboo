//
//  ViewController.swift
//  PeekaBoo
//
//  Created by Gabriel Mesquita on 2018-10-10.
//  Copyright © 2018 Instantiate inc. All rights reserved.
//


// MARK:- Frameworks
import UIKit


// MARK:- ViewController Class
class PeekaBooViewController: UIViewController {

    
    // MARK:- Outlets
    @IBOutlet weak var magicButton: UIButton! {
        didSet {
         IIHelper.makeCircular([magicButton])
        }
    }
    
    @IBOutlet weak var peekaBooImageView: UIImageView!
    
    
    // MARK:- Actions
    @IBAction func performMagic(_ sender: UIButton) {
        
    }
    
    
    // MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

