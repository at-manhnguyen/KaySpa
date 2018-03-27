//
//  UserObject.swift
//  XinChao
//
//  Created by Nguyen Quang Manh on 9/14/17.
//  Copyright © 2017 Vinmas. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class UserObject: NSObject, Mappable {
    
    var userID: Int = 0
    var phoneNumber: String = ""
    var userName: String = ""
    var password: String = ""
    var email: String = ""
    var address: String = ""
    var avatarImage: UIImage = UIImage()
    var avatarImageURL: String = ""
    
    override init() {
        super.init()
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        userID <- map["id"]
        userName <- map["name"]
        var imagePath = ""
        imagePath <- map["image_path"]
        avatarImageURL = "http://125.212.253.153/hello" + imagePath
        phoneNumber <- map["phone"]
        email <- map["email"]
        address <- map["google_address"]
    }
    
    static var isLogin: Bool {
        if let loginStatus = UserDefaults.standard.value(forKey: Strings.UserIsLogin) as? Bool {
            return loginStatus
        } else {
            return false
        }
    }
    
    // MARK: - Public Static Function
    static func login(userObject: UserObject?) {
        UserDefaults.standard.set(userObject?.userID, forKey: Strings.UserID)
        UserDefaults.standard.set(userObject?.userName, forKey: Strings.UserName)
        UserDefaults.standard.set(userObject?.avatarImageURL, forKey: Strings.UserImageURL)
        UserDefaults.standard.set(true, forKey: Strings.UserIsLogin)
        UserDefaults.standard.set(userObject?.phoneNumber, forKey: Strings.UserPhone)
        UserDefaults.standard.set(userObject?.email, forKey: Strings.UserEmail)
        UserDefaults.standard.set(userObject?.address, forKey: Strings.UserAddress)
    }
    
    static func logout() {
        UserDefaults.standard.set(nil, forKey: Strings.UserID)
        UserDefaults.standard.set(nil, forKey: Strings.UserName)
        UserDefaults.standard.set(nil, forKey: Strings.UserImageURL)
        UserDefaults.standard.set(false, forKey: Strings.UserIsLogin)
        UserDefaults.standard.set(nil, forKey: Strings.UserPhone)
        UserDefaults.standard.set(nil, forKey: Strings.UserEmail)
        UserDefaults.standard.set(nil, forKey: Strings.UserAddress)
    }
    
    static func getUserObject() -> UserObject? {
        let userObject = UserObject()
        userObject.userID = UserDefaults.standard.value(forKey: Strings.UserID) as? Int ?? 0
        userObject.userName = UserDefaults.standard.value(forKey: Strings.UserName) as? String ?? ""
        userObject.avatarImageURL = UserDefaults.standard.value(forKey: Strings.UserImageURL) as? String ?? ""
        userObject.phoneNumber = UserDefaults.standard.value(forKey: Strings.UserPhone) as? String ?? ""
        userObject.email = UserDefaults.standard.value(forKey: Strings.UserEmail) as? String ?? ""
        userObject.address = UserDefaults.standard.value(forKey: Strings.UserAddress) as? String ?? ""
        
        return userObject
    }
}
