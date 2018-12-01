//
//  todayViewController.swift
//  CheckDiary
//
//  Created by Lisa  on 2018/12/01.
//  Copyright © 2018年 Tomoyuki Hayakawa. All rights reserved.
//

import UIKit

class todayViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var contentTextView: UITextView!
    
    var saveData : UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func savememo() {
        //user defultsに書き込み
        saveData.set (contentTextView.text, fotKey: "title")
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
