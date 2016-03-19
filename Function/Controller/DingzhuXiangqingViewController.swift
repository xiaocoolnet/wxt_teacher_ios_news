//
//  DingzhuXiangqingViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/19.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class DingzhuXiangqingViewController: UIViewController {

    let xiangqingView = UIView()
    let contentLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "叮嘱详情"
        self.view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        xiangqingView.frame = CGRectMake(0, 0, self.view.bounds.width, 400)
        xiangqingView.backgroundColor = UIColor.whiteColor()
        contentLabel.frame = CGRectMake(10, 5, self.view.bounds.width, 15)
        contentLabel.font = UIFont.systemFontOfSize(16)
        contentLabel.text = "回复详情"
        self.view.addSubview(xiangqingView)
        self.view.addSubview(contentLabel)
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
