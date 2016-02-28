//
//  ScrollViewController.swift
//  WXT_Teachers
//
//  Created by 李春波 on 16/2/24.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {

    var btn = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.frame = CGRectMake(0, 0, 10, 23)
        btn.setTitle("te", forState: UIControlState.Normal)
        btn.backgroundColor = UIColor.redColor()
        self.view.addSubview(btn)
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
