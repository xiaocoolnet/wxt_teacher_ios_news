//
//  EditTableViewController.swift
//  WXT_Teacher
//
//  Created by xiaocool on 16/4/5.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import MBProgressHUD
import Alamofire
class EditTableViewController: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,UIAlertViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource {

    
    var data = NSData()
    var hud = MBProgressHUD()
    var headImg = UIImageView()
    var name:String = "王丹"
    var sex:String = "女"
    var phoneNumber:String = "1***3"
    var school:String = "清华幼儿园"
    var classRoom:String = "122-1"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "编辑教师资料"
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.scrollEnabled = false
        //添加保存按钮
        let saveInfo = UIBarButtonItem(title: "保存", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("saveInfo"))
        self.navigationItem.rightBarButtonItem = saveInfo
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = true
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "editCell")
        //设置cell样式
        cell.accessoryType = UITableViewCellAccessoryType.None
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.textLabel?.textAlignment = NSTextAlignment.Left
        //添加分割条
        let separator = UIView()
        var y = 60
        if indexPath.row==0{
            y=100
        }
        separator.frame = CGRectMake(10, CGFloat(y), UIScreen.mainScreen().bounds.width-20, 1)
        separator.backgroundColor = UIColor.grayColor()
        cell.contentView.addSubview(separator)

        //分别显示信息
        if indexPath.row == 0{
            cell.textLabel?.text = "头像"
            //添加头像图片
            if headImg.image==nil {
                headImg.image = UIImage(named: "Logo")
            }
            headImg.frame = CGRectMake(UIScreen.mainScreen().bounds.width-100, 10, 80, 80)
            headImg.layer.cornerRadius = 39
            self.view.addSubview(headImg)
            
        }else{
            //显示信息label
            let label = UILabel()
            label.frame = CGRectMake(UIScreen.mainScreen().bounds.width-170, 10, 150, 40)
//            label.backgroundColor = UIColor.redColor()
            label.textAlignment = NSTextAlignment.Right
            label.textColor = UIColor.grayColor()
            cell.contentView.addSubview(label)
            
            
            if indexPath.row == 1{
                cell.textLabel?.text = "姓名"
                label.text = name
            }
            if indexPath.row == 2{
                cell.textLabel?.text = "性别"
                label.text = sex
            }
           
        
        }
        

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row==0 {
            return 100
        }else{
            return 60
        }
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //分别进行编辑
        if indexPath.row == 0{//头像更换
            self.changeHeadImg()
        }else if indexPath.row == 2{//选择性别
            self.changeSex()
        }else{//编辑其他信息
            self.changeOther(indexPath.row)
        }
        
    }
    
    //MARK: - 更改操作
    //更改头像
    func changeHeadImg() -> Void {
        let actionSheet = UIActionSheet()
        actionSheet.addButtonWithTitle("取消")
        actionSheet.addButtonWithTitle("图库")
        actionSheet.addButtonWithTitle("相机")
        actionSheet.cancelButtonIndex = 0
        actionSheet.delegate = self
        actionSheet.showInView(self.view)
        
    }
    //更改性别
    func changeSex() -> Void {
        let  sexPicker = UIPickerView()
        sexPicker.frame = CGRectMake(0, UIScreen.mainScreen().bounds.height-300, UIScreen.mainScreen().bounds.width, 300)
        sexPicker.delegate = self
        sexPicker.dataSource = self
        sexPicker.showsSelectionIndicator = true
        self.view.addSubview(sexPicker)
        
        //添加工具条
        let toolBar = UIView()
        toolBar.frame = CGRectMake(0, sexPicker.frame.minY-50, sexPicker.frame.width, 50)
        toolBar.backgroundColor = UIColor.blueColor()
        self.view.addSubview(toolBar)
        
        
        
    }
    //更改姓名
    func changeOther(index:Int) -> Void {
    
        let changeVC = EditOtherViewController()
        changeVC.index = index
        changeVC.temp = name
        self.navigationController?.pushViewController(changeVC, animated: true)
        
    }
    
    //MARK: - 代理方法
    //actionSheet代理方法
    //选取
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int){
    
        if buttonIndex == 1 {//图库
            self.GoImage()
        }else if buttonIndex == 2{//相机
            self.GoCamera()
        }

    }
    //取消
    func actionSheetCancel(actionSheet: UIActionSheet) {
        
    }
    //UIImagePickerControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let img = info[UIImagePickerControllerEditedImage] as! UIImage
        if(img.size.width>200 || img.size.height>200)
        {
            data = UIImageJPEGRepresentation(img, 0.1)!
        }
        else
        {
            data = UIImageJPEGRepresentation(img, 0.3)!
        }
        if (data.length>104850)
        {
            self.hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            self.hud.mode = MBProgressHUDMode.Text
            self.hud.margin = 10
            self.hud.removeFromSuperViewOnHide = true
            self.hud.labelText = "图片大于1M，请重新选择"
            self.hud.hide(true, afterDelay: 1)
            return
            
        }
        
        headImg.image = img
        picker.dismissViewControllerAnimated(true, completion: nil)

    }

    
    //pickerview代理方法
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row==0 {
            return "男"
        }else{
            return "女"
        }
    }
   
    //MARK: - 具体实现方法
    //相机
    func GoCamera(){
        var sourceType = UIImagePickerControllerSourceType.Camera
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        let picker = UIImagePickerController()
        //picker.delegate = self
        picker.delegate = self
        picker.allowsEditing = true//设置可编辑
        picker.sourceType = sourceType
        self.presentViewController(picker, animated: true, completion: nil)//进入照相界面
        
    }
    //相册
    func GoImage(){
        let pickerImage = UIImagePickerController()
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            pickerImage.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            pickerImage.mediaTypes = UIImagePickerController.availableMediaTypesForSourceType(pickerImage.sourceType)!
        }
        pickerImage.delegate = self
        pickerImage.allowsEditing = true
        self.presentViewController(pickerImage, animated: true, completion: nil)
        
    }
    
    //MARK: - 保存信息并上传
    func saveInfo() -> Void {
        let url = "http://www.xiaocool.cn:8016/index.php?g=apps&m=teacher&a=saveinfo"
        
        let sexNub = 0
        
        let parameters = [
          
            "teacherid" : 30,
            "teachername" : name,
            "sex" : sexNub,
            "picurl" : data
            
        
        ]
        
        Alamofire.request(.POST, url, parameters: parameters).responseJSON{response in
            print("上传结果")
            print(response.result)
            if response.result.isSuccess{
            
                let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                hud.mode = MBProgressHUDMode.Text;
                hud.labelText = "保存资料成功！"
                hud.margin = 10.0
                hud.removeFromSuperViewOnHide = true
                hud.hide(true, afterDelay: 1)

            
            }
        
        
        }
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
