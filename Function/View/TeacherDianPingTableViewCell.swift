//
//  TeacherDianPingTableViewCell.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/12.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class TeacherDianPingTableViewCell: UITableViewCell {

    let avatorImage = UIImageView()
    let nameLabel = UILabel()
    let timeLabel = UILabel()
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
        self.avatorImage.frame = CGRectMake(10, 5, 40, 40)
        self.avatorImage.layer.cornerRadius = 20
        self.avatorImage.layer.masksToBounds = true
        self.nameLabel.frame = CGRectMake(60, 5, 70, 16)
        self.nameLabel.font = UIFont.systemFontOfSize(16)
        self.nameLabel.textAlignment = .Center
        self.timeLabel.frame = CGRectMake(60, 31, 65, 14)
        self.timeLabel.textColor = UIColor.grayColor()
        self.timeLabel.font = UIFont.systemFontOfSize(14)
        self.contentLabel.frame = CGRectMake(11, 54, 0, 0)
        self.contentLabel.font = UIFont.systemFontOfSize(15)
        self.contentLabel.numberOfLines = 0
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.timeLabel)
        self.contentView.addSubview(self.avatorImage)
        self.contentView.addSubview(self.contentLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
