//
//  YuErInfoViewController.swift
//  WXT_Teacher
//
//  Created by xiaocool on 16/4/10.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class YuErInfoViewController: UIViewController {

    
    var yuErInfo = YuErInfo()
    let Image = UIImageView()
    let contentLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "育儿知识详情"
        // Do any additional setup after loading the view.
        let options : NSStringDrawingOptions = NSStringDrawingOptions.UsesLineFragmentOrigin
        let screenBounds:CGRect = UIScreen.mainScreen().bounds
        let string = self.yuErInfo.happy_content
        
        let boundingRect = string!.boundingRectWithSize(CGSizeMake(screenBounds.width - 10, 0), options: options, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(17)], context: nil)
        self.Image.frame = CGRectMake(5, 5, self.view.bounds.width - 10, 200)
        self.contentLabel.frame = CGRectMake(5, 205, self.view.bounds.width - 10, boundingRect.height)
        self.contentLabel.font = UIFont.systemFontOfSize(17)
        self.contentLabel.numberOfLines = 0
        self.contentLabel.text = string! as String
        self.Image.image = UIImage(named: "teacherPic")
        self.view.addSubview(self.Image)
        self.view.addSubview(self.contentLabel)
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
