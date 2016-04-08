
//
//  ShiPuViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/19.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import Alamofire
import XWSwiftRefresh
import MBProgressHUD
class ShiPuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var FoodsSource = FoodList()
    let dataTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        DropDownUpdate()
        self.title = "每周食谱"
        self.view.backgroundColor = UIColor.whiteColor()
        self.dataTableView.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height - 64)
        self.dataTableView.delegate = self
        self.dataTableView.dataSource = self
        self.dataTableView.tableFooterView = UIView(frame: CGRectZero)
        self.automaticallyAdjustsScrollViewInsets = false
        self.tabBarController?.tabBar.hidden = true
        self.view.addSubview(self.dataTableView)
        // Do any additional setup after loading the view.
    }
    
    
    
    func DropDownUpdate(){
        self.dataTableView.headerView = XWRefreshNormalHeader(target: self, action: #selector(ShiPuViewController.GetDate))
        self.dataTableView.headerView?.beginRefreshing()
        
    }
    //获取食谱
    func GetDate(){
        //下面两句代码是从缓存中取出userid（入参）值
        let defalutid = NSUserDefaults.standardUserDefaults()
        let shid = defalutid.stringForKey("schoolid")
        let url = apiUrl + "WeekRecipe"
        let param = [
            "schoolid":shid!
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
                    hud.mode = MBProgressHUDMode.Text
                    hud.labelText = status.errorData
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                }
                if(status.status == "success"){
                    self.dataTableView.headerView?.endRefreshing()
                    self.FoodsSource = FoodList(status.data!)
                    print(status.data!)
                    self.dataTableView.reloadData()
                }
            }
        }
    }

    //MARK: - tableView代理方法
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.FoodsSource.count
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
       
        let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 18))
        let label = UILabel(frame: CGRectMake(5, 1, tableView.frame.size.width, 18))
        label.font = UIFont.systemFontOfSize(12)
        label.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
        view.addSubview(label)
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        switch section {
        case 0:
            label.text = "周一"
        case 1:
            label.text = "周二"
        case 2:
            label.text = "周三"
        case 3:
            label.text = "周四"
        case 4:
            label.text = "周五"
        case 5:
            label.text = "周六"
        case 6:
            label.text = "周日"
        default:
            label.text = ""
        }
        
        return view
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var
        cell = tableView.dequeueReusableCellWithIdentifier("food") as? FoodTableViewCell
        if cell==nil {
            cell = FoodTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "food")
        }
        cell!.foodInfo = self.FoodsSource.objectlist[indexPath.section]
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let shiPuVC = ShiPuXiangQingViewController()
        shiPuVC.foodInfo = self.FoodsSource.objectlist[indexPath.section]
        self.navigationController?.pushViewController(shiPuVC, animated: true)
        
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
