//
//  MineMainViewController.swift
//  WXT_Teachers
//
//  Created by 李春波 on 16/2/25.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class MineMainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let mineTableView = UITableView()
    let exitBtn = UIButton()
    let avatorImage = UIImageView()
    let nameLabel = UILabel()
    let infoLabel = UILabel()
    let editBtn = UIButton()
    let jifenLabel = UILabel()
    let duiHuanBtn = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的"
        mineTableView.frame = CGRectMake(0, 64, self.view.bounds.width, self.view.bounds.height - 64 - 44)
        mineTableView.delegate = self
        mineTableView.dataSource = self
        mineTableView.registerClass(MineTableViewCell.self, forCellReuseIdentifier: "MineCell")
        exitBtn.frame = CGRectMake(0, 750, 300, 38)
        exitBtn.center.x = self.view.center.x
        exitBtn.setTitle("退出登录", forState: .Normal)
        exitBtn.backgroundColor = UIColor(red: 54.0 / 255.0, green: 190.0 / 255.0, blue: 100.0 / 255.0, alpha: 1.0)
        exitBtn.tintColor = UIColor.whiteColor()
        exitBtn.layer.cornerRadius = 2
        exitBtn.layer.masksToBounds = true
        exitBtn.addTarget(self, action: Selector("ExitLogin"), forControlEvents: .TouchUpInside)
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(mineTableView)
        self.mineTableView.tableFooterView = exitBtn
        self.mineTableView.tableFooterView!.frame = CGRectMake(0, 760, 300, 38)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 2
        }
        if(section == 1){
            return 1
        }
        if(section == 2){
            return 5
        }
        if(section == 3){
            return 4
        }
        return 0
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.section == 0){
            if(indexPath.row == 0){
                return 166
            }
            if(indexPath.row == 1){
                return 51
            }
        }
        if(indexPath.section == 1){
            return 51
        }
        if(indexPath.section == 2){
            return 51
        }
        if(indexPath.section == 3){
            return 51
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "userInfoCell")
        cell.selectionStyle = .None
        if(indexPath.section == 0){
            if(indexPath.row == 0){
                let cell = UITableViewCell(style: .Value1, reuseIdentifier: "userInfoCell")
                cell.selectionStyle = .None
                self.avatorImage.frame = CGRectMake(10, 62, 80, 80)
                self.avatorImage.layer.cornerRadius = 40
                self.avatorImage.layer.masksToBounds = true
                self.avatorImage.image = UIImage(named: "Logo")
                self.nameLabel.frame = CGRectMake(104, 90, 73, 16)
                self.nameLabel.font = UIFont.systemFontOfSize(16)
                self.nameLabel.textColor = UIColor(red: 54.0 / 255.0, green: 190.0 / 255.0, blue: 100.0 / 255.0, alpha: 1.0)
                self.nameLabel.text = "王丹老师"
                self.infoLabel.frame = CGRectMake(105, 115, 110, 11)
                self.infoLabel.font = UIFont.systemFontOfSize(11)
                self.infoLabel.textColor = UIColor.grayColor()
                self.infoLabel.text = "清华幼儿园·大班三班"
                self.editBtn.frame = CGRectMake(174, 91, 12, 12)
                self.editBtn.setBackgroundImage(UIImage(named: "编辑"), forState: .Normal)
                cell.contentView.addSubview(self.avatorImage)
                cell.contentView.addSubview(self.nameLabel)
                cell.contentView.addSubview(self.infoLabel)
                cell.contentView.addSubview(self.editBtn)
                return cell
            }
            if(indexPath.row == 1){
                let defaultCell = tableView.dequeueReusableCellWithIdentifier("MineCell", forIndexPath: indexPath) as! MineTableViewCell
                defaultCell.selectionStyle = .None
                defaultCell.accessoryType = .DisclosureIndicator
                defaultCell.iconImage.image = UIImage(named: "修改密码")
                defaultCell.contentLabel.text = "修改密码"
                return defaultCell
            }
        }
        if(indexPath.section == 1){
            let defaultCell = tableView.dequeueReusableCellWithIdentifier("MineCell", forIndexPath: indexPath) as! MineTableViewCell
            defaultCell.selectionStyle = .None
            defaultCell.iconImage.image = UIImage(named: "我的积分")
            defaultCell.contentLabel.text = "我的积分"
            self.jifenLabel.frame = CGRectMake(115, 19, 50, 14)
            self.jifenLabel.text = "1000"
            self.jifenLabel.font = UIFont.systemFontOfSize(14)
            self.duiHuanBtn.frame = CGRectMake(0, 13, 45, 27)
            self.duiHuanBtn.frame.origin.x = self.view.frame.width - 55
            self.duiHuanBtn.backgroundColor = UIColor(red: 54.0 / 255.0, green: 190.0 / 255.0, blue: 100.0 / 255.0, alpha: 1.0)
            self.duiHuanBtn.tintColor = UIColor.whiteColor()
            self.duiHuanBtn.setTitle("兑换", forState: .Normal)
            self.duiHuanBtn.layer.cornerRadius = 3
            self.duiHuanBtn.layer.masksToBounds = true
            self.duiHuanBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
            defaultCell.contentView.addSubview(self.duiHuanBtn)
            defaultCell.contentView.addSubview(self.jifenLabel)
            return defaultCell
        }
        if(indexPath.section == 2){
            if indexPath.row == 0{
                let defaultCell = tableView.dequeueReusableCellWithIdentifier("MineCell", forIndexPath: indexPath) as! MineTableViewCell
                defaultCell.selectionStyle = .None
                defaultCell.accessoryType = .DisclosureIndicator
                defaultCell.iconImage.image = UIImage(named: "扫一扫打卡")
                defaultCell.contentLabel.text = "扫一扫打卡"
                return defaultCell
            }
            if indexPath.row == 1{
                let defaultCell = tableView.dequeueReusableCellWithIdentifier("MineCell", forIndexPath: indexPath) as! MineTableViewCell
                defaultCell.selectionStyle = .None
                defaultCell.accessoryType = .DisclosureIndicator
                defaultCell.iconImage.image = UIImage(named: "刷卡设置")
                defaultCell.contentLabel.text = "刷卡设置"
                return defaultCell
            }
            if indexPath.row == 2{
                let defaultCell = tableView.dequeueReusableCellWithIdentifier("MineCell", forIndexPath: indexPath) as! MineTableViewCell
                defaultCell.selectionStyle = .None
                defaultCell.accessoryType = .DisclosureIndicator
                defaultCell.iconImage.image = UIImage(named: "系统公告")
                defaultCell.contentLabel.text = "系统公告"
                return defaultCell
            }
            if indexPath.row == 3{
                let defaultCell = tableView.dequeueReusableCellWithIdentifier("MineCell", forIndexPath: indexPath) as! MineTableViewCell
                defaultCell.selectionStyle = .None
                defaultCell.accessoryType = .DisclosureIndicator
                defaultCell.iconImage.image = UIImage(named: "使用帮助")
                defaultCell.contentLabel.text = "使用帮助"
                return defaultCell
            }
            if indexPath.row == 4{
                let defaultCell = tableView.dequeueReusableCellWithIdentifier("MineCell", forIndexPath: indexPath) as! MineTableViewCell
                defaultCell.selectionStyle = .None
                defaultCell.accessoryType = .DisclosureIndicator
                defaultCell.iconImage.image = UIImage(named: "意见反馈")
                defaultCell.contentLabel.text = "意见反馈"
                return defaultCell
            }
        }
        if indexPath.section == 3{
            if indexPath.row == 0{
                let defaultCell = tableView.dequeueReusableCellWithIdentifier("MineCell", forIndexPath: indexPath) as! MineTableViewCell
                defaultCell.selectionStyle = .None
                defaultCell.accessoryType = .DisclosureIndicator
                defaultCell.iconImage.image = UIImage(named: "维护人员")
                defaultCell.contentLabel.text = "维护人员"
                return defaultCell
            }
            if indexPath.row == 1{
                let defaultCell = tableView.dequeueReusableCellWithIdentifier("MineCell", forIndexPath: indexPath) as! MineTableViewCell
                defaultCell.selectionStyle = .None
                defaultCell.accessoryType = .DisclosureIndicator
                defaultCell.iconImage.image = UIImage(named: "在线客服")
                defaultCell.contentLabel.text = "在线客服"
                return defaultCell
            }
            if indexPath.row == 2{
                let defaultCell = tableView.dequeueReusableCellWithIdentifier("MineCell", forIndexPath: indexPath) as! MineTableViewCell
                defaultCell.selectionStyle = .None
                defaultCell.accessoryType = .DisclosureIndicator
                defaultCell.iconImage.image = UIImage(named: "清除缓存")
                defaultCell.contentLabel.text = "清除缓存"
                return defaultCell
            }
            if indexPath.row == 3{
                let defaultCell = tableView.dequeueReusableCellWithIdentifier("MineCell", forIndexPath: indexPath) as! MineTableViewCell
                defaultCell.selectionStyle = .None
                defaultCell.accessoryType = .DisclosureIndicator
                defaultCell.iconImage.image = UIImage(named: "二维码下载")
                defaultCell.contentLabel.text = "二维码下载"
                return defaultCell
            }
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.section == 0){
            if(indexPath.row == 1){
                let ChangePassView = ChangePassViewController()
                self.navigationController?.pushViewController(ChangePassView, animated: true)
                ChangePassView.tabBarController?.tabBar.hidden = true
            }
        }
        if(indexPath.section == 2){
            if(indexPath.row == 0){
                let SaoYiSaoView = SaoYiSaoViewController()
                self.navigationController?.pushViewController(SaoYiSaoView, animated: true)
                SaoYiSaoView.tabBarController?.tabBar.hidden = true
            }
            if(indexPath.row == 1){
                let ChangePassView = ChangePassViewController()
                self.navigationController?.pushViewController(ChangePassView, animated: true)
                ChangePassView.tabBarController?.tabBar.hidden = true
            }
            if(indexPath.row == 2){
                let ChangePassView = ChangePassViewController()
                self.navigationController?.pushViewController(ChangePassView, animated: true)
                ChangePassView.tabBarController?.tabBar.hidden = true
            }
            if(indexPath.row == 3){
                let  HelpView = HelpTableViewController()
                self.navigationController?.pushViewController(HelpView, animated: true)
                HelpView.tabBarController?.tabBar.hidden = true
            }
            if(indexPath.row == 4){
                let ChangePassView = ChangePassViewController()
                self.navigationController?.pushViewController(ChangePassView, animated: true)
                ChangePassView.tabBarController?.tabBar.hidden = true
            }
        }
        if(indexPath.section == 3){
            if(indexPath.row == 0){
                let ChangePassView = ChangePassViewController()
                self.navigationController?.pushViewController(ChangePassView, animated: true)
                ChangePassView.tabBarController?.tabBar.hidden = true
            }
            if(indexPath.row == 1){
                let ServerView = ServerTableViewController()
                self.navigationController?.pushViewController(ServerView, animated: true)
                ServerView.tabBarController?.tabBar.hidden = true
            }
            if(indexPath.row == 3){
                let ChangePassView = ChangePassViewController()
                self.navigationController?.pushViewController(ChangePassView, animated: true)
                ChangePassView.tabBarController?.tabBar.hidden = true
            }
        }
    }
    
    func ExitLogin(){
        let alertController = UIAlertController(title: NSLocalizedString("", comment: "Warn"), message: NSLocalizedString("确认注销？", comment: "empty message"), preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        let doneAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
            let userid = NSUserDefaults.standardUserDefaults()
            userid.setValue("", forKey: "userid")
            let defalutid = NSUserDefaults.standardUserDefaults()
            defalutid.setValue("", forKey: "cid")
            let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("LoginView") as! UINavigationController
            self.presentViewController(vc, animated: true, completion: nil)
        }
        alertController.addAction(doneAction)
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true, completion: nil)
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
