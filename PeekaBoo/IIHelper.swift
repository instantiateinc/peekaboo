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
    
    static func changeAlpha(of views: [UIView], to alpha: CGFloat) {
        views.forEach { (view) in
            view.alpha = alpha
        }
    }
}


// MARK:- Animations
extension IIHelper {
    
    static func animate(_ firstBlock: @escaping ()->(), _ secondBlock: (()->())? = nil, completion: (()->())? = nil) {
        UIView.animate(withDuration: 0.7, animations: {
            firstBlock()
        }) { (finished) in
            UIView.animate(withDuration: 0.7, animations: {
                if let secondBlock = secondBlock {
                    secondBlock()
                }
            }, completion: { (finished) in
                if let completion = completion {
                    completion()
                }
            })
        }
    }
    
}
