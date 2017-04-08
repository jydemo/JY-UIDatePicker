//
//  ViewController.swift
//  JY-UIDatePicker
//
//  Created by atom on 2017/3/28.
//  Copyright © 2017年 atom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let fullScreenSize = UIScreen.main.bounds.size
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(myLabel)
        
        self.view.addSubview(myDatePicker)
    }
    
    private lazy var myDatePicker: UIDatePicker = { [unowned self] in
        let myDatePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: self.fullScreenSize.width, height: 300))
        //设置picker格式
        myDatePicker.datePickerMode = .dateAndTime
        //选取时间间隔 以15分钟为一个时间间隔
        myDatePicker.minuteInterval = 15
        //设置预设时间为现在时间
        myDatePicker.date = Date()
        //设置date的格式
        let formatter = DateFormatter()
        //设置展示的时间格式
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let fromDateTime = formatter.date(from: "2017-01-18 18:08")
        let endDateTime = formatter.date(from: "2018-12-25 18:08")
        
        //可以选择的最早日期时间
        //myDatePicker.miniumDate = fromDateTime
        myDatePicker.minimumDate = fromDateTime
        //可以选择最晚的时间日期
        
        myDatePicker.maximumDate = endDateTime
        //设置语言
        myDatePicker.locale = Locale(identifier: "zh_CN")
        //选择时间 执行的动作
        myDatePicker.addTarget(self, action: #selector(datePickerChanged(datePicker:)), for: .valueChanged)
        //设置中心点
        myDatePicker.center = CGPoint(x: self.fullScreenSize.width * 0.5, y: self.fullScreenSize.height * 0.5)
        return myDatePicker
    }()
    private lazy var myLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.fullScreenSize.width, height: 50))
        label.backgroundColor = UIColor.lightGray
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.center = CGPoint(x: self.fullScreenSize.width * 0.5, y: self.fullScreenSize.height * 0.15)
        return label
    }()
    
    @objc private func datePickerChanged(datePicker: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        myLabel.text = formatter.string(from: datePicker.date)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

