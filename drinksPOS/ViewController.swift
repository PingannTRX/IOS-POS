//
//  ViewController.swift
//  drinksPOS
//
//  Created by S10413 on 2019/1/24.
//  Copyright © 2019年 S10413. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource  {
    @IBOutlet weak var itemPicker: UIPickerView!
    @IBOutlet weak var txtAmount: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var sugerSegment: UISegmentedControl!
    @IBOutlet weak var iceSegment: UISegmentedControl!
    @IBOutlet weak var txtvItem: UITextField!
    @IBOutlet weak var txtvIngre: UITextField!
    @IBOutlet weak var txtvAmount: UITextField!
    @IBOutlet weak var txtvSuger: UITextField!
    @IBOutlet weak var txtvIce: UITextField!
    @IBOutlet weak var imgGreen: UIImageView!
    @IBOutlet weak var imgWinter: UIImageView!
    @IBOutlet weak var imgMilk: UIImageView!
    @IBOutlet weak var imgLemon: UIImageView!
    @IBOutlet weak var imgBlack: UIImageView!
    @IBOutlet weak var txtSPrice: UITextField!
    @IBOutlet weak var btnCart: UIButton!
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var itemUnitPrice: Int = 0
    var ingrePrice: Int = 0
    var amount: Int = 0
    var sPrice: Int = 0
    var arrayItem: [String] = [String]()
    var arrayIngre: [String] = [String]()
    @IBAction func txtAmount_DidEndOnExit(_ sender: Any) {
    //收鍵盤
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.txtAmount.resignFirstResponder()  //收鍵盤
    }
    
    @IBAction func sugerSegment_ValueChanged(_ sender: Any) {
        let selectedSuger: Int = self.sugerSegment.selectedSegmentIndex
        if selectedSuger == 0 {txtvSuger.text = "無糖"}
        else if selectedSuger == 1 {txtvSuger.text = "微糖"}
        else if selectedSuger == 2 {txtvSuger.text = "半糖"}
        else if selectedSuger == 3 {txtvSuger.text = "少糖"}
        else if selectedSuger == 4 {txtvSuger.text = "全糖"}
    }
    
    @IBAction func iceSegment_ValueChanged(_ sender: Any) {
        let selectedIce: Int = self.iceSegment.selectedSegmentIndex
        if selectedIce == 0 {txtvIce.text = "溫"}
        else if selectedIce == 1 {txtvIce.text = "去冰"}
        else if selectedIce == 2 {txtvIce.text = "少冰"}
        else if selectedIce == 3 {txtvIce.text = "半冰"}
        else if selectedIce == 4 {txtvIce.text = "正常冰"}
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        var intRowNum: Int = 0
        if component == 0 {
            intRowNum = arrayItem.count
        } else if component == 1 {
            intRowNum = arrayIngre.count
        }
        return intRowNum
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var strRow: String = ""
        if component == 0 {
            strRow = arrayItem[row]
        } else if component == 1 {
            strRow = arrayIngre[row]
        }
        return strRow
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            if row == 0 {
                txtvItem.text = ""
                txtPrice.text = ""
                itemUnitPrice = 0
                imgBlack.isHidden = true
                imgMilk.isHidden = true
                imgGreen.isHidden = true
                imgLemon.isHidden = true
                imgWinter.isHidden = true
               }
            else if row == 1 {
                    txtvItem.text = arrayItem[row]
                    txtPrice.text = " $NT25"
                    itemUnitPrice = 25
                    imgBlack.isHidden = false
                    imgMilk.isHidden = true
                    imgGreen.isHidden = true
                    imgLemon.isHidden = true
                    imgWinter.isHidden = true
                    
                }
                 else if row == 2 {
                    txtPrice.text = " $NT25"
                    txtvItem.text = arrayItem[row]
                    itemUnitPrice = 25
                    imgGreen.isHidden = false
                    imgMilk.isHidden = true
                    imgBlack.isHidden = true
                    imgLemon.isHidden = true
                    imgWinter.isHidden = true
                    
                }
                 else if row == 3 {
                txtvItem.text = arrayItem[row]
                txtPrice.text = " $NT35"
                    itemUnitPrice = 35
                    imgMilk.isHidden = false
                    imgBlack.isHidden = true
                    imgGreen.isHidden = true
                    imgLemon.isHidden = true
                    imgWinter.isHidden = true
                   
                }
                 else if row == 4 {
                txtvItem.text = arrayItem[row]
                txtPrice.text = " $NT40"
                    itemUnitPrice = 40
                    imgLemon.isHidden = false
                    imgMilk.isHidden = true
                    imgGreen.isHidden = true
                    imgBlack.isHidden = true
                    imgWinter.isHidden = true
                
                }
                 else if row == 5 {
                txtvItem.text = arrayItem[row]
                txtPrice.text = " $NT30"
                itemUnitPrice = 30
                    imgWinter.isHidden = false
                    imgMilk.isHidden = true
                    imgGreen.isHidden = true
                    imgLemon.isHidden = true
                    imgBlack.isHidden = true
                }
            calculate()
        }
        
        else if component == 1 {
            if row == 0 {txtvIngre.text = ""
            }
            else{
            txtvIngre.text = arrayIngre[row]
            }
            calculate()
        }
    }

    @IBAction func txtAmount_EditingDidEnd(_ sender: Any) {
        if Int(txtAmount.text!)! <= 99 {
        txtvAmount.text = "\(txtAmount.text ?? "0")杯"
        amount = Int(txtAmount.text!) ?? 0
        calculate()
        }
        else{
            let myAlertController = UIAlertController(title:"Oops!",message:"杯數請勿超過99杯", preferredStyle:UIAlertController.Style.actionSheet)
            let okAction = UIAlertAction(title:"確認",style: UIAlertAction.Style.destructive, handler: {
                (action) -> Void in
            })
            myAlertController.addAction(okAction)
            self.present(myAlertController, animated: true, completion: nil)
            txtAmount.text = ""
            txtvAmount.text = ""
            amount = Int(txtAmount.text!) ?? 0
            calculate()
        }
    }
    
    @objc func calculate(){
        if txtvIngre.text != ""
        {ingrePrice = 10}
        else {ingrePrice = 0}
        sPrice = (itemUnitPrice+ingrePrice)*amount
        txtSPrice.text = " $NT \(sPrice)"
    }

    @IBAction func btnCart_Click(_ sender: Any) {
        if txtvItem.text == "" || txtvAmount.text == "" || txtvAmount.text == "0杯" || txtvIce.text == "" || txtvSuger.text == ""
        {
            let myAlertController = UIAlertController(title:"Oops!",message:"品項、杯數、甜度、冰塊不可空白", preferredStyle:UIAlertController.Style.actionSheet)
            let okAction = UIAlertAction(title:"確認",style: UIAlertAction.Style.destructive, handler: {
                (action) -> Void in
            })
            myAlertController.addAction(okAction)
            self.present(myAlertController, animated: true, completion: nil)
        }
        else {
            appDelegate.UnitDetail += " 品項:\(txtvItem.text!)\t 數量:\(txtvAmount.text!)\n 配料:\(txtvIngre.text!)\t 甜度:\(txtvSuger.text!)\n 冰塊:\(txtvIce.text!)\t 小計:\(txtSPrice.text!)\n-------------------------------\n"
            appDelegate.TotalPrice += sPrice
            let myAlertController = UIAlertController(title:"成功",message:"已加入購物明細", preferredStyle:UIAlertController.Style.actionSheet)
            let okAction = UIAlertAction(title:"確認",style: UIAlertAction.Style.destructive, handler: {
                (action) -> Void in
            })
            myAlertController.addAction(okAction)
            self.present(myAlertController, animated: true, completion: nil)
        }
        
    }
    
        

    override func viewDidLoad() {
        super.viewDidLoad()

        self.itemPicker.delegate = self
        self.itemPicker.dataSource = self
        
        arrayItem = ["請選擇飲品","紅茶","綠茶","奶茶","檸檬汁","冬瓜茶"]
        arrayIngre = ["請選擇配料","珍珠$10","波霸$10","寒天$10","愛玉$10"]
        
         
        
    }


}

