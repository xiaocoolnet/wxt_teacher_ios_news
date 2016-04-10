//
//  PlanList.swift
//  WXT_Teacher
//
//  Created by xiaocool on 16/4/10.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import Foundation

class PlanList: JSONJoy {
    var objectlist: [planInfo]
    var count: Int{
        return self.objectlist.count
    }
    
    init(){
        objectlist = Array<planInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        //        status = decoder["status"].string
        objectlist = Array<planInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(planInfo(childs))
        }
    }
    
    func append(list: [planInfo]){
        self.objectlist = list + self.objectlist
    }
}
class planInfo: JSONJoy{
    var plan_id:Int?
    var plan_title: String?
    var plan_content:String?
    var plan_creat_time:String?
    
    init() {
        
    }
    required init(_ decoder: JSONDecoder){
        plan_id = decoder["id"].integer
        plan_title = decoder["title"].string
        plan_content = decoder["content"].string
        plan_creat_time = decoder["creat_time"].string
        
    }
    
}
