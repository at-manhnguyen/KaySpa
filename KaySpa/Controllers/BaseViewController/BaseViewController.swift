//
//  BaseViewController.swift
//  XinChao
//
//  Created by Nguyen Quang Manh on 8/10/17.
//  Copyright © 2017 Vinmas. All rights reserved.
//

import UIKit
import SwiftUtils

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        // Setup View
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewTapped() {
        view.endEditing(true)
    }
    
    func hideStatusBar() {
        UIApplication.shared.isStatusBarHidden = true
    }
    
    func showStatusBar() {
        UIApplication.shared.isStatusBarHidden = false
    }
    
    // Common Action
    @IBAction func touchUpInsideBack(sender: Any) {
       _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func touchUpInsideClose(sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
