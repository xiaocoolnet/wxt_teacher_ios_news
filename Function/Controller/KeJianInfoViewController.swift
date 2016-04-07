//
//  KeJianInfoViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/31.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import MBProgressHUD

class KeJianInfoViewController: UIViewController {
    
    let contentTextView = BRPlaceholderTextView()
    let nameKejian = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "课件详情"
        self.view.backgroundColor = UIColor.whiteColor()
        let rightItem = UIBarButtonItem(title: "编辑", style: .Done, target: self, action: #selector(KeJianInfoViewController.EditKejian))
        self.navigationItem.rightBarButtonItem = rightItem
        
        self.nameKejian.frame = CGRectMake(8, 5, self.view.bounds.width - 16, 60)
        self.nameKejian.textAlignment = .Center
        self.nameKejian.font = UIFont.boldSystemFontOfSize(25)
        self.view.addSubview(nameKejian)
        
        self.contentTextView.frame = CGRectMake(8, 65, self.view.bounds.width - 16, 200)
        self.contentTextView.font = UIFont.systemFontOfSize(17)
        //        self.contentTextView.text = "课件详情课件详情课件详情课件详情课件详情课件详情课件详情课件详情课件详情课件详情课件详情课件详情课件详情课件详情课件详情"
        self.contentTextView.addMaxTextLengthWithMaxLength(200) { (contentTextView) -> Void in
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "超过200字啦"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 3)
        }
        
        self.contentTextView.editable = false
        self.view.addSubview(self.contentTextView)
    }
    
    func EditKejian(){
        self.contentTextView.editable = true
        let rightItem = UIBarButtonItem(title: "保存", style: .Done, target: self, action: #selector(KeJianInfoViewController.SaveKejian))
        self.navigationItem.rightBarButtonItem = rightItem
        
        print("保存")
    }
    
    func SaveKejian(){
        let rightItem = UIBarButtonItem(title: "编辑", style: .Done, target: self, action: #selector(KeJianInfoViewController.EditKejian))
        self.navigationItem.rightBarButtonItem = rightItem
        self.contentTextView.editable = false
        
        
        
        print("编辑")
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
