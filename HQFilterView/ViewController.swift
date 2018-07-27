//
//  ViewController.swift
//  HQFilterView
//
//  Created by 韩琴 on 2018/3/20.
//  Copyright © 2018年 韩琴. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let filter = HQFilterView.init(frame: CGRect.init(x: 0, y: 44, width: UIScreen.main.bounds.width, height: 300))
        view.addSubview(filter)
        var modle = HQFilterModle.init()
        let itme1 = HQFilterDetialModle.init(title: "综合排序", image: "", selectorImage: "", cacheImage: "", isSelector: true)
        modle.items.append(itme1)
        
        let itme2 = HQFilterDetialModle.init(title: "销量优先", image: "", selectorImage: "", cacheImage: "", isSelector: false)
        modle.items.append(itme2)
        
        let itme3 = HQFilterDetialModle.init(title: "距离优先", image: "", selectorImage: "", cacheImage: "", isSelector: false)
        modle.items.append(itme3)
        
        let itme4 = HQFilterDetialModle.init(title: "价格", image: "duo", selectorImage: "jiang", cacheImage: "sheng", isSelector: false)
        modle.items.append(itme4)
        
        let itme5 = HQFilterDetialModle.init(title: "价格", image: "duo", selectorImage: "jiang", cacheImage: "sheng", isSelector: false)
        modle.items.append(itme5)
        
        let itme6 = HQFilterDetialModle.init(title: "价格", image: "duo", selectorImage: "jiang", cacheImage: "sheng", isSelector: false)
        modle.items.append(itme6)
        let itme7 = HQFilterDetialModle.init(title: "价格", image: "duo", selectorImage: "jiang", cacheImage: "sheng", isSelector: false)
        modle.items.append(itme7)
        
        
        
        
        filter.filterButtonFont = UIFont.systemFont(ofSize: 18)
        filter.modle = modle
        filter.themColor = UIColor.orange
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

