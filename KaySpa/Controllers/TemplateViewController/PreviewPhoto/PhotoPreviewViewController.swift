//
//  IntroduceViewController.swift
//  Template
//
//  Created by Nguyen Quang Manh on 3/22/18.
//  Copyright © 2018 Vinmas. All rights reserved.
//

import UIKit
import FSPagerView
import  SwiftUtils

class PhotoPreviewViewController: BaseViewController {

    @IBOutlet weak var pageControl: FSPageControl!
    @IBOutlet weak var closeButton: UIButton!
    
    var backgroundImages: [UIImage] = []
    var titles: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupPageView()
    }
    
    private func setupData() {
        backgroundImages = [#imageLiteral(resourceName: "w1"), #imageLiteral(resourceName: "w2"), #imageLiteral(resourceName: "w3"), #imageLiteral(resourceName: "w4")]
        titles = ["Title 1", "Title 2", "Title 3", "Title 4"]
    }
    
    private func setupPageView() {
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        // Create a pager view
        let pagerView = FSPagerView(frame: CGRect(x: 0, y: 0, width: kScreenSize.width, height: kScreenSize.height))
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        
        // Setup property
        pagerView.transformer = FSPagerViewTransformer(type: .coverFlow)
        pagerView.automaticSlidingInterval = 8.0
        self.view.addSubview(pagerView)
        
        // Create a page control
        pageControl.numberOfPages = backgroundImages.count
        pageControl.setFillColor(.gray, for: .normal)
        pageControl.setFillColor(.white, for: .selected)
        
        view.bringSubview(toFront: pageControl)
        view.bringSubview(toFront: closeButton)
    }
    
    @IBAction func clickClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension PhotoPreviewViewController: FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return backgroundImages.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        if index < backgroundImages.count {
            cell.imageView?.image = backgroundImages[index]
        }
        if index < titles.count {
            cell.textLabel?.text = titles[index]
        }
        return cell
    }
}

extension PhotoPreviewViewController: FSPagerViewDelegate {
    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
        pageControl.currentPage = index
    }
}
