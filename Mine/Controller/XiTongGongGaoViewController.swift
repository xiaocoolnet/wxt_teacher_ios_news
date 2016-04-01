//
//  XiTongGongGaoViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/4/1.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class XiTongGongGaoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let dataTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "公告列表"
        self.view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        self.dataTableView.frame = CGRectMake(10, 0, self.view.bounds.width - 20, self.view.bounds.height)
        self.dataTableView.delegate = self
        self.dataTableView.dataSource = self
        self.dataTableView.tableFooterView = UIView(frame: CGRectZero)
        self.view.addSubview(self.dataTableView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 287
        }
        if indexPath.row == 1{
            return 53
        }
        return 0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 18))
        let label = UILabel(frame: CGRectMake(0, 5, 60, 18))
        label.textAlignment = .Center
        label.center.x = self.view.center.x
        label.font = UIFont.boldSystemFontOfSize(14)
        label.text = "16:03"
        label.layer.cornerRadius = 3
        label.layer.masksToBounds = true
        label.textColor = UIColor.whiteColor()
        label.backgroundColor = UIColor.grayColor()
        view.addSubview(label)
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        return view
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        cell.selectionStyle = .None
        let titleLabel = UILabel()
        let timeLabel = UILabel()
        let contentImage = UIImageView()
        if indexPath.row == 0{
            titleLabel.frame = CGRectMake(5, 6, 240, 17)
            timeLabel.frame = CGRectMake(5, 50, 80, 15)
            contentImage.frame = CGRectMake(5, 80, self.view.bounds.width - 35, 175)
            contentImage.image = UIImage(named: "公告图片")
            titleLabel.font = UIFont.boldSystemFontOfSize(17)
            timeLabel.font = UIFont.systemFontOfSize(14)
            timeLabel.textColor = UIColor.grayColor()
            timeLabel.text = "2016-03-30"
            titleLabel.text = "智校园系统公告维护更新说明"
            cell.contentView.addSubview(titleLabel)
            cell.contentView.addSubview(timeLabel)
            cell.contentView.addSubview(contentImage)
            return cell
        }
        if indexPath.row == 1{
            cell.accessoryType = .DisclosureIndicator
            cell.textLabel?.text = "查看详情"
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 1{
            let info = XiTongInfoViewController()
            self.navigationController?.pushViewController(info, animated: true)
        }
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
