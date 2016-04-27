//
//  SendListViewController.swift
//  WXT_Teacher
//
//  Created by mac on 16/4/26.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//
import UIKit
import Alamofire
import MBProgressHUD
import XWSwiftRefresh
class SendListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var dataTableView = UITableView()
    var MessageDataSource = NewsList()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "消息"
        dataTableView.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height - 44)
        dataTableView.delegate = self
        dataTableView.dataSource = self
        dataTableView.registerClass(NewsTableViewCell.self, forCellReuseIdentifier: "NewsCell")
        let rightItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(NewsViewController.RightBtn))
//        let leftItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Search, target: self, action: #selector(NewsViewController.LeftBtn))
        self.navigationItem.rightBarButtonItem = rightItem
        //        self.navigationItem.leftBarButtonItem = leftItem
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(dataTableView)
        
        self.DropDownUpdate()
    }
    
    func DropDownUpdate(){
        self.dataTableView.headerView = XWRefreshNormalHeader(target: self, action: #selector(NewsViewController.GetDate))
        self.dataTableView.reloadData()
        self.dataTableView.headerView?.beginRefreshing()
    }
    
    func GetDate(){
        let url = apiUrl+"SentMessage"
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
                }
                if(status.status == "success"){
                    self.MessageDataSource = NewsList(status.data!)
                    self.dataTableView.reloadData()
                    self.dataTableView.headerView?.endRefreshing()
                }
            }
        }
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
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberofSection")
        print(MessageDataSource.count)
        return MessageDataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NewsCell", forIndexPath: indexPath) as! NewsTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        let newsInfo = MessageDataSource.objectlist[indexPath.row]
        cell.contextLabel.text = newsInfo.message_content!
        cell.nameLabel.text = newsInfo.reciverName!
        cell.avatorImage.image = UIImage(named: "信息群发")
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let newsInfo = NewsInfoViewController() //ZuiXinNewsViewController()
        self.navigationController?.pushViewController(newsInfo, animated: true)
        newsInfo.newsInfo = self.MessageDataSource.objectlist[indexPath.row]
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