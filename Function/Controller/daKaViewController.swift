//
//  daKaViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/15.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class daKaViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let dakaiTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "老师考勤"
        dakaiTableView.frame = CGRectMake(0,64,self.view.bounds.width,self.view.bounds.height - 64)
        dakaiTableView.dataSource = self
        dakaiTableView.delegate = self
        self.view.backgroundColor = UIColor.whiteColor()
        self.automaticallyAdjustsScrollViewInsets = false
        self.dakaiTableView.tableFooterView = UIView(frame: CGRectZero)
        self.tabBarController?.tabBar.hidden = true
        self.view.addSubview(dakaiTableView)

        // Do any additional setup after loading the view.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        if section == 1{
            return 6
        }
        return 0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 30
        }
        if indexPath.section == 1{
            if indexPath.row == 0{
                return 20
            }
            else{
                return 50
            }
        }
        return 0
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }
        if section == 1{
            return 60
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        cell.selectionStyle = .None
        let timeLabel = UILabel()
        let checkBtn = UIButton()
        checkBtn.frame = CGRectMake(0, 10, 70, 30)
        checkBtn.frame.origin.x = self.view.bounds.width - 80
        let today:NSDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss  EEEE"
        let allday = dateFormatter.stringFromDate(today)
        if indexPath.section == 0{
            timeLabel.frame = CGRectMake(0, 10, 250, 15)
            timeLabel.font = UIFont.systemFontOfSize(15)
            timeLabel.textColor = UIColor.grayColor()
            timeLabel.text = allday
            timeLabel.center.x = self.view.center.x
            timeLabel.textAlignment = .Center
            cell.contentView.addSubview(timeLabel)
            return cell
        }
        if indexPath.section == 1{
            if indexPath.row == 0{
                cell.textLabel?.text = "签到历史"
                cell.textLabel?.font = UIFont.systemFontOfSize(12)
                cell.textLabel?.textColor = UIColor.grayColor()
                return cell
            }
            if indexPath.row == 1{
                cell.textLabel?.text = "星期一"
                checkBtn.setTitle("已签到", forState: .Normal)
                checkBtn.backgroundColor = UIColor.whiteColor()
                checkBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
                checkBtn.layer.cornerRadius = 5
                checkBtn.layer.masksToBounds = true
                checkBtn.layer.borderColor = UIColor.grayColor().CGColor
                checkBtn.layer.borderWidth = 0.5
                checkBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
                cell.contentView.addSubview(checkBtn)
                return cell
            }
            if indexPath.row == 2{
                cell.textLabel?.text = "星期二"
                checkBtn.setTitle("迟到", forState: .Normal)
                //(245,80,102)
                checkBtn.backgroundColor = UIColor(red: 245/255, green: 80/255, blue: 102/255, alpha: 1)
                checkBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                checkBtn.layer.cornerRadius = 5
                checkBtn.layer.masksToBounds = true
                checkBtn.layer.borderColor = UIColor.grayColor().CGColor
                checkBtn.layer.borderWidth = 0
                checkBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
                cell.contentView.addSubview(checkBtn)
                return cell

            }
            if indexPath.row == 3{
                cell.textLabel?.text = "星期三"
                checkBtn.setTitle("未签到", forState: .Normal)
                //(245,80,102)
                checkBtn.backgroundColor = UIColor(red: 245/255, green: 80/255, blue: 102/255, alpha: 1)
                checkBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                checkBtn.layer.cornerRadius = 5
                checkBtn.layer.masksToBounds = true
                checkBtn.layer.borderColor = UIColor.grayColor().CGColor
                checkBtn.layer.borderWidth = 0
                checkBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
                cell.contentView.addSubview(checkBtn)
                return cell

            }
            if indexPath.row == 4{
                cell.textLabel?.text = "星期四"
                checkBtn.setTitle("待签到", forState: .Normal)
                //(245,80,102)
                checkBtn.backgroundColor = UIColor(red: 255/255, green: 130/255, blue: 4/255, alpha: 1)
                checkBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                checkBtn.layer.cornerRadius = 5
                checkBtn.layer.masksToBounds = true
                checkBtn.layer.borderColor = UIColor.grayColor().CGColor
                checkBtn.layer.borderWidth = 0
                checkBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
                cell.contentView.addSubview(checkBtn)
                return cell
            }
            if indexPath.row == 5{
                cell.textLabel?.text = "星期五"
                checkBtn.setTitle("无数据", forState: .Normal)
                checkBtn.backgroundColor = UIColor.whiteColor()
                checkBtn.setTitleColor(UIColor.grayColor(), forState: .Normal)
                checkBtn.layer.cornerRadius = 5
                checkBtn.layer.masksToBounds = true
                checkBtn.layer.borderColor = UIColor.grayColor().CGColor
                checkBtn.layer.borderWidth = 0.5
                checkBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
                cell.contentView.addSubview(checkBtn)
                return cell
            }
        }
        return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1{
            let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 60))
            let qiandaoBtn = UIButton(frame: CGRectMake(0, 10, 300, 40))
            qiandaoBtn.titleLabel?.font = UIFont.systemFontOfSize(16)
            qiandaoBtn.setTitle("打卡签到", forState: .Normal)
            qiandaoBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            qiandaoBtn.layer.cornerRadius = 5
            qiandaoBtn.layer.masksToBounds = true
            qiandaoBtn.center.x = self.view.center.x
            qiandaoBtn.backgroundColor = UIColor(red: 155/255, green: 229/255, blue: 180/255, alpha: 1)
            view.addSubview(qiandaoBtn)
            view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
            return view
        }
        let view = UIView(frame: CGRectZero)
        return view
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
