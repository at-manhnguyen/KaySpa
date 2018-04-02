//
//  IntroduceViewController.swift
//  KaySpa
//
//  Created by Nguyen Quang Manh on 3/27/18.
//  Copyright © 2018 Vinmas. All rights reserved.
//

import UIKit
import FSPagerView
import SwiftUtils
import LTMorphingLabel

class IntroduceViewController: BaseViewController {

    // MARK: - Define

    // MARK: - UI
    @IBOutlet weak var mainTitle: LTMorphingLabel!
    @IBOutlet weak var subTitle: LTMorphingLabel!
    @IBOutlet weak var pageControl: FSPageControl!
    var pagerView: FSPagerView = FSPagerView()
    
    // MARK: - Data
    private let mainTitleString: [String] = [
        "Khẳng định vị thế",
        "Vẻ đẹp toàn diện",
        "Chuẩn xác tối đa",
        "Chất lượng & Hài Lòng"
    ]
    
    private let subTitleString: [String] = [
        "KAY SPA tiên phong, khẳng định vị thế dẫn đầu về làm đẹp không phẩu thuật tại Việt Nam.",
        "Chăm sóc làn da chuyên sâu, góc nhìn khuôn mặt và vẻ đẹp toàn diện cho khách hàng.",
        "Đội ngũ chuyên viên, kĩ thuật viên đảm nhiệm một chuyên môn riêng, tạo nên sự chuẩn xác tối đa.",
        "Sự hài lòng, mong muốn thay đổi chất lượng cuộc sống là sứ mệnh thiêng liên Kay Spa luôn theo đuổi."
    ]
    
    private let images: [UIImage] = [
        #imageLiteral(resourceName: "w1"), #imageLiteral(resourceName: "w2"), #imageLiteral(resourceName: "w3"), #imageLiteral(resourceName: "w4")
    ]
    
    // MARK: - Method
    // MARK: Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    // MARK: SetupUI
    private func setupUI() {
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        // Create a pager view
        pagerView = FSPagerView(frame: CGRect(x: 0, y: 0, width: kScreenSize.width, height: kScreenSize.height))
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        
        // Setup property
        pagerView.transformer = FSPagerViewTransformer(type: .cubic)
        self.view.addSubview(pagerView)
        
        // Create a page control
        pageControl.numberOfPages = images.count
        pageControl.setFillColor(.gray, for: .normal)
        pageControl.setFillColor(.white, for: .selected)

        view.sendSubview(toBack: pagerView)
    }
    
    // MARK: SetupData
    private func setupData() {
        
    }
    
    // MARK: Method
    private func moveToHome() {
        AppDelegate.shared?.setupTabBar()
    }
    
    // MARK: - Action
    @IBAction func touchUpInsideSkip(_ sender: Any) {
        moveToHome()
    }
    
    @IBAction func touchUpInsideNext(_ sender: Any) {
        if pagerView.currentIndex == images.count - 1 {
            moveToHome()
        } else {
            pagerView.scrollToItem(at: pagerView.currentIndex + 1, animated: true)
        }
    }
}

// MARK: - FSPagerViewDataSource
extension IntroduceViewController: FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return images.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        if index < images.count {
            cell.imageView?.image = images[index]
        }
        if index < mainTitleString.count {
            mainTitle.text = mainTitleString[index]
        }
        if index < subTitleString.count {
            subTitle.text = subTitleString[index]
        }
        return cell
    }
}

// MARK: - FSPagerViewDelegate
extension IntroduceViewController: FSPagerViewDelegate {
    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
        pageControl.currentPage = index
    }
}
