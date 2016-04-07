//
//  ChangePassViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/8.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import MBProgressHUD

class ChangePassViewController: UIViewController {

    let passView = UIView()
    let passText = UITextField()
    let nextBtn = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "修改密码"
        self.view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        passView.frame = CGRectMake(0, 10, self.view.bounds.width, 44)
        passView.backgroundColor = UIColor.whiteColor()
        passText.frame = CGRectMake(10, 20, self.view.bounds.width - 10, 30)
        passText.borderStyle = .None
        passText.secureTextEntry = true
        passText.placeholder = "请输入修改前密码"
        nextBtn.frame = CGRectMake(10, 86, self.view.bounds.width - 20, 40)
        nextBtn.layer.cornerRadius = 5
        nextBtn.layer.masksToBounds = true
        nextBtn.backgroundColor = UIColor(red: 54.0 / 255.0, green: 190.0 / 255.0, blue: 100.0 / 255.0, alpha: 1.0)
        nextBtn.setTitle("设置新密码", forState: .Normal)
        nextBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        nextBtn.titleLabel?.font = UIFont.systemFontOfSize(17)
        nextBtn.addTarget(self, action: #selector(ChangePassViewController.setPassView), forControlEvents: .TouchUpInside)
        self.view.addSubview(passView)
        self.view.addSubview(passText)
        self.view.addSubview(nextBtn)
    }
    
    func PandKong()->Bool{
        if(passText.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入密码"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return false
        }
        return true
    }

    
    func setPassView(){
        if PandKong(){
            let setpass = SetPassViewController()
            self.navigationController?.pushViewController(setpass, animated: true)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
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
