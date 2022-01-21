//
//  ViewController.swift
//  Prework
//
//  Created by Chen Hanrui on 2022/1/13.
//
import SwiftUI
import UIKit

class ViewController: UIViewController {
    
    var labelColor: UIColor?
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipAmountLabel.textColor = labelColor
        
        var lastend : Date
        var interval : Double
        //Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
        let value = UserDefaults.standard.string(forKey: "lastBill")
        
        if UserDefaults.standard.object(forKey: "appClosedTime") != nil{
            lastend = UserDefaults.standard.object(forKey: "appClosedTime") as! Date
            interval = NSDate.now.timeIntervalSince(lastend)
            print("app restart interval: \(interval)")
            if value != nil, interval<=600{
                billAmountTextField.text = value
            }else{
                billAmountTextField.text = "$0.00"
            }
        }else{
            billAmountTextField.text = "$0.00"
        }
        UserDefaults.standard.set(NSDate.now, forKey: "appClosedTime")
        //check if it's correct
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        print("app last close: \(formatter.string(from: UserDefaults.standard.object(forKey: "appClosedTime") as! Date))")
        
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        //print("view will appear")
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
//        UserDefaults.standard.set(NSDate.now, forKey: "appOpenedTime")
//        let start : Date = UserDefaults.standard.object(forKey: "appClosedTime") as! Date
//        let interval = start.timeIntervalSince(UserDefaults.standard.object(forKey: "appClosedTime") as! Date)
//        UserDefaults.standard.set(interval, forKey: "timeInterval")
//        let formatter = DateFormatter()
//        formatter.timeStyle = .medium
//        print("app open: \(formatter.string(from: UserDefaults.standard.object(forKey: "appOpenedTime") as! Date))")
        //print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        //print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated:Bool){
        super.viewDidAppear(animated)
//        UserDefaults.standard.set(NSDate.now, forKey: "appClosedTime")
//        let formatter = DateFormatter()
//        formatter.timeStyle = .medium
//        print("app close: \(formatter.string(from: UserDefaults.standard.object(forKey: "appClosedTime") as! Date))")
        //print("view did disappear")
    }
    
    
    
    @IBAction func calculateTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(billAmountTextField.text, forKey: "lastBill")
        
        let bill = Double(billAmountTextField.text!) ?? 0
        UserDefaults.standard.set(bill, forKey: "lastBill")
        
        //Get Total tip by multiplying tip * tip percentage
        let tipPercentage = [0.15, 0.18, 0.20]
        
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = tip + bill
        
        //Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func nightMode(){
        view.backgroundColor = .black
        view.tintColor = .white
        //AppearanceSection.textColor = UIColor.black
        //nightMode.textColor = UIColor.white
        //nightModeImage.image = UIImage(imageLiteralResourceName: "dayMode")
        //nightModeImage.backgroundColor = .white
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = .black
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }

    
}
