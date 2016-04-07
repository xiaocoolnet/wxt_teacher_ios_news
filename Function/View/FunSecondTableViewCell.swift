//
//  FunSecondTableViewCell.swift
//  WXT_Teachers
//
//  Created by 李春波 on 16/2/24.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class FunSecondTableViewCell: UITableViewCell {

    var paiMingImage = UIImageView()
    var jiFenImage = UIImageView()
    var dengJiImage = UIImageView()
    var paiMing = UILabel()
    var jiFen = UILabel()
    var dengJi = UILabel()
    var paiMingLabel = UILabel()
    var jiFenLabel = UILabel()
    var dengJiLabel = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        self.paiMingImage.frame = CGRectMake(19, 12, 40, 40)
        self.paiMingImage.layer.cornerRadius = 20
        self.paiMingImage.layer.masksToBounds = true
        self.paiMingImage.image = UIImage(named: "排名")
        self.paiMing.frame = CGRectMake(60, 29, 30, 11)
        self.paiMing.font = UIFont.systemFontOfSize(13)
        self.paiMing.text = "排名"
        self.paiMingLabel.frame = CGRectMake(94, 27, 25, 13)
        self.paiMingLabel.font = UIFont.systemFontOfSize(18)
        self.paiMingLabel.textColor = UIColor(red: 203.0 / 255.0, green: 225.0 / 255.0, blue: 139.0 / 255.0, alpha: 1.0)
        self.jiFenImage.frame = CGRectMake(0, 0, 40, 40)
        self.contentView.addSubview(paiMingLabel)
        self.contentView.addSubview(paiMing)
        self.contentView.addSubview(paiMingImage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
