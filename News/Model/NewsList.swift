//
//  NewsList.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/7.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//
import Foundation
class NewsList: JSONJoy {
    var objectlist: [NewsInfo]
    var count: Int{
        return self.objectlist.count
    }
    init(){
        objectlist = Array<NewsInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        //status = decoder["status"].string
        objectlist = Array<NewsInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(NewsInfo(childs))
        }
    }
    func append(list: [NewsInfo]){
        self.objectlist = list + self.objectlist
    }
}
class NewsInfo: JSONJoy{
    var sendName:String?
    var send_user_id: String?
    var reciverName:String?
    var reciver_id:String?
    var message_time:String?
    var message_content:String?
    init() {
        
    }
    required init(_ decoder: JSONDecoder){
        print("begin decoder")
        print(decoder["send_user_name"].string)
        print(decoder["send_user_id"].string)
        print(decoder["receive_user_name"].string)
        print(decoder["receive_user_id"].string)
        print("-------------------------------")
        sendName = decoder["send_user_name"].string
        send_user_id = decoder["send_user_id"].string
        message_time = decoder["message_time"].string
        message_content = decoder["message_content"].string
        reciver_id=decoder["receive_user_id"].string
        reciverName = decoder["receive_user_name"].string
    }
}
