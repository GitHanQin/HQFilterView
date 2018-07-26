//
//  HQFilterModle.swift
//  HQFilterView
//
//  Created by 韩琴 on 2018/7/26.
//  Copyright © 2018年 韩琴. All rights reserved.
//

import Foundation

public struct HQFilterDetialModle {
    public var title:String = ""
    public var image:String = ""
    public var selectorImage:String = ""
    public var cacheImage:String = ""
    public var isSelector:Bool = false
    public init() {
        title = ""
        image = ""
        selectorImage = ""
        cacheImage = ""
        isSelector = false
    }
    public init(title:String,image:String,selectorImage:String,cacheImage:String,isSelector:Bool) {
        self.title = title
        self.image = image
        self.selectorImage = selectorImage
        self.cacheImage = cacheImage
        self.isSelector = isSelector
    }
}
public struct HQFilterModle {
    public var items:[HQFilterDetialModle] = [HQFilterDetialModle].init()
    public init() {
        items = [HQFilterDetialModle].init()
    }
}
