//
//  ViewController.swift
//  UIDatePicker
//
//  Created by Evgeniy Poznyak on 6/6/20.
//  Copyright © 2020 Evgeniy Poznyak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var favoriteDayTextField: UITextField!
    
    @IBOutlet weak var resultText: UITextField!
    
    let days = ["Monday",
                "Tuesday",
                "Wednesday",
                "Thursday",
                "Friday",
                "Saturday",
                "Sunday"]
    
    var selectedDay: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDayPicker()
        createToolbar()
    }
    
    
    func createDayPicker() {
        
        let dayPicker = UIPickerView()
        dayPicker.delegate = self
        
        favoriteDayTextField.inputView = dayPicker
        
        //Customizations
        dayPicker.backgroundColor = .black
    }
    
    
    func createToolbar() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //Customizations
        toolBar.barTintColor = .black
        toolBar.tintColor = .white
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        favoriteDayTextField.inputAccessoryView = toolBar
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}



extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return days.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return days[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedDay = days[row]
        resultText.text = selectedDay
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textColor = .green
        label.textAlignment = .center
        label.font = UIFont(name: "Menlo-Regular", size: 17)
        
        label.text = days[row]
        
        return label
    }
    
    
}
