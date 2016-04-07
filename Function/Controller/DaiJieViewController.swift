//
//  DaiJieViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/9.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class DaiJieViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let dataTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "代接确认"
        self.view.backgroundColor = UIColor.whiteColor()
        dataTableView.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height - 64)
        dataTableView.delegate = self
        dataTableView.dataSource = self
        dataTableView.registerClass(DaiJieTableViewCell.self, forCellReuseIdentifier: "Daijie")
        self.automaticallyAdjustsScrollViewInsets = false
        self.tabBarController?.tabBar.hidden = true
        self.view.addSubview(dataTableView)
        // Do any additional setup after loading the view.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        if(section == 0){
            let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 18))
            let label = UILabel(frame: CGRectMake(5, 1, tableView.frame.size.width, 18))
            label.font = UIFont.systemFontOfSize(12)
            label.text = "未接走(3)"
            label.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
            view.addSubview(label)
            view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
            return view
        }
        if(section == 1){
            let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 18))
            let label = UILabel(frame: CGRectMake(5, 1, tableView.frame.size.width, 18))
            label.font = UIFont.systemFontOfSize(12)
            label.text = "待确认(5)"
            label.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
            view.addSubview(label)
            view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
            return view
        }
        let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 18))
        let label = UILabel(frame: CGRectMake(5, 1, tableView.frame.size.width, 18))
        label.font = UIFont.systemFontOfSize(12)
        label.text = "已接走(26)"
        label.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
        view.addSubview(label)
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        return view
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 3
        }
        if(section == 1){
            return 5
        }
        if(section == 2){
            return 26
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Daijie", forIndexPath: indexPath) as! DaiJieTableViewCell
        cell.selectionStyle = .None
        if(indexPath.section == 0){
            cell.nameLabel.text = "小明"
            cell.btn.backgroundColor = UIColor(red: 245/255, green: 80/255, blue: 102/255, alpha: 1)
            cell.btn.layer.borderWidth = 0
            cell.btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            cell.btn.setTitle("提醒家长", forState: .Normal)
            cell.btn.frame.origin.x = self.view.bounds.width - 80
            cell.btn.addTarget(self, action: #selector(DaiJieViewController.TiXingJiaZhang), forControlEvents: .TouchUpInside)
            return cell
        }
        if(indexPath.section == 1){
            cell.nameLabel.text = "小房"
            cell.btn.backgroundColor = UIColor(red: 255/255, green: 130/255, blue: 4/255, alpha: 1)
            cell.btn.layer.borderWidth = 0
            cell.btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            cell.btn.setTitle("提醒", forState: .Normal)
            cell.btn.frame.origin.x = self.view.bounds.width - 80
            cell.btn.addTarget(self, action: #selector(DaiJieViewController.TiXing), forControlEvents: .TouchUpInside)
            return cell
        }
        else{
            cell.nameLabel.text = "小红"
            cell.btn.backgroundColor = UIColor.whiteColor()
            cell.btn.layer.borderWidth = 1
            cell.btn.layer.borderColor = UIColor.grayColor().CGColor
            cell.btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
            cell.btn.setTitle("已接走", forState: .Normal)
            cell.btn.frame.origin.x = self.view.bounds.width - 80
            return cell
        }
    }
    
    func TiXingJiaZhang(){
        let tixingjiazhang = TiXingJiaZhangViewController()
        self.navigationController?.pushViewController(tixingjiazhang, animated: true)
    }
    
    func TiXing(){
        let tixing = TiXingViewController()
        self.navigationController?.pushViewController(tixing, animated: true)
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
