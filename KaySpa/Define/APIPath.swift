//
//  APIPath.swift
//  XinChao
//
//  Created by Nguyen Quang Manh on 8/10/17.
//  Copyright © 2017 Vinmas. All rights reserved.
//

import UIKit

class APIPath {
    
    // MARK: - Base URL
    #if RELEASE
    static let baseURL = ""
    #else
    static let baseURL = ""
    #endif

    // MAKR: - Path
    // MARK: -
    static let postLogin = APIPath.baseURL + ""
    static let postRegister = APIPath.baseURL + ""
}
