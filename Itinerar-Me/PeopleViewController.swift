//
//  PeopleViewController.swift
//  Itinerar-Me
//
//  Created by Timothy Mak on 4/17/17.
//  Copyright © 2017 ItinerarMe. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var peopleTextField: UITextField!
    
    // List for drop down menu
    var list = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10+"]
    var numPeople = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.peopleTextField.text = self.list[row]
        
        let number = self.list[row]
        
        if row != 9 {
            numPeople = Int(number)!
        }
        else {
            numPeople = 10
        }
    }
    
    @IBAction func peopleChanged(_ sender: UITextField) {
        print("text field clicked")
        let peoplePicker = UIPickerView()
        peoplePicker.delegate = self
        peoplePicker.dataSource = self
        sender.inputView = peoplePicker
        self.view.addSubview(peoplePicker)
        
    }
    
}
