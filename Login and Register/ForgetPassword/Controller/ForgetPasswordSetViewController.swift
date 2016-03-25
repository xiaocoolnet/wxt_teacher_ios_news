//
//  ForgetPasswordSetViewController.swift
//  WXT_Teachers
//
//  Created by Mac on 16/2/18.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class ForgetPasswordSetViewController: UIViewController {
    @IBOutlet weak var setPassword: UITextField!
    @IBOutlet weak var againsetPassword: UITextField!
    @IBOutlet weak var finishbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finishbutton.addTarget(self, action: #selector(ForgetPasswordSetViewController.PanKong), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func Finish(){
        if PanKong() == true{
            UpdatePassword()
        }
    }
    
    func UpdatePassword(){
        
        let userid = NSUserDefaults.standardUserDefaults()
        let uid = userid.stringForKey("userid")
    
        let url = apiUrl+"forgetPass_Activate"
        let params = [
            "userid":uid!,
            "pass":setPassword.text!
        ]
        Alamofire.request(.GET, url, parameters: params).response { request, response, json, error in
            if(error != nil){
            }
            else{
                print("request是")
                print(request!)
                print("====================")
                let status = Httpresult(JSONDecoder(json!))
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
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text;
                    hud.labelText = "修改成功"
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                    self.navigationController?.popToRootViewControllerAnimated(true)
                }
            }
        }
    }

    func PanKong()->Bool{
        if(setPassword.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入密码"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return false
        }
        if(againsetPassword.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请再次输入密码"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return false
        }
        if(setPassword.text! != againsetPassword.text!){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "两次密码不正确"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return false
        }
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

}
