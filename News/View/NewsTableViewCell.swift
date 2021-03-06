//
//  NewsTableViewCell.swift
//  WXT_Teachers
//
//  Created by 李春波 on 16/2/23.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    let MY_FONT = "Bauhaus ITC"
    var contextLabel = UILabel()
    var avatorImage = UIImageView()
    var nameLabel = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        self.avatorImage.frame = CGRectMake(13, 11, 45, 45)
        self.avatorImage.layer.cornerRadius = 22.5
        self.avatorImage.layer.masksToBounds = true
        self.nameLabel.frame = CGRectMake(72, 17, 100, 20)
        self.nameLabel.font = UIFont.systemFontOfSize(15)
        self.nameLabel.textColor = UIColor.blackColor()
        self.contextLabel.frame = CGRectMake(0, 0, 250, 30)
        self.contextLabel.font = UIFont.systemFontOfSize(12)
        self.contextLabel.center.x = self.contentView.center.x + 38
        self.contextLabel.center.y = self.contentView.center.y + 25
        self.contextLabel.textColor = UIColor.grayColor()
        self.contentView.addSubview(self.avatorImage)
        self.contentView.addSubview(self.contextLabel)
        self.contentView.addSubview(self.nameLabel)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
