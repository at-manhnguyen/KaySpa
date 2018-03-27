//
//  Fonts.swift
//  XinChao
//
//  Created by Nguyen Quang Manh on 8/10/17.
//  Copyright © 2017 Vinmas. All rights reserved.
//

import UIKit

class Fonts {
    
    static func HelveticaNeueRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func HelveticaNeueBold(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func HelveticaNeueLight(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Light", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func FontAwesome(size: CGFloat) -> UIFont {
        return UIFont(name: "FontAwesome", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
