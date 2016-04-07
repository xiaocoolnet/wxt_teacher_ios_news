//
//  WhichSex.swift
//  WXT_Teacher
//
//  Created by xiaocool on 16/4/7.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class WhichSex: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame: CGRect) {
        super.init(frame: frame)
        //加载子视图
        loadSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 加载子视图
    
    func loadSubviews() -> Void {
        let  sexPicker = UIPickerView()
        sexPicker.frame = CGRectMake(0, 0, self.bounds.width, 300)
        sexPicker.showsSelectionIndicator = true
        self.addSubview(sexPicker)
    }
    
}
