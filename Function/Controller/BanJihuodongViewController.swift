//
//  BanJihuodongViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/15.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import YYWebImage
import Alamofire
import MBProgressHUD
import XWSwiftRefresh


class BanJihuodongViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var huoDongSource = HuoDongList()

    let huoDongTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "班级活动"
        self.view.backgroundColor = UIColor.whiteColor()
        
        //增加班级活动按钮
        let addBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(BanJihuodongViewController.addHuodong))
        self.navigationItem.rightBarButtonItem = addBtn
        
        self.automaticallyAdjustsScrollViewInsets = false
        huoDongTableView.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height)
        self.huoDongTableView.tableFooterView = UIView(frame: CGRectZero)
        huoDongTableView.delegate = self
        huoDongTableView.dataSource = self
        self.tabBarController?.tabBar.hidden = true
        self.view.addSubview(huoDongTableView)
        
        self.DropDownUpdate()
    }
    
    func DropDownUpdate(){
        self.huoDongTableView.headerView = XWRefreshNormalHeader(target: self, action: #selector(NewsViewController.GetDate))
        self.huoDongTableView.reloadData()
        self.huoDongTableView.headerView?.beginRefreshing()
    }
    
    func GetDate(){
        let url = apiUrl+"ClassActivity"
        let schoolid = 1
        let classid = 1
        
        let param = [
            "schoolid":schoolid,
            "classid":classid
            
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
                    self.huoDongSource = HuoDongList(status.data!)
                    self.huoDongTableView.reloadData()
                    self.huoDongTableView.headerView?.endRefreshing()
                    print("1")
                }
            }
        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return huoDongSource.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        cell.selectionStyle = .None
        cell.accessoryType = .DisclosureIndicator
        
        let huoDongInfo = huoDongSource.objectlist[indexPath.row]
        
        
        //let urlStr = "http://www.xiaocool.cn:8016/uploads/ClassAction/chunyou.jpg"
        
        //cell.imageView?.yy_imageURL = NSURL(fileURLWithPath: urlStr)
        //定义NSURL对象
        let url = NSURL(string: "http://www.xiaocool.cn:8016/uploads/ClassAction/" + huoDongInfo.activity_pic!)
        //从网络获取数据流
        let data = NSData(contentsOfURL: url!)
        //通过数据流初始化图片
        let newImage = UIImage(data: data!)
        cell.imageView?.image = newImage
        
        
        cell.imageView?.frame = CGRectMake(10, 10, 80, 80)
        cell.textLabel?.text = huoDongInfo.activity_title
        return cell
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let huodongxq = HuoDongXqViewController()
        self.navigationController?.pushViewController(huodongxq, animated: true)
    }

    //MARK: - 增加班级活动事件
    func addHuodong() {
        let huodongVC = HuoDongXqViewController()
        self.navigationController?.pushViewController(huodongVC, animated: true)
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
