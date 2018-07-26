//
//  HQFilterView.swift
//  HQFilterView
//
//  Created by 韩琴 on 2018/3/20.
//  Copyright © 2018年 韩琴. All rights reserved.
//

import UIKit
import SnapKit

public protocol HQFilterDelegate {
    func didSelectorMyChooseButton()
}

public var marginSpace = 20
public class HQFilterView: UIView {
   public var delegate:HQFilterDelegate?
   public var modle:HQFilterModle = HQFilterModle.init(){
        didSet {
            toolsView.delegate = self
            toolsView.dataSource = self
            itemWidth = NSMutableArray.init() as! [CGSize]
            var allWidth:CGFloat = 0.0
            for item in modle.items {
                let size = self.sizeWithText(text: item.title as NSString, font: UIFont.systemFont(ofSize: 14), size: CGSize.init(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)))
                itemWidth.append(CGSize.init(width: size.width+20, height: heightOfToolsView))
                allWidth = allWidth+size.width+20
                
            }
            if allWidth>toolsView.frame.size.width {
                for i in 0..<itemWidth.count {
                    itemWidth[i].width = itemWidth[i].width+CGFloat(marginSpace)
                }
            } else {
                let margin  = (UIScreen.main.bounds.width-allWidth)/CGFloat(modle.items.count)
                for i in 0..<itemWidth.count {
                    itemWidth[i].width = itemWidth[i].width+CGFloat(margin)
                }
                
            }
            toolsView.reloadData()
        }
    }
    private var itemWidth:[CGSize]=[]
   public var themColor:UIColor = UIColor.blue {
        didSet {
            toolsView.reloadData()
        }
    }
   public var  titleColor:UIColor = UIColor.darkText {
        didSet {
            toolsView.reloadData()
        }
    }
    private lazy var toolsView:UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: self.frame.size.width, height:heightOfToolsView ), collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
   public var heightOfToolsView:CGFloat = 44
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        registerNib()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension HQFilterView:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modle.items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterToolsItemCellID", for: indexPath) as! FilterToolsItemCell
        cell.filterButton.setTitle(self.modle.items[indexPath.row].title , for: .normal)
        cell.filterButton.setImage(UIImage.init(named: self.modle.items[indexPath.row].image), for: .normal)
        cell.filterButton.setImage(UIImage.init(named: self.modle.items[indexPath.row].selectorImage), for: .selected)
        cell.filterButton.tag = indexPath.row
        cell.filterButton.addTarget(self, action: #selector(didClickMytitleButton(sender:)), for: .touchUpInside)
        cell.filterButton.setTitleColor(titleColor, for: .normal)
        cell.filterButton.setTitleColor(themColor, for: .selected)
        cell.filterButton.isSelected = self.modle.items[indexPath.row].isSelector
        return cell
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemWidth[indexPath.row]
    }
}
extension HQFilterView {
    @objc private func didClickMytitleButton(sender:TitleButton) {
        for i in 0..<modle.items.count {
            if i == sender.tag {
                if sender.isSelected {
                    //选中状况点击按钮
                    let tempImagename = modle.items[i].selectorImage
                    modle.items[i].selectorImage = modle.items[i].cacheImage
                    modle.items[i].cacheImage = tempImagename
                    
                } else {
                    modle.items[i].isSelector = true
                }
            } else {
                modle.items[i].isSelector = false
            }
        }
        toolsView.reloadData()
        delegate?.didSelectorMyChooseButton()
    }
    private func setUpUI() {
        addSubview(toolsView)
        toolsView.backgroundColor = UIColor.white
    }
    private func registerNib() {
        toolsView.register(FilterToolsItemCell.self, forCellWithReuseIdentifier: "FilterToolsItemCellID")
    }
    func sizeWithText(text: NSString, font: UIFont, size: CGSize) -> CGRect {
        let attributes = [NSAttributedStringKey.font: font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect:CGRect = text.boundingRect(with: size, options: option, attributes: attributes, context: nil)
        return rect;
    }
}


//cell
class FilterToolsItemCell: UICollectionViewCell {
    var filterButton:TitleButton = {
      let button = TitleButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension FilterToolsItemCell {
    private func setUpUI() {
        contentView.addSubview(filterButton)
        filterButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(contentView.snp.centerX)
            make.centerY.equalTo(contentView.snp.centerY)
        }
    }

}
