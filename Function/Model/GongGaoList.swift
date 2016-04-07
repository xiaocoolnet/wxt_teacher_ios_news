//
//  GongGaoList.swift
//  WXT_Teacher
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import Foundation

class GongGaoList: JSONJoy {
    var objectlist: [GongGaoInfo]
    var count: Int{
        return self.objectlist.count
    }
    
    init(){
        objectlist = Array<GongGaoInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        //        status = decoder["status"].string
        objectlist = Array<GongGaoInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(GongGaoInfo(childs))
        }
    }
    
    func append(list: [GongGaoInfo]){
        self.objectlist = list + self.objectlist
    }
}
class GongGaoInfo: JSONJoy{
    var notice_title:String?
    var notice_content: String?
    var releasename:String?
    var notice_time:String?
    
    init() {
        
    }
    required init(_ decoder: JSONDecoder){
        notice_title = decoder["notice_title"].string
        notice_content = decoder["notice_content"].string
        releasename = decoder["releasename"].string
        notice_time = decoder["notice_time"].string
        
    }
    
}
