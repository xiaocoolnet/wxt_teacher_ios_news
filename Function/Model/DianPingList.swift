//
//  DianPingList.swift
//  WXT_Teacher
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import Foundation


class DianPingList: JSONJoy {
    var objectlist: [DianPingInfo]
    var count: Int{
        return self.objectlist.count
    }
    
    init(){
        objectlist = Array<DianPingInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        //        status = decoder["status"].string
        objectlist = Array<DianPingInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(DianPingInfo(childs))
        }
    }
    
    func append(list: [DianPingInfo]){
        self.objectlist = list + self.objectlist
    }
}
class DianPingInfo: JSONJoy{
    var name:String?
    var comment_content: String?
    var comment_time:String?
    init() {
        
    }
    required init(_ decoder: JSONDecoder){
        name = decoder["name"].string
        comment_content = decoder["comment_content"].string
        comment_time = decoder["comment_time"].string
    }
    
}
