//
//  LoginViewController.swift
//  WXT_Teachers
//
//  Created by Mac on 16/2/18.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var AccountText: UITextField!
    @IBOutlet weak var PasswordText: UITextField!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
      
        //        要执行点击return退出键盘这个功能的函数，就要写下面这个两个self
        AccountText.delegate = self
        PasswordText.delegate = self
        LoginButton.addTarget(self, action: "Login", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    //再次返回该页面的时候激活该方法
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden=true
    }
    
    //点击return收回键盘
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        //phoneNumberTextField.resignFirstResponder()
        //yanzhangma.resignFirstResponder()
        AccountText.resignFirstResponder()
        PasswordText.resignFirstResponder()
        return true
    }
    
    //点击空白处回收键盘
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    func Login(){
        
        //        判空
        if(AccountText.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入账号"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return
        }
        if(PasswordText.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入密码"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return
        }
        //接口
        /*
        let url = apiUrl+"applogin"
        let param = [
            "phone":self.AccountText.text!,
            "password":self.PasswordText.text!
        ]
        */
        
        //发送网络请求（验证用户名和密码），返回json数据，解析json数据之后向用户反馈登陆是否成功
        /*
        Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
            if(error != nil){
            }
            else{
                print("request是")
                print(request!)
                print("response是")
                print(response!)
                print("data是")
                print(json!)
                print("====================")
                //先声明一个常量，把解析出的Json数据赋值给该变量
                let status = Httpresult(JSONDecoder(json!))
                print("状态是")
                print(status.status)
                if(status.status == "error"){
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text;
                    
                    // 如果返回的登录状态为错误（errorData的值为错误类型）
                    hud.labelText = status.errorData
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                }
                
                if(status.status == "success"){
                    print("Success")
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text;
                    hud.labelText = "登录成功"
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
 
                    //        缓存刚刚输入的账号，下次点击不再输入帐号
                    //缓存帐号
                    let userid = NSUserDefaults.standardUserDefaults()
                    userid.setValue(status.data?.id, forKey: "userid")
                    //let uid = userid.valueForKey("userid")
                    //                        缓存学校ID
                    let schoolid = NSUserDefaults.standardUserDefaults()
                    schoolid.setValue(status.data?.id, forKey: "schoolid")
                    //                        缓存班级
                    let classid = NSUserDefaults.standardUserDefaults()
                    classid.setValue(status.data?.id, forKey: "classid")
 */
                    //点击"登陆按钮"（LoginBotton）跳转到指定页面，
                    
                    let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                    let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("MainView") 
                    self.presentViewController(vc, animated: true, completion: nil)
                    
                    
                }
    
                
            }
            
        //}
    //}
