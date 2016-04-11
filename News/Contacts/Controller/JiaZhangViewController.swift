//
//  JiaZhangViewController.swift
//  WXT_Teachers
//
//  Created by 李春波 on 16/2/23.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
import XWSwiftRefresh


class JiaZhangViewController: UIViewController,FlexibleTableViewDelegate {
    
    var contactSource : ContactList?
    var tableView: FlexibleTableView!
    var subRows = Array<Int>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //加载数据
        loadData()
        //加载视图
        loadSubviews()
        
    }
    
    
    //MARK: - 加载数据
    func loadData() -> Void {
        self.GetDate()
    }
    func GetDate(){
        let url = apiUrl+"MessageAddress"
        let userid = NSUserDefaults.standardUserDefaults()
        let uid = userid.stringForKey("userid")
        let param = [
            "userid":uid!
        ]
        
        Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
            if(error != nil){
            }
            else{
                print("request是")
                print(request!)
                print("====================")
                let status = Http(JSONDecoder(json!))
                print("状态是")
                print(status.status)
                if(status.status == "error"){
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text;
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                    print("0")
                    
                }
                if(status.status == "success"){
                    self.contactSource = ContactList(status.data!)
                    self.tableView.refreshData()
                    self.tableView.headerView?.endRefreshing()
                    print(self.contactSource?.objectlist[0].teacherlist[0].name)
                    print("fu")
                    print(self.contactSource?.count)
                    for ob in (self.contactSource?.objectlist)!{
                        self.subRows.append(ob.teacherlist.count)
                        
                    }
                    print(self.subRows)
                    
                }
            }
        }
    }
    //MARK: - 加载视图
    func loadSubviews() -> Void {
        tableView = FlexibleTableView(frame: CGRectMake(0, -30, self.view.bounds.width, self.view.bounds.height - 114), delegate: self)
        self.tableView.registerClass(ContactsTableViewCell.self, forCellReuseIdentifier: "ContactsCell")
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(tableView)
    }
    
    
    
    func DropDownUpdate(){
        self.tableView.headerView = XWRefreshNormalHeader(target: self, action: #selector(JiaZhangViewController.GetDate))
        self.tableView.refreshData()
        self.tableView.headerView?.beginRefreshing()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //有几组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //一组几个父类行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.contactSource?.count>0 {
            print(self.contactSource?.count)
            return (self.contactSource?.count)!
        }
        
        return 0
    }
    //默认的哪一行展开(self.contactSource?.count)!
    func tableView(tableView: UITableView, shouldExpandSubRowsOfCellAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        //        if (indexPath.section == 0 && indexPath.row == 0){
        //            return true
        //        }
        //        print("indexpath.row=\(indexPath.row)")
        return false
    }
    //哪一行里面有多少子类行
    func tableView(tableView: UITableView, numberOfSubRowsAtIndexPath indexPath: NSIndexPath) -> Int
    {
        if self.contactSource?.objectlist[indexPath.row].count>0 {
            
            print(self.contactSource?.objectlist[indexPath.row].count)
            return (self.contactSource?.objectlist[indexPath.row].count)!
        }
        
        return 0
    }
    
    //每一父类行的标题是什么
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = FlexibleTableViewCell(style:.Default, reuseIdentifier:"cell")
        cell.expandable = true
        if self.contactSource?.count>0 {
            cell.textLabel?.text = self.contactSource?.objectlist[indexPath.row].classname
            
        }
    
        return cell
    }
    //加载子类行的数据
    func tableView(tableView: UITableView, cellForSubRowAtIndexPath indexPath: FlexibleIndexPath) -> UITableViewCell {

    
        var cell = tableView.dequeueReusableCellWithIdentifier("ContactsCell", forIndexPath: indexPath.ns) as? ContactsTableViewCell
     
        if cell==nil {
            cell = ContactsTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "ContactsCell")
        }
        if self.contactSource?.count>0 {
//            print("indexpath.row=\(indexPath.row)")
            cell!.nameLabel.text = self.contactSource?.objectlist[indexPath.row].teacherlist[indexPath.subRow-1].name
        }
        
        cell?.phoneBtn.tag = Int((self.contactSource?.objectlist[indexPath.row].teacherlist[indexPath.subRow-1].phone)!)!
        cell?.phoneBtn.addTarget(self, action: #selector(JiaZhangViewController.phone(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    
        return cell!
    }
    
        
    func tableView(tableView: FlexibleTableView, didSelectSubRowAtIndexPath indexPath: FlexibleIndexPath) {
        
    }
    
    func collapseSubrows() {
        tableView.collapseCurrentlyExpandedIndexPaths()
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    
    //MARK: - 点击事件
    func phone(button:UIButton) -> Void {
        print("dianhua")
        let tel = String(button.tag)
        print(tel)
        let url = NSURL(string: "tel://"+tel)
        UIApplication.sharedApplication().openURL(url!)
        
        
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
