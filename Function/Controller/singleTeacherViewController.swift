//
//  singleTeacherViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/24.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class singleTeacherViewController: UIViewController {

    let teacherImage = UIImageView()
    let contentLabel = UILabel()
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
        super.viewDidLoad()
        let options : NSStringDrawingOptions = NSStringDrawingOptions.UsesLineFragmentOrigin
        let string:NSString = "壮苗幼儿园始建于2000年,原校址位于东大道,13年7月正式迁至西大街,新学校占地1300平方米、建筑面积800平方米。"
        let screenBounds:CGRect = UIScreen.mainScreen().bounds
        let boundingRect = string.boundingRectWithSize(CGSizeMake(screenBounds.width - 10, 0), options: options, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(17)], context: nil)
        self.teacherImage.frame = CGRectMake(5, 5, self.view.bounds.width - 10, 200)
        self.contentLabel.frame = CGRectMake(5, 205, self.view.bounds.width - 10, boundingRect.height)
        self.contentLabel.font = UIFont.systemFontOfSize(17)
        self.contentLabel.numberOfLines = 0
        self.contentLabel.text = string as String
        self.teacherImage.image = UIImage(named: "教师风采-1")
        self.view.addSubview(self.teacherImage)
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
