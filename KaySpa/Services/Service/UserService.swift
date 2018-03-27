//
//  UserService.swift
//  XinChao
//
//  Created by Nguyen Quang Manh on 9/12/17.
//  Copyright © 2017 Vinmas. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class UserService: BaseService {
    
    // MARK: - Sign In
    class func postLogin(userObject: UserObject, completion: Completion?) {
        let params: Parameters = ["username": userObject.phoneNumber,
                                  "password": userObject.password]
        
        showLoading()
        Alamofire.request(APIPath.postLogin, method: .post, parameters: params, headers: nil).responseString { response in
            hideLoading()
            switch response.result {
            case .success:
                return
            case .failure:
                return
            }
        }
    }
    
   // MARK - Sign Up
    class func postRegister(userObject: UserObject, completion: Completion?) {
        let params: Parameters = ["phone": userObject.phoneNumber,
                                  "name": userObject.userName]
        showLoading()
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            // Add parameter
            for (key, value) in params {
                let valueString = "\(value)"
                if let data = valueString.data(using: String.Encoding.utf8) {
                    multipartFormData.append(data, withName: key)
                }
            }
            
            // Add image
            if let imageData = UIImageJPEGRepresentation(userObject.avatarImage, 0.5) {
                multipartFormData.append(imageData, withName: "image", fileName: "fileName.png", mimeType: "image/png")
            }
        }, to: APIPath.postRegister) { encodingResult in
            hideLoading()
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseString(completionHandler: { response in
                    if let _ = response.result.value {
                        
                    } else {
                        
                    }
                })
            case .failure (_):
               return
            }
        }
    }
    
}
