//
//  ShiPuXiangQingViewController.swift
//  WXT_Teacher
//
//  Created by xiaocool on 16/4/6.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class ShiPuXiangQingViewController: UIViewController {

    
    var foodInfo:FoodInfo?
    var imageCache = Dictionary<String,UIImage>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //加载数据
        loadData()
        //加载视图
        loadSubviews()
    }

    //MARK: - 加载数据
    func loadData() -> Void {
        
    }
    //MARK: - 加载视图
    func loadSubviews() -> Void {
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = self.foodInfo?.recipe_title
        //图片
        let img = UIImageView()
        img.frame = CGRectMake(10, 20, self.view.bounds.width-20, 200)
        let imgUrl = foodMenuImageUrl+(foodInfo!.recipe_pic!)
        img.image = self.imageCache[imgUrl] as UIImage?
        let avatarUrl = NSURL(string: imgUrl)
        let request: NSURLRequest = NSURLRequest(URL: avatarUrl!)
        //异步获取
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response: NSURLResponse?,data: NSData?,error: NSError?)-> Void in
            if(data != nil){
                let imgTmp = UIImage(data: data!)
                self.imageCache[imgUrl] = imgTmp
                img.image = imgTmp
                img.alpha = 1.0
                
            }
        })
        
        self.view.addSubview(img)
        
        
        
        //食物详情
        let foodLabel = UILabel()
        foodLabel.frame = CGRectMake(10, img.frame.maxY+20, img.frame.width, 200)
        foodLabel.text = self.foodInfo?.recipe_info
        foodLabel.numberOfLines = 0
        self.view.addSubview(foodLabel)

        
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
