//
//  DingzhuXiangqingViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/19.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class DingzhuXiangqingViewController: UIViewController {

    let xiangqingView = UIView()
    let contentLabel = UILabel()
    let dataTextView = BRPlaceholderTextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "叮嘱详情"
        
        let rightItem = UIBarButtonItem(title: "发送", style: .Done, target: self,action: #selector(DingzhuXiangqingViewController.rightBtn))
        self.navigationItem.rightBarButtonItem = rightItem
        
        
        self.view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        xiangqingView.frame = CGRectMake(0, 0, self.view.bounds.width, 400)
        xiangqingView.backgroundColor = UIColor.whiteColor()
        contentLabel.frame = CGRectMake(10, 10, 100, 15)
        contentLabel.font = UIFont.systemFontOfSize(17)
        contentLabel.text = "叮嘱详情："
        self.view.addSubview(xiangqingView)
        self.view.addSubview(contentLabel)
        
        self.dataTextView.frame = CGRectMake(15, 30, self.view.bounds.width - 30, 250)
        self.dataTextView.font = UIFont.systemFontOfSize(15)
        self.dataTextView.placeholder = "请输入原因～不能超过200字啦"
        self.dataTextView.addMaxTextLengthWithMaxLength(200) { (contentTextView) -> Void in
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "超过200字啦"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 3)
        }
        xiangqingView.addSubview(dataTextView)
        
        // Do any additional setup after loading the view.
    }

    func rightBtn() {
        print("发送")
        
        let url = apiUrl+"PatriarchEnjoin"
        let param = [
            "userid":599,
            "teacherid":1,
            "content":dataTextView.text
        ]
        Alamofire.request(.POST, url, parameters: param as? [String : AnyObject]).response { request, response, json, error in
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
