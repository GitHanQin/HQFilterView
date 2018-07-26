//
//  HQFilterModle.swift
//  HQFilterView
//
//  Created by 韩琴 on 2018/7/26.
//  Copyright © 2018年 韩琴. All rights reserved.
//

import Foundation

public struct HQFilterDetialModle {
    var title:String = ""
    var image:String = ""
    var selectorImage:String = ""
    var cacheImage:String = ""
    var isSelector:Bool = false
    init() {
        title = ""
        image = ""
        selectorImage = ""
        cacheImage = ""
        isSelector = false
    }
    init(title:String,image:String,selectorImage:String,cacheImage:String,isSelector:Bool) {
        self.title = title
        self.image = image
        self.selectorImage = selectorImage
        self.cacheImage = cacheImage
        self.isSelector = isSelector
    }
}
public struct HQFilterModle {
    var items:[HQFilterDetialModle] = [HQFilterDetialModle].init()
    init() {
        items = [HQFilterDetialModle].init()
    }
}
