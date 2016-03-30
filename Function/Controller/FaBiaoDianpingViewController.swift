//
//  FaBiaoDianpingViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/30.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import MBProgressHUD

class FaBiaoDianpingViewController: UIViewController {

    let contentTextView = BRPlaceholderTextView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "点评"
        self.view.backgroundColor = UIColor.whiteColor()
        let rightItem = UIBarButtonItem(title: "发表", style: .Done, target: self, action: #selector(TiXingJiaZhangViewController.FaSong))
        self.navigationItem.rightBarButtonItem = rightItem
        self.contentTextView.frame = CGRectMake(8, 5, self.view.bounds.width - 16, 200)
        self.contentTextView.font = UIFont.systemFontOfSize(15)
        self.contentTextView.placeholder = "请输入点评内容～不能超过200字啦"
        self.contentTextView.addMaxTextLengthWithMaxLength(200) { (contentTextView) -> Void in
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "超过200字啦"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 3)
        }
        self.view.addSubview(self.contentTextView)
        
        // Do any additional setup after loading the view.
    }
    
    func FaSong(){
        print("发送消息")
        self.navigationController?.popViewControllerAnimated(true)
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
