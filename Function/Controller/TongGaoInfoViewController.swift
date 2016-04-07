//
//  TongGaoInfoViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/29.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit


class TongGaoInfoViewController: UIViewController {

    let noticeTitle = UILabel()
    let nameLabel = UILabel()
    let timeLabel = UILabel()
    let contentLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "公告详情"
        self.view.backgroundColor = UIColor.whiteColor()
        
        noticeTitle.frame = CGRectMake(30, 10, self.view.bounds.width-60, 30)
        noticeTitle.textAlignment = .Center
        noticeTitle.font = UIFont.boldSystemFontOfSize(25)
        
        nameLabel.frame = CGRectMake(15, 45, 150, 15)
        nameLabel.textColor = UIColor.grayColor()
        nameLabel.font = UIFont.boldSystemFontOfSize(15)
        
        timeLabel.frame = CGRectMake(self.view.bounds.width-165, 45, 150, 15)
        timeLabel.textColor = UIColor.grayColor()
        timeLabel.textAlignment = .Right
        timeLabel.font = UIFont.boldSystemFontOfSize(15)
        
        contentLabel.frame = CGRectMake(15, 65, self.view.bounds.width-30, 300)
        contentLabel.numberOfLines = 0
        contentLabel.textAlignment = .Center
        contentLabel.font = UIFont.boldSystemFontOfSize(17)
        
        self.view.addSubview(noticeTitle)
        self.view.addSubview(nameLabel)
        self.view.addSubview(timeLabel)
        self.view.addSubview(contentLabel)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
