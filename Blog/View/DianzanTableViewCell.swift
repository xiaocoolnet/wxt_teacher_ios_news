//
//  DianzanTableViewCell.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/2.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class DianzanTableViewCell: UITableViewCell {

    let dianZanBtn = UIButton()
    var mid:String?
    var myDianZan = NSMutableSet()
    let dianZanPeople = UILabel()
    var nameString:String?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        dianZanBtn.addTarget(self, action: #selector(DianzanTableViewCell.ChangeDianZan), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func ChangeDianZan(){
        dianZanBtn.selected = !dianZanBtn.selected
        if(!dianZanBtn.selected){
            myDianZan.removeObject(mid!)
            QuXiaoDianZan()
            dianZanBtn.setImage(UIImage(named: "zan"), forState: .Normal)
        }
        else{
            myDianZan.addObject(mid!)
            GetDianZanDate()
            dianZanBtn.setImage(UIImage(named: "zan2"), forState: .Normal)
        }
    }

    func QuXiaoDianZan(){
        let url = apiUrl+"ResetLike"
        let userid = NSUserDefaults.standardUserDefaults()
        let uid = userid.stringForKey("userid")
        let param = [
            "mid":mid!,
            "userid":uid!
        ]
        Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
            if(error != nil){
            }
            else{
                print("request是")
                print(request!)
                print("====================")
                let status = MineModel(JSONDecoder(json!))
                print("状态是")
                print(status.status)
                if(status.status == "error"){
                    let hud = MBProgressHUD.showHUDAddedTo(self.contentView, animated: true)
                    hud.mode = MBProgressHUDMode.Text;
                    hud.labelText = status.errorData
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                }
                
                if(status.status == "success"){
                    self.dianZanBtn.frame = CGRectMake(10,10,30,30)
                    let hud = MBProgressHUD.showHUDAddedTo(self.contentView, animated: true)
                    hud.mode = MBProgressHUDMode.Text;
                    hud.labelText = "取消点赞"
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                }
            }
        }
    }

    func GetDianZanDate(){
        let url = apiUrl+"SetLike"
        let userid = NSUserDefaults.standardUserDefaults()
        let uid = userid.stringForKey("userid")
        let param = [
            "mid":mid!,
            "userid":uid!
        ]
        Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
            if(error != nil){
            }
            else{
                print("request是")
                print(request!)
                print("====================")
                let status = MineModel(JSONDecoder(json!))
                print("状态是")
                print(status.status)
                if(status.status == "error"){
                    let hud = MBProgressHUD.showHUDAddedTo(self.contentView, animated: true)
                    hud.mode = MBProgressHUDMode.Text;
                    hud.labelText = status.errorData
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                }
                if(status.status == "success"){
                    self.dianZanBtn.frame = CGRectMake(10,10,30,30)
                    let hud = MBProgressHUD.showHUDAddedTo(self.contentView, animated: true)
                    hud.mode = MBProgressHUDMode.Text;
                    hud.labelText = "点赞成功"
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                }
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
