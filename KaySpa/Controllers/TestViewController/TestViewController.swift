//
//  TestViewController.swift
//  Template
//
//  Created by Nguyen Quang Manh on 3/22/18.
//  Copyright © 2018 Vinmas. All rights reserved.
//

import UIKit
import SwiftUtils

enum TemplateType: Int {
    case previewPhoto = 0
    case introduce
    
    var titleText: String {
        switch self {
        case .previewPhoto:
            return "Preview Photo"
        case .introduce:
            return "Introduce"
        }
    }
    
    static let count: Int = {
        var max = 0
        while let _ = TemplateType.init(rawValue: max) {
            max += 1
        }
        return max
    }()
}

class TestViewController: BaseViewController {

    // MARK: - Define
    
    // MARK: - UI
    
    @IBOutlet weak var tableView: UITableView!
    // MARK: - Data
    
    // MARK: - Method
    // MARK: Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    // MARK: SetupUI
    private func setupUI() {
        // Setup TableView
        tableView.register(TestTableViewCell.self)
    }
    // MARK: SetupData
    private func setupData() {
        
    }
    // MARK: Method
    
    // MARK: - Action
    
}

extension TestViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TemplateType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(TestTableViewCell.self)
        if let templateType = TemplateType.init(rawValue: indexPath.row) {
            cell.title.text = templateType.titleText
        }
        return cell
    }
}

extension TestViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let templateType = TemplateType.init(rawValue: indexPath.row) else { return }
        switch templateType {
        case .previewPhoto:
            let previewPhotoViewController = PhotoPreviewViewController()
            present(previewPhotoViewController, animated: true, completion: nil)
        case .introduce:
            let introduceViewController = IntroduceViewController1()
            present(introduceViewController, animated: true, completion: nil)
        }
    }
}
