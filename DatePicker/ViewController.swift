	//
//  ViewController.swift
//  DatePicker
//
//  Created by Bryn Beaudry on 2017-09-22.
//  Copyright © 2017 Bryn Beaudry. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController {

    var	PickedDateString : String = ""
    var PickedDate : Date = Date()
    var Now : Date = Date()
    let dateFmt = DateFormatter()

    
    @IBOutlet weak var CurrentDate: UITextView!
    
    @IBOutlet weak var DatePickOutlet: UIDatePicker!
    
    @IBAction func DateChange(_ sender: UIDatePicker) {
        dateFmt.dateStyle = DateFormatter.Style.short
        dateFmt.timeStyle = DateFormatter.Style.short
        
        
        
        let strDate = dateFmt.string(from: sender.date)
        PickedDateString = strDate
        PickedDate = sender.date
        let seconds = PickedDate.timeIntervalSinceNow
        Difference.text = secondsToDays(seconds: seconds)
        
        
    }
    
    func secondsToDays (seconds : Double) -> (String){
        var days = (seconds / 86400)
        days = days.rounded(.up)
        return String(format: "%.0f Days", days)
    }
    
    @IBOutlet weak var Difference: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let TV_dtfm = DateFormatter()
        TV_dtfm.dateStyle = DateFormatter.Style.medium
        CurrentDate.text = TV_dtfm.string(from: Now)
        Difference.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

