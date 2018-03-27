//
//  Common.swift
//  XinChao
//
//  Created by Nguyen Quang Manh on 8/12/17.
//  Copyright © 2017 Vinmas. All rights reserved.
//

import UIKit
import SwiftUtils
import AVFoundation

// MARK: - Define Ratio
struct Ratio {
    static let horizontal = kScreenSize.width / SwiftUtils.DeviceType.iPhone6.size.width
    static let vertical = kScreenSize.height / SwiftUtils.DeviceType.iPhone6.size.height
}

class Common: NSObject {

    class func showAlertController(title: String? = Strings.AppName, message: String?) {
        if let topcontroller = UIApplication.topViewController() {
            let alertViewController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction.init(title: "OK", style: .cancel, handler: nil)
            alertViewController.addAction(okAction)
            topcontroller.present(alertViewController, animated: true, completion: nil)
        }
    }
    
}
