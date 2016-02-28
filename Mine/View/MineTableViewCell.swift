//
//  MineTableViewCell.swift
//  WXT_Teachers
//
//  Created by 李春波 on 16/2/25.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class MineTableViewCell: UITableViewCell {

    let iconImage = UIImageView()
    let contentLabel = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        iconImage.frame = CGRectMake(13, 13, 26, 26)
        iconImage.layer.cornerRadius = 13
        iconImage.layer.masksToBounds = true
        contentLabel.frame = CGRectMake(52, 19, 80, 14)
        contentLabel.font = UIFont.systemFontOfSize(14)
        self.contentView.addSubview(contentLabel)
        self.contentView.addSubview(iconImage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
