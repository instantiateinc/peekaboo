//
//  ViewController.swift
//  PeekaBoo
//
//  Created by Gabriel Mesquita on 2018-10-10.
//  Copyright © 2018 Instantiate inc. All rights reserved.
//


// MARK:- Frameworks
import UIKit
import AVFoundation


// MARK:- ViewController Class
class PeekaBooViewController: UIViewController {

    // MARK:- Property
    let peekaBoo = PeekaBoo()
    
    // MARK:- Outlets
    @IBOutlet weak var magicButton: UIButton! {
        didSet {
         IIHelper.makeCircular([magicButton])
        }
    }
    
    @IBOutlet weak var peekaBooImageView: UIImageView!
    
    
    // MARK:- Actions
    @IBAction func performMagic(_ sender: UIButton) {
        peekaBoo.speak("Booooo, You can't see me anymore!")
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
        IIHelper.animate ({
            IIHelper.changeAlpha(of: [self.peekaBooImageView], to: 1.0)
        })
        peekaBooImageView.tintColor = #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)
        //peekaBoo.speak("Welcome! My name is PeekaBoo - and I see you!!")
    }
}

