//
//  YiJianFanKuiViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/18.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import MBProgressHUD

class YiJianFanKuiViewController: UIViewController {

    let contentView = UIView()
    let contentTextView = BRPlaceholderTextView()
    let putBtn = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        self.title = "意见反馈"
        contentView.frame = CGRectMake(0, 20, self.view.bounds.width, 151)
        contentView.backgroundColor = UIColor.whiteColor()
        contentTextView.frame = CGRectMake(8, 25, self.view.bounds.width - 16, 150)
        contentTextView.font = UIFont.systemFontOfSize(15)
        contentTextView.placeholder = "请输入内容～不能超过200字哦"
        contentTextView.addMaxTextLengthWithMaxLength(200) { (contentTextView) -> Void in
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "超过200字啦"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 3)
        }
        putBtn.frame = CGRectMake(0, 180, 70, 30)
        putBtn.frame.origin.x = self.view.bounds.width - 80
        putBtn.backgroundColor = UIColor(red: 54.0 / 255.0, green: 190.0 / 255.0, blue: 100.0 / 255.0, alpha: 1.0)
        putBtn.setTitle("提交", forState: .Normal)
        putBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        putBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        putBtn.addTarget(self, action: #selector(YiJianFanKuiViewController.Fanhui), forControlEvents: .TouchUpInside)
        putBtn.layer.cornerRadius = 5
        putBtn.layer.masksToBounds = true
        self.view.addSubview(contentView)
        self.view.addSubview(contentTextView)
        self.view.addSubview(putBtn)
        
        // Do any additional setup after loading the view.
    }

    func Fanhui(){
        self.navigationController?.popToRootViewControllerAnimated(true)
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
