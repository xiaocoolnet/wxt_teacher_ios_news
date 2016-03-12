//
//  BBKeTangViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/12.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class BBKeTangViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let lastDayBtn = UIButton()
    let nextDayBtn = UIButton()
    let timeLabel = UILabel()
    let lastMonthBtn = UIButton()
    let nextMonthBtn = UIButton()
    let weekLabel = UILabel()
    let ketangTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "宝宝课堂"
        self.ketangTableView.frame = CGRectMake(0, 64, self.view.bounds.width, self.view.bounds.height - 64)
        self.ketangTableView.dataSource = self
        self.ketangTableView.delegate = self
        self.ketangTableView.tableFooterView = UIView(frame: CGRectZero)
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(self.ketangTableView)
        // Do any additional setup after loading the view.
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
        if section == 2{
            return 4
        }
        return 0
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }
        return 20
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 40
        }
        if indexPath.section == 1{
            return 50
        }
        if indexPath.section == 2{
            return 50
        }
        return 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        cell.selectionStyle = .None
        if indexPath.section == 0{
            lastDayBtn.frame = CGRectMake(50, 10, 20, 20)
            lastDayBtn.setImage(UIImage(named: "上一天"), forState: .Normal)
            lastDayBtn.addTarget(self, action: Selector("LastDay"), forControlEvents: .TouchUpInside)
            nextDayBtn.frame = CGRectMake(0, 10, 20, 20)
            nextDayBtn.frame.origin.x = self.view.bounds.width - 70
            nextDayBtn.setImage(UIImage(named: "下一天"), forState: .Normal)
            nextDayBtn.addTarget(self, action: Selector("NextDay"), forControlEvents: .TouchUpInside)
            lastMonthBtn.frame = CGRectMake(30, 10, 20, 20)
            lastMonthBtn.setImage(UIImage(named: "上个月"), forState: .Normal)
            lastMonthBtn.addTarget(self, action: Selector("LastMonth"), forControlEvents: .TouchUpInside)
            nextMonthBtn.frame = CGRectMake(0, 10, 20, 20)
            nextMonthBtn.setImage(UIImage(named: "下个月"), forState: .Normal)
            nextMonthBtn.frame.origin.x = self.view.bounds.width - 50
            nextMonthBtn.addTarget(self, action: Selector("NextMonth"), forControlEvents: .TouchUpInside)
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
        cell.textLabel?.text = "第\(indexPath.row + 1)节课: 语文"
        return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        if(section == 1){
            let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 18))
            let label = UILabel(frame: CGRectMake(5, 1, tableView.frame.size.width, 18))
            label.font = UIFont.systemFontOfSize(12)
            label.text = "上午"
            label.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
            view.addSubview(label)
            view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
            return view
        }
        if(section == 2){
            let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 18))
            let label = UILabel(frame: CGRectMake(5, 1, tableView.frame.size.width, 18))
            label.font = UIFont.systemFontOfSize(12)
            label.text = "下午"
            label.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
            view.addSubview(label)
            view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
            return view
        }
        return UIView(frame: CGRectZero)
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
