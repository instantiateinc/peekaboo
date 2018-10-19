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
        IIHelper.animate({
            sender.isEnabled = false
            IIHelper.changeAlpha(of: [self.peekaBooImageView], to: 0.1)
        }, {
            IIHelper.changeAlpha(of: [self.peekaBooImageView], to: 1.0)
        }) {
            sender.isEnabled = true
        }
    }
    
    

    // MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

