
//
//  EditOtherViewController.swift
//  WXT_Teacher
//
//  Created by xiaocool on 16/4/5.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class EditOtherViewController: UIViewController {

    var index:Int?
    var temp:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //加载数据
        loadData()
        //加载视图
        loadSubviews()
    }

    //MARK：- 加载数据
    func loadData(){
    
    }
    //MARK：- 加载视图
    func loadSubviews() {
        self.view.backgroundColor = UIColor.whiteColor()
        
        //添加保存按钮
        let save = UIBarButtonItem(title: "保存", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("save"))
        self.navigationItem.rightBarButtonItem = save
        
        
        //添加输入框
        let textField = UITextField()
        textField.borderStyle = UITextBorderStyle.RoundedRect
        textField.text = temp
        textField.frame = CGRectMake(20, 20, UIScreen.mainScreen().bounds.width-20*2, 50)
        textField.tag = 101
        self.view.addSubview(textField)
        
        //添加视觉条
        let see = UIView()
        see.frame = CGRectMake(20, textField.frame.maxY, textField.frame.width, 2)
        see.backgroundColor = UIColor.greenColor()
        self.view.addSubview(see)
        
    }
    
    //MARK: - 保存事件
    func save() -> Void {
        let textField = self.view.viewWithTag(101) as! UITextField
        self.temp = textField.text
        print(self.navigationController?.viewControllers)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    //传值
    override func viewWillDisappear(animated: Bool) {
        let editVC = self.navigationController?.viewControllers[1] as! EditTableViewController
        if ((temp?.isEmpty) != nil) {
            
            if index==1 {
                editVC.name = temp!
            }
            if index==3 {
                editVC.phoneNumber = temp!
            }
            if index==4 {
                editVC.school = temp!
            }
            if index==5 {
                editVC.classRoom = temp!
            }
        }
        editVC.tableView.reloadData()
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
