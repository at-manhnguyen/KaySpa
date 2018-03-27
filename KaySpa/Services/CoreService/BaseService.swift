//
//  BaseService.swift
//  XinChao
//
//  Created by Nguyen Quang Manh on 8/12/17.
//  Copyright © 2017 Vinmas. All rights reserved.
//

import UIKit
import SwiftUtils
import Alamofire
import NVActivityIndicatorView

typealias Completion = (Any?, Error?) -> Void

class BaseService: NSObject {
    
    static var activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: (kScreenSize.width - 60)/2, y: (kScreenSize.height - 60)/2, width: 60, height: 60), type: NVActivityIndicatorType.ballRotateChase, color: Colors.MainColor, padding: nil)
    
    static func connectWebService (apiPath: String?, method: HTTPMethod, parameters: Parameters?, completion: Completion?) {
        if let apiPath = apiPath, let completion = completion {
            self.showLoading()
            Alamofire.request(apiPath, method: method, parameters: parameters).responseJSON { response in
                self.hideLoading()
                switch response.result {
                case .success:
                    if let result = response.result.value {
                        let JSON = result as? NSDictionary
                        let status = JSON?.object(forKey: "status") as? Int
                        if status == 200 {
                            if let data = JSON?.object(forKey: "data") {
                                completion (data, nil)
                            }
                        } else {
                            // Another status code
                        }
                    } else {
                        Common.showAlertController(title: Strings.AppName, message: "Json nil")
                    }
                case .failure(let error):
                    Common.showAlertController(title: Strings.AppName, message: "Request fail with error \(error)")
                }
            }
        }
    }
    
    static func showLoading() {
        if let topViewController = UIApplication.topViewController() {
            topViewController.view.addSubview(activityIndicatorView)
            activityIndicatorView.startAnimating()
        }
    }
    
    static func hideLoading() {
        activityIndicatorView.stopAnimating()
    }
    

}
