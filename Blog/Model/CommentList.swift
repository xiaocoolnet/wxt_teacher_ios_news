//
//  CommentList.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/4.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import Foundation
class CommentList: JSONJoy {
    var PingLunlist: [PingLun]
    var count: Int{
        return self.PingLunlist.count
    }
    
    init(){
        PingLunlist = Array<PingLun>()
    }
    required init(_ decoder: JSONDecoder) {
        //        status = decoder["status"].string
        PingLunlist = Array<PingLun>()
        for childs: JSONDecoder in decoder.array!{
            PingLunlist.append(PingLun(childs))
        }
    }
    
    func append(list: [PingLun]){
        self.PingLunlist = list + self.PingLunlist
    }
}
class PingLun: JSONJoy{
    var pingLunUid:String?
    var userName:String?
    var content:String?
    init() {
        
    }
    required init(_ decoder: JSONDecoder){
        pingLunUid = decoder["userid"].string
        userName = decoder["name"].string
        content = decoder["comment_content"].string
    }
    
}
