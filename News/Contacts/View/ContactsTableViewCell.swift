//
//  ContactsTableViewCell.swift
//  WXT_Teachers
//
//  Created by 李春波 on 16/2/23.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    let MY_FONT = "Bauhaus ITC"
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
        
        self.nameLabel.frame = CGRectMake(70, 8, 100, 20)
        self.nameLabel.font = UIFont(name: MY_FONT, size: 15)
        self.nameLabel.textColor = UIColor.blackColor()
        
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
