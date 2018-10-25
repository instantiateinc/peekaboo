//
//  PeekaBoo.swift
//  PeekaBoo
//
//  Created by Gabriel Mesquita on 2018-10-21.
//  Copyright © 2018 Instantiate inc. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class PeekaBoo {
    
    func speak(_ utterance: String) {
        let utterance = AVSpeechUtterance(string: utterance)
        //utterance.pitchMultiplier = 0.5
        // utterance.rate = 0.5
        let speechSynthesizer = AVSpeechSynthesizer()
        speechSynthesizer.speak(utterance)
    }
    
    
    init() { }
}


// MARK:- Static Methods
extension PeekaBoo {
    
    enum ColorName: Int {
        case red
        case green
        case blue
        case yellow
        case purple
    }
    
    static let colors: [ColorName: UIColor] = [.red: #colorLiteral(red: 0.9049709439, green: 0.44176355, blue: 0.4257802963, alpha: 1), .green: #colorLiteral(red: 0.3778549433, green: 0.8270657659, blue: 0.3982149363, alpha: 1), .blue: #colorLiteral(red: 0.4027038813, green: 0.7304264903, blue: 0.8723945022, alpha: 1), .yellow: #colorLiteral(red: 0.8607054949, green: 0.8529549241, blue: 0.4075572491, alpha: 1), .purple: #colorLiteral(red: 0.7598741651, green: 0.4629042149, blue: 0.8985221982, alpha: 1)]
}
