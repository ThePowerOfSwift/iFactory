//
//  Global.swift
//  iFactory
//
//  Created by Bruno Garelli on 9/9/16.
//  Copyright © 2016 Bruno Garelli. All rights reserved.
//

import Foundation
import UIKit

let bundle = Bundle.main
let fileMan = FileManager.default
let noti = NotificationCenter.default
//////////////////////////////////
let emptyLayer = CALayer.init()
let emptyImage = UIImage.init()
let emptyImageView = UIImageView.init()
public struct Global {
    enum RLMove {
        case right
        case left
    }
    static public func stringToInt(_ value: String) -> Int? {
        if let num = NumberFormatter().number(from: value) {
            return num.intValue
        } else {
            return nil
        }
    }
}
