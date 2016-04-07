//
//  FoodTableViewCell.swift
//  WXT_Teacher
//
//  Created by xiaocool on 16/4/6.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    var foodInfo:FoodInfo?
    var imageCache = Dictionary<String,UIImage>()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
     
        
        
    }
    
    //MARK: - 加载子视图
    
    func loadSubviews() -> Void {
        //图片
        let foodImg = UIImageView()
        foodImg.frame = CGRectMake(10, 10, 80, 80)
        let imgUrl = foodMenuImageUrl+(foodInfo!.recipe_pic!)
        foodImg.image = self.imageCache[imgUrl] as UIImage?
        let avatarUrl = NSURL(string: imgUrl)
        let request: NSURLRequest = NSURLRequest(URL: avatarUrl!)
        //异步获取
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response: NSURLResponse?,data: NSData?,error: NSError?)-> Void in
            if(data != nil){
                let imgTmp = UIImage(data: data!)
                self.imageCache[imgUrl] = imgTmp
                foodImg.image = imgTmp
                foodImg.alpha = 1.0
                
            }
        })

        self.addSubview(foodImg)
        
        //标题
        let foodTitle = UILabel()
        foodTitle.frame = CGRectMake(foodImg.frame.maxX+10, 10, 80, 30)
        foodTitle.text = self.foodInfo?.recipe_title
        self.addSubview(foodTitle)
        
        //详情
        let foodContents = UILabel()
        foodContents.frame = CGRectMake(foodImg.frame.maxX+10, foodTitle.frame.maxY+10, UIScreen.mainScreen().bounds.width-foodImg.frame.maxX-50, self.bounds.height-10-foodTitle.frame.height-15)
        foodContents.text = self.foodInfo?.recipe_info
        foodContents.font = UIFont.systemFontOfSize(12)
        foodContents.numberOfLines = 2
        self.addSubview(foodContents)
        
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        //加载子视图
        loadSubviews()
        
    }

}
