//
//  ViewControllerDetail.swift
//  drinksPOS
//
//  Created by S10413 on 2019/1/24.
//  Copyright © 2019年 S10413. All rights reserved.
//

import UIKit

class ViewControllerDetail: UIViewController {
    
    
    
    @IBOutlet weak var txtDetail: UITextView!
    @IBOutlet weak var lblTotal: UILabel!
     let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var btnDelete: UIButton!
    @IBAction func btnDelete_Click(_ sender: Any) {
        appDelegate.UnitDetail.removeAll()
        appDelegate.TotalPrice = 0
        lblTotal.text = " $NT"
        txtDetail.text = "盡情訂購吧！"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtDetail.text =  appDelegate.UnitDetail
        lblTotal.text = " $NT \(appDelegate.TotalPrice)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
