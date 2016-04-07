//
//  FunTableViewCell.swift
//  WXT_Teachers
//
//  Created by 李春波 on 16/2/23.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class FunTableViewCell: UITableViewCell {

    let MY_FONT = "Bauhaus ITC"
    var avatorImage = UIImageView()
    var nameLabel = UILabel()
    var schoolLabel = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        self.avatorImage.frame = CGRectMake(15, 60, 80, 80)
        self.avatorImage.layer.cornerRadius = 40
        self.avatorImage.layer.masksToBounds = true
        self.nameLabel.frame = CGRectMake(100, 85, 100, 20)
        self.nameLabel.font = UIFont.systemFontOfSize(16)
        self.nameLabel.textColor = UIColor(red: 54.0 / 255.0, green: 190.0 / 255.0, blue: 100.0 / 255.0, alpha: 1.0)
        self.schoolLabel.frame = CGRectMake(100, 100, 200, 15)
        self.schoolLabel.font = UIFont.systemFontOfSize(11)
        self.schoolLabel.textColor = UIColor.grayColor()
        self.contentView.addSubview(self.avatorImage)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.schoolLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
