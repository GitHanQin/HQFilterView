//
//  TitleButton.swift
//  FrisitSwift
//
//  Created by 韩琴 on 2017/12/16.
//  Copyright © 2017年 韩琴. All rights reserved.
//

import UIKit
class TitleButton: UIButton {
    // 通过纯代码创建时调用
    // 在Swift中如果重写父类的方法, 必须在方法前面加上override
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    // 通过XIB/SB创建时调用
    required init?(coder aDecoder: NSCoder) {
        // 系统对initWithCoder的默认实现是报一个致命错误
        //        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        setupUI()
    }
    private func setupUI(){
        setImage(UIImage.init(named: "home_withe_arrow"), for: .normal)
        setTitleColor(UIColor.white, for: .normal)
    }
    
    override func setTitle(_ title: String?, for state: UIControlState) {
        // ?? 用于判断前面的参数是否是nil, 如果是nil就返回??后面的数据, 如果不是nil那么??后面的语句不执行
        super.setTitle((title ?? "")+"  ", for: state)
        titleLabel?.sizeToFit()
        titleLabel?.textAlignment = .center
//        HQLog(message: self.titleLabel?.text)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        sizeToFit()
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = titleLabel!.frame.width
    }
}
