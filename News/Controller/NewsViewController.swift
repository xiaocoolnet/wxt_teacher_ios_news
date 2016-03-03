//
//  NewsViewController.swift
//  WXT_Teachers
//
//  Created by 李春波 on 16/2/23.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var dataTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "消息"
        dataTableView.frame = CGRectMake(0, 60, self.view.bounds.width, self.view.bounds.height - 90)
        dataTableView.delegate = self
        dataTableView.dataSource = self
        dataTableView.registerClass(NewsTableViewCell.self, forCellReuseIdentifier: "NewsCell")
        let rightItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "RightBtn")
        let leftItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Search, target: self, action: "LeftBtn")
        self.navigationItem.rightBarButtonItem = rightItem
        self.navigationItem.leftBarButtonItem = leftItem
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(dataTableView)
        
    }
    
    func RightBtn(){
        print("点击了右边的按钮")
    }
    
    func LeftBtn(){
        print("点击了左边的按钮")
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 6
        }
       if(section == 1){
            return 10
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NewsCell", forIndexPath: indexPath) as! NewsTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        if(indexPath.section == 0){
            if(indexPath.row == 0){
                cell.contextLabel.text = "小张妈妈发布了一张日记照片"
                cell.nameLabel.text = "最新消息"
                cell.avatorImage.image = UIImage(named:"最新消息" )
                return cell
            }
            if(indexPath.row == 1){
                cell.contextLabel.text = "小张妈妈回复了一条信息"
                cell.nameLabel.text = "信息群发"
                cell.avatorImage.image = UIImage(named:"信息群发")
                return cell
            }
            if(indexPath.row == 2){
                cell.contextLabel.text = "小张妈妈回复了一条信息"
                cell.nameLabel.text = "家长叮嘱"
                cell.avatorImage.image = UIImage(named:"家长叮嘱" )
                return cell
            }
            if(indexPath.row == 3){
                cell.contextLabel.text = "小张妈妈回复了一条信息"
                cell.nameLabel.text = "通知公告"
                cell.avatorImage.image = UIImage(named:"通知公告" )
                return cell
            }
            if(indexPath.row == 4){
                cell.contextLabel.text = "小张妈妈回复了一条信息"
                cell.nameLabel.text = "代办事宜"
                cell.avatorImage.image = UIImage(named:"代办事宜" )
                return cell
            }
            if(indexPath.row == 5){
                cell.contextLabel.text = "小张妈妈回复了一条信息"
                cell.nameLabel.text = "园丁沟通"
                cell.avatorImage.image = UIImage(named:"园丁沟通" )
                return cell
            }
        }
        if(indexPath.section == 1){
            cell.contextLabel.text = "hahahahahaa阿斯达斯"
            cell.nameLabel.text = "张老师"
            cell.avatorImage.image = UIImage(named: "Logo")
            return cell
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.dataTableView.deselectRowAtIndexPath(indexPath, animated: true)
        let newsInfo = NewsInfoViewController()
        self.navigationController?.pushViewController(newsInfo, animated: true)
        newsInfo.tabBarController?.tabBar.hidden = true
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if(indexPath.section == 0){
            return false
        }
        return true
    }

    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.section)
        if editingStyle == .Delete
        {
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
