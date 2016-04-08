//
//  EditPhoneViewController.swift
//  WXT_Teacher
//
//  Created by xiaocool on 16/4/8.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
class EditPhoneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //加载数据
        loadData()
        //加载视图
        loadSubviews()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = true
    }
    
    //MARK：- 加载数据
    func loadData(){
        
    }
    //MARK：- 加载视图
    func loadSubviews() {
        self.view.backgroundColor = UIColor(red: 236.0 / 255.0, green: 236.0 / 255.0, blue: 236.0 / 255.0, alpha: 1.0)
        
        //添加保存按钮
        let save = UIBarButtonItem(title: "确定", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("save"))
        self.navigationItem.rightBarButtonItem = save
        
        
        //添加白条
        let mobileView = UIView()
        mobileView.frame = CGRectMake(0, 8, UIScreen.mainScreen().bounds.width, 46)
        mobileView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(mobileView)
        
        let codeView = UIView()
        codeView.frame = CGRectMake(0, mobileView.frame.maxY+8, UIScreen.mainScreen().bounds.width, 46)
        codeView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(codeView)
        
        //添加label
        let mobLab = UILabel()
        mobLab.frame = CGRectMake(12, 8, 66, 30)
        mobLab.textColor = UIColor(red: 155.0/255, green: 229.0/255, blue: 180.0/255, alpha: 1)
        mobLab.text = "中国+86"
        mobileView.addSubview(mobLab)
        
        let codeLab = UILabel()
        codeLab.frame = CGRectMake(12, 8, 66, 30)
        codeLab.textColor = UIColor(red: 155.0/255, green: 229.0/255, blue: 180.0/255, alpha: 1)
        codeLab.text = "验证码"
        codeView.addSubview(codeLab)
        
        
        
        //添加输入框
        let textField = UITextField()
        textField.borderStyle = UITextBorderStyle.RoundedRect
        textField.placeholder = "请输入电话号"
        textField.frame = CGRectMake(mobLab.frame.maxX+15, 0, mobileView.frame.width-mobLab.frame.maxX+15, mobileView.frame.height )
        textField.tag = 101
        mobileView.addSubview(textField)
        
    
        let yanzhengField = UITextField()
        yanzhengField.borderStyle = UITextBorderStyle.RoundedRect
        yanzhengField.placeholder = "请输入验证码"
        yanzhengField.frame = CGRectMake(codeLab.frame.maxX+15, 0, 119, codeView.frame.height)
        yanzhengField.tag = 102
        codeView.addSubview(yanzhengField)
        
        //添加获取验证码按钮
        let send = UIButton()
        send.frame = CGRectMake(codeView.frame.width-8-76, 8, 76, 30)
        send.setTitleColor(UIColor(red: 155.0/255, green: 229.0/255, blue: 180.0/255, alpha: 1), forState: UIControlState.Normal)
        send.setTitle("获取验证码", forState: UIControlState.Normal)
        send.titleLabel?.font = UIFont.boldSystemFontOfSize(12)
        send.addTarget(self, action: Selector("send"), forControlEvents: UIControlEvents.TouchUpInside)
        codeView.addSubview(send)
    
    
    }

    
    //MARK: - action
    //发送验证码
    func send() -> Void {
        
        
    }
    
    //确定
    func save() -> Void {
        let mobileField = self.view.viewWithTag(101) as! UITextField
        let codeField = self.view.viewWithTag(102) as! UITextField
        
        
        let  url = "http://www.xiaocool.cn:8016/index.php?g=apps&m=teacher&a=updatemobile"
        //        teacherid,mobile,code
        let para = [
            "teacherid":30,
            "mobile":mobileField.text!,
            "code":codeField.text!
        ]
        Alamofire.request(.POST, url, parameters: para as! [String : AnyObject]).response { request, response, json, error in
            if(error != nil){
            }
            else{
                print("request是")
                print(request!)
                print("====================")
                let status = MineModel(JSONDecoder(json!))
                print("状态是")
                print(status.status)
                if(status.status == "error"){
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text;
                    hud.labelText = status.errorData
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                }
                if(status.status == "success"){
                    print("Success")
                    self.navigationController?.popToRootViewControllerAnimated(true)
                }
            }
        }


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
