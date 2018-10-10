//
//  IIHelper.swift
//  Round Button
//
//  Created by Gabriel Mesquita on 2018-10-05.
//  Copyright © 2018 Instantiate inc. All rights reserved.
//


// MARK:- Frameworks
import Foundation
import UIKit


// MARK:- IIHelper Class
class IIHelper {
    
    
    // MARK:- Methods
    static func makeCircular(_ views: [UIView]) {
        views.forEach { (view) in
            view.layer.cornerRadius = view.frame.height / 2
        }
    }
}
