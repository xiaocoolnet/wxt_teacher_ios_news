//
//  YuanquJieShaoViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/24.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class YuanquJieShaoViewController: UIViewController {

    let schoolImage = UIImageView()
    let content1Label = UILabel()
    let content2Label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let options : NSStringDrawingOptions = NSStringDrawingOptions.UsesLineFragmentOrigin
        let string:NSString = "壮苗幼儿园始建于2000年,原校址位于东大道,13年7月正式迁至西大街,新学校占地1300平方米、建筑面积800平方米。"
        let screenBounds:CGRect = UIScreen.mainScreen().bounds
        let boundingRect = string.boundingRectWithSize(CGSizeMake(screenBounds.width - 150, 0), options: options, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(17)], context: nil)
        self.title = "园区介绍"
        self.view.backgroundColor = UIColor.whiteColor()
        self.schoolImage.frame = CGRectMake(0, 5, 140, 100)
        self.schoolImage.frame.origin.x = self.view.bounds.width - 145
        self.schoolImage.image = UIImage(named: "Schoolimage")
        self.content1Label.frame = CGRectMake(5, 5, self.view.bounds.width - 150, boundingRect.height)
        self.content1Label.numberOfLines = 0
        self.content1Label.font = UIFont.systemFontOfSize(17)
        self.content1Label.text = string as String!
        let boundingRect2 = string.boundingRectWithSize(CGSizeMake(screenBounds.width - 10, 0), options: options, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(17)], context: nil)
        self.content2Label.frame = CGRectMake(5, 146, self.view.bounds.width - 10, boundingRect2.height)
        self.content2Label.numberOfLines = 0
        self.content2Label.font = UIFont.systemFontOfSize(17)
        self.content2Label.text = string as String!
        self.view.addSubview(self.content2Label)
        self.view.addSubview(self.content1Label)
        self.view.addSubview(self.schoolImage)
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
