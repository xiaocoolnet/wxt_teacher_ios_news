//
//  HuoDongList.swift
//  WXT_Teacher
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import Foundation


class HuoDongList: JSONJoy {
    var objectlist: [HuoDongInfo]
    var count: Int{
        return self.objectlist.count
    }
    
    init(){
        objectlist = Array<HuoDongInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        //        status = decoder["status"].string
        objectlist = Array<HuoDongInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(HuoDongInfo(childs))
        }
    }
    
    func append(list: [HuoDongInfo]){
        self.objectlist = list + self.objectlist
    }
}
class HuoDongInfo: JSONJoy{
    var activity_title:String?
    var activity_content: String?
    var releasename:String?
    var activity_pic:String?
    var activity_time:String?
    
    init() {
        
    }
    required init(_ decoder: JSONDecoder){
        activity_title = decoder["activity_title"].string
        activity_content = decoder["activity_content"].string
        releasename = decoder["releasename"].string
        activity_pic = decoder["activity_pic"].string
        activity_time = decoder["activity_time"].string
        
    }
    
}
