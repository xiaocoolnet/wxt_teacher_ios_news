//
//  BlogViewController.swift
//  WXT_Teachers
//
//  Created by 李春波 on 16/2/25.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import Alamofire
import YYWebImage
import MBProgressHUD
import XWSwiftRefresh

class BlogViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let blogTableView = UITableView()
    var blogSource = BlogList()
    var pciSource = PictureList()
    var DianzanSource = DianZanList()
    var remoteThumbImage = [NSIndexPath:[String]]()
    var remoteImage :[String] = []
    
    
    override func viewDidLoad() {
        self.title = "动态"
        super.viewDidLoad()
        blogTableView.delegate = self
        blogTableView.dataSource = self
        blogTableView.frame = CGRectMake(0, 64, self.view.bounds.width, self.view.bounds.height - 64 - 44)
        blogTableView.registerClass(BlogTableViewCell.self, forCellReuseIdentifier: "blogCell")
        self.automaticallyAdjustsScrollViewInsets = false
        self.tabBarController?.tabBar.hidden = false
        self.view.addSubview(blogTableView)
        self.DropDownUpdate()
    }
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    
    func DropDownUpdate(){
        self.blogTableView.headerView = XWRefreshNormalHeader(target: self, action: "GetDate")
        self.blogTableView.reloadData()
        self.blogTableView.headerView?.beginRefreshing()
    }
    
    
    func GetDate(){
        print("刷新")
        let url = apiUrl+"GetMicroblog"
        let param = [
            "schoolid":1,
            "classid":1,
            "beginid":0
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
                    self.blogSource = BlogList(status.data!)
                    self.blogTableView.reloadData()
                    self.blogTableView.headerView?.endRefreshing()
                }
            }
        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if (blogSource.count > 0 ){
            return blogSource.count
        }
        else{
            return 0
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.row == 0){
            let options : NSStringDrawingOptions = NSStringDrawingOptions.UsesLineFragmentOrigin
            let bloginfo = self.blogSource.objectlist[indexPath.section]
            self.pciSource = PictureList(bloginfo.piclist!)
            let string:NSString = bloginfo.content!
            let screenBounds:CGRect = UIScreen.mainScreen().bounds
            if(pciSource.count == 0){
                let boundingRect = string.boundingRectWithSize(CGSizeMake(screenBounds.width, 0), options: options, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(17)], context: nil)
                if(boundingRect.size.height>140){
                    return 20 * 7 + 50
                }
                return boundingRect.size.height + 20 + 50
            }
            if(pciSource.count<=3&&pciSource.count>0){
                let boundingRect = string.boundingRectWithSize(CGSizeMake(screenBounds.width, 0), options: options, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(17)], context: nil)
                if(boundingRect.size.height>140){
                    return 20 * 7 + 95 + 50
                }else{
                    return boundingRect.size.height + 90 + 50
                }
            }
            else if(pciSource.count>3&&pciSource.count<=6){
                let boundingRect = string.boundingRectWithSize(CGSizeMake(screenBounds.width, 0), options: options, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(17)], context: nil)
                if(boundingRect.size.height>140){
                    return 20 * 7 + 155 + 50
                }else{
                    return boundingRect.size.height + 150 + 50
                }
                
            }else{
                let boundingRect = string.boundingRectWithSize(CGSizeMake(screenBounds.width, 0), options: options, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(17)], context: nil)
                if(boundingRect.size.height>140){
                    return 20 * 7 + 220 + 50
                }else{
                    return boundingRect.size.height + 220 + 50
                }
            }
        }
        if(indexPath.row == 1){
            return 60
        }
        return 0
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        self.remoteThumbImage = [NSIndexPath:[String]]()
        self.remoteImage = []
        let displayView = DisplayView()
        let avatorImage = UIImageView()
        let nameLable = UILabel()
        let contentLable = UILabel()
        let options : NSStringDrawingOptions = NSStringDrawingOptions.UsesLineFragmentOrigin
        let bloginfo = self.blogSource.objectlist[indexPath.section]
        let string:NSString = bloginfo.content!
        let screenBounds:CGRect = UIScreen.mainScreen().bounds
        self.DianzanSource = DianZanList(bloginfo.dianzanlist!)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 70, height: 70)
        layout.scrollDirection = UICollectionViewScrollDirection.Vertical
        layout.headerReferenceSize = CGSize(width: self.view.frame.width, height: 40)
        let cell1 = UITableViewCell(style: .Value1, reuseIdentifier: "blog")
        cell1.selectionStyle = .None
        if(indexPath.row == 0){
            var cell:BlogTableViewCell? = tableView.dequeueReusableCellWithIdentifier("blogCell", forIndexPath: indexPath) as? BlogTableViewCell
            if cell == nil{
                 cell = BlogTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "image")
            }
            else{
                while(cell?.contentView.subviews.last != nil){
                    cell?.contentView.subviews.last?.removeFromSuperview()
                }
            }
            self.pciSource = PictureList(bloginfo.piclist!)
            cell!.selectionStyle = .None
            nameLable.text = bloginfo.name!
            nameLable.frame = CGRectMake(63, 17, 50, 15)
            nameLable.font = UIFont.systemFontOfSize(15)
            if(bloginfo.photo != nil){
                let imgUrl = imageUrl+(bloginfo.photo!)
                let avatarUrl = NSURL(string: imgUrl)
                let request: NSURLRequest = NSURLRequest(URL: avatarUrl!)
                //异步获取
                NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response: NSURLResponse?,data: NSData?,error: NSError?)-> Void in
                    if(data != nil){
                        let imgTmp = UIImage(data: data!)
                        avatorImage.image = imgTmp
                        avatorImage.alpha = 1.0
                    }
                })
                avatorImage.frame = CGRectMake(17, 5, 42, 42)
                avatorImage.layer.cornerRadius = 21
                avatorImage.layer.masksToBounds = true
            }
            if(bloginfo.piclist != nil){
                let boundingRect = string.boundingRectWithSize(CGSizeMake(screenBounds.width, 0), options: options, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(17)], context: nil)
                if(boundingRect.size.height > 140){
                    contentLable.numberOfLines = 7
                    contentLable.frame = CGRectMake(15, 50, self.view.frame.width - 31, 140)
                    let collectionViewFrame = CGRectMake(8, 180, 220, 290)
                    displayView.frame = collectionViewFrame
                }
                if(boundingRect.size.height < 140){
                    contentLable.numberOfLines = 0
                    contentLable.frame = CGRectMake(15, 50, self.view.frame.width - 31, boundingRect.size.height)
                    let collectionViewFrame = CGRectMake(8, boundingRect.size.height + 45,  220, 290)
                    displayView.frame = collectionViewFrame
                    //displayView.make_center(offsest: cell!.contentView.center, width: 220, height: 290)
                }
                contentLable.font = UIFont.systemFontOfSize(15)
                for i in 0..<pciSource.count{
                        let pciInfo = pciSource.picturelist[i]
                        let imgUrl = microblogImageUrl+(pciInfo.pictureurl)!
                        self.remoteImage.append(imgUrl)
                }
                self.remoteThumbImage[indexPath] = self.remoteImage
            }
            contentLable.text = bloginfo.content!
            print("点击前图片的数量\(self.remoteThumbImage[indexPath]!.count)")
            displayView.imgsPrepare(remoteThumbImage[indexPath]!, isLocal: false)
            let pbVC = PhotoBrowser()
            pbVC.showType = .Modal
            pbVC.photoType = PhotoBrowser.PhotoType.Host
            pbVC.hideMsgForZoomAndDismissWithSingleTap = true
            var models: [PhotoBrowser.PhotoModel] = []
            print("点击后\(displayView.subviews.count)")
            print("点击后图片的数量\(self.remoteThumbImage[indexPath]!.count)")
            //模型数据数组
            for (var i=0; i<self.remoteThumbImage[indexPath]!.count; i++){
                let model = PhotoBrowser.PhotoModel(hostHDImgURL:self.remoteThumbImage[indexPath]![i], hostThumbnailImg: (displayView.subviews[i] as! UIImageView).image, titleStr: "", descStr: "", sourceView: displayView.subviews[i])
                models.append(model)
            }
            /**  设置数据  */
            pbVC.photoModels = models
            displayView.tapedImageV = {[unowned self] index in
                pbVC.show(inVC: self,index: index)
            }
            cell!.contentView.addSubview(displayView)
            cell!.contentView.addSubview(contentLable)
            cell!.contentView.addSubview(nameLable)
            cell!.contentView.addSubview(avatorImage)
            return cell!
        }
        if indexPath.row == 1{
            return cell1
        }
        return cell1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
