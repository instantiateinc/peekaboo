//
//  PeekaBoo.swift
//  PeekaBoo
//
//  Created by Gabriel Mesquita on 2018-10-21.
//  Copyright © 2018 Instantiate inc. All rights reserved.
//

import Foundation
import AVFoundation

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
