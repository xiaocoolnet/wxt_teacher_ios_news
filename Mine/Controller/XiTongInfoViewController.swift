//
//  XiTongInfoViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/4/1.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class XiTongInfoViewController: UIViewController {

    let contentLabel = UILabel()
    var content:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "公告详情"
        content = "公告详情公告详情公告详情公告详情公告详情公告详情公告详情公告详情公告详情公告详情公告详情公告详情公告详情公告详情公告详情公告详情公告详情公告详情公告详情公告详情公告详情公告详情"
        let options : NSStringDrawingOptions = NSStringDrawingOptions.UsesLineFragmentOrigin
        let string:NSString = content!
        let screenBounds:CGRect = UIScreen.mainScreen().bounds
        let boundingRect = string.boundingRectWithSize(CGSizeMake(screenBounds.width - 10, 0), options: options, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(17)], context: nil)
        self.view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        self.contentLabel.frame = CGRectMake(5, 5, self.view.bounds.width - 10, boundingRect.height)
        self.contentLabel.backgroundColor = UIColor.whiteColor()
        self.contentLabel.textColor = UIColor.grayColor()
        self.contentLabel.font = UIFont.systemFontOfSize(16)
        self.contentLabel.text = content!
        self.contentLabel.numberOfLines = 0
        self.view.addSubview(self.contentLabel)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
