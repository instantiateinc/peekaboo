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
    
    @IBOutlet weak var peekaBooSegmentedControl: PeekaBooSegmentedControl!
    
    // MARK:- Actions
    
    
    @IBAction func peekaBooSegmentedControlValueChanged(_ sender: PeekaBooSegmentedControl) {
        if let colorName = PeekaBoo.ColorName(rawValue: sender.selectedButtonIndex) {
            peekaBooImageView.tintColor = PeekaBoo.colors[colorName]
        }
    }
    
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
        //peekaBooImageView.tintColor = PeekaBoo.colors[.green]
        peekaBooSegmentedControl.updateControl()
        peekaBooSegmentedControlValueChanged(peekaBooSegmentedControl)
        //peekaBoo.speak("Welcome! My name is PeekaBoo - and I see you!!")
    }
}

