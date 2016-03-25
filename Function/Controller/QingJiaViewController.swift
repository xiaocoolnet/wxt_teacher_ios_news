//
//  QingJiaViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/10.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import MBProgressHUD
import IQKeyboardManagerSwift

class QingJiaViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var dataTableView = UITableView()
    let lastDayBtn = UIButton()
    let nextDayBtn = UIButton()
    let timeLabel = UILabel()
    let lastMonthBtn = UIButton()
    let nextMonthBtn = UIButton()
    let weekLabel = UILabel()
    let dataTextView = BRPlaceholderTextView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "在线请假"
        self.view.backgroundColor = UIColor.whiteColor()
        IQKeyboardManager.sharedManager().enable = true
        dataTableView = UITableView(frame:CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height) , style: UITableViewStyle.Grouped)
        self.automaticallyAdjustsScrollViewInsets = false
        dataTableView.delegate = self
        dataTableView.dataSource = self
        XKeyBoard.registerKeyBoardHide(self)
        XKeyBoard.registerKeyBoardShow(self)
        let rightItem = UIBarButtonItem(title: "发送", style: .Done, target: self, action: #selector(QingJiaViewController.PutMessage))
        self.navigationItem.rightBarButtonItem = rightItem
        self.tabBarController?.tabBar.hidden = true
        self.view.addSubview(self.dataTableView)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        if section == 1{
            return 4
        }
        return 1
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 40
        }
        if indexPath.section == 1{
            return 50
        }
        return 300
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        cell.selectionStyle = .None
        if indexPath.section == 0{
            lastDayBtn.frame = CGRectMake(50, 10, 20, 20)
            lastDayBtn.setImage(UIImage(named: "上一天"), forState: .Normal)
            lastDayBtn.addTarget(self, action: #selector(QingJiaViewController.LastDay), forControlEvents: .TouchUpInside)
            nextDayBtn.frame = CGRectMake(0, 10, 20, 20)
            nextDayBtn.frame.origin.x = self.view.bounds.width - 70
            nextDayBtn.setImage(UIImage(named: "下一天"), forState: .Normal)
            nextDayBtn.addTarget(self, action: #selector(QingJiaViewController.NextDay), forControlEvents: .TouchUpInside)
            lastMonthBtn.frame = CGRectMake(30, 10, 20, 20)
            lastMonthBtn.setImage(UIImage(named: "上个月"), forState: .Normal)
            lastMonthBtn.addTarget(self, action: #selector(QingJiaViewController.LastMonth), forControlEvents: .TouchUpInside)
            nextMonthBtn.frame = CGRectMake(0, 10, 20, 20)
            nextMonthBtn.setImage(UIImage(named: "下个月"), forState: .Normal)
            nextMonthBtn.frame.origin.x = self.view.bounds.width - 50
            nextMonthBtn.addTarget(self, action: #selector(QingJiaViewController.NextMonth), forControlEvents: .TouchUpInside)
            timeLabel.frame = CGRectMake(0, 10, 150, 20)
            timeLabel.textColor = UIColor.grayColor()
            timeLabel.center.x = self.view.center.x
            timeLabel.font = UIFont.systemFontOfSize(15)
            let today:NSDate = NSDate()
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd  EEEE"
            let allday = dateFormatter.stringFromDate(today)
            timeLabel.text = allday
            cell.contentView.addSubview(timeLabel)
            cell.contentView.addSubview(nextMonthBtn)
            cell.contentView.addSubview(lastMonthBtn)
            cell.contentView.addSubview(nextDayBtn)
            cell.contentView.addSubview(lastDayBtn)
            return cell
        }
        if indexPath.section == 1{
            cell.accessoryType = .None
            cell.textLabel?.text = "王院长"
            return cell
        }
        self.dataTextView.frame = CGRectMake(15, 10, self.view.bounds.width - 30, 250)
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
        cell.contentView.addSubview(dataTextView)
        return cell
    }
    
    func NextDay(){
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd  EEEE"
        let stringday = dateFormatter.dateFromString(self.timeLabel.text!)
        let theDayAfterTomorrow = stringday!.dateByAddingTimeInterval(24*60*60)
        let tomorrow = dateFormatter.stringFromDate(theDayAfterTomorrow)
        timeLabel.text = tomorrow
    }
    
    func LastDay(){
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd  EEEE"
        let stringday = dateFormatter.dateFromString(self.timeLabel.text!)
        let theYesterday = stringday!.dateByAddingTimeInterval(-24*60*60)
        let yesterday = dateFormatter.stringFromDate(theYesterday)
        timeLabel.text = yesterday
    }
    
    func LastMonth(){
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd  EEEE"
        let stringday = dateFormatter.dateFromString(self.timeLabel.text!)
        let theLastMonth = stringday!.dateByAddingTimeInterval(-24*60*60*30)
        let lastMonth = dateFormatter.stringFromDate(theLastMonth)
        timeLabel.text = lastMonth
    }
    
    func NextMonth(){
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd  EEEE"
        let stringday = dateFormatter.dateFromString(self.timeLabel.text!)
        let theNextMonth = stringday!.dateByAddingTimeInterval(24*60*60*30)
        let nextMonth = dateFormatter.stringFromDate(theNextMonth)
        timeLabel.text = nextMonth
    }
    
    func PutMessage(){
        let today:NSDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd  EEEE"
        let stringday = dateFormatter.dateFromString(self.timeLabel.text!)
        let theDay = stringday!.dateByAddingTimeInterval(24*60*60)
        if today == theDay{
            print("成功")
        }
        else{
            let earlierOne = today.earlierDate(theDay)
            if earlierOne == theDay{
                let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                hud.mode = MBProgressHUDMode.Text
                hud.labelText = "选择正确的时间"
                hud.margin = 10.0
                hud.removeFromSuperViewOnHide = true
                hud.hide(true, afterDelay: 2)
            }
            else{
                print("成功")
            }
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let  selectedCell = tableView.cellForRowAtIndexPath(indexPath)
        selectedCell?.tintColor = UIColor(red: 54.0 / 255.0, green: 190.0 / 255.0, blue: 100.0 / 255.0, alpha: 1.0)
        if indexPath.section == 1{
            if (selectedCell!.accessoryType == UITableViewCellAccessoryType.None){
                selectedCell!.accessoryType = .Checkmark
            }
            else{
                selectedCell!.accessoryType = .None
            }
        }
    }
    
    func keyboardWillShowNotification(notification:NSNotification){
        UIView.animateWithDuration(0.3) { () -> Void in
            self.dataTableView.frame.origin.y = -100
            self.view.layoutIfNeeded()
        }
    }
    
    func keyboardWillHideNotification(notification:NSNotification){
        UIView.animateWithDuration(0.3) { () -> Void in
            self.dataTableView.frame.origin.y = 64
            self.view.layoutIfNeeded()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
