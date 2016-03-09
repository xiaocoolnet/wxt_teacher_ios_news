//
//  DaiJieTableViewCell.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/9.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class DaiJieTableViewCell: UITableViewCell {

    let nameLabel = UILabel()
    let btn = UIButton()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        self.nameLabel.frame = CGRectMake(10, 20, 31, 15)
        self.nameLabel.font = UIFont.systemFontOfSize(15)
        self.nameLabel.textColor = UIColor.blackColor()
        self.btn.frame = CGRectMake(0, 8, 70, 30)
        self.btn.layer.cornerRadius = 5
        self.btn.layer.masksToBounds = true
        self.btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.btn.titleLabel?.font = UIFont.systemFontOfSize(15)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(btn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
