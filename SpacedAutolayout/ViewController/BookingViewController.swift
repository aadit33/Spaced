//
//  BookingViewController.swift
//  SpacedAutolayout
//
//  Created by Chandrakant Naik on 30/03/21.
//

import UIKit

class BookingViewController: UIViewController {
    
    @IBOutlet weak var lblPlanetName: UILabel!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var txtSourceAddress: UITextField!
    @IBOutlet weak var txtFromDate: UITextField!
    @IBOutlet weak var txtToDate: UITextField!
    @IBOutlet weak var txtNoOfPassengers: UITextField!
    @IBOutlet weak var btnContinue: UIButton!
    
    let pickerView = UIPickerView()
    var currentTextField = UITextField()
    var datePicker = UIDatePicker()
    
    var fromAddressList = ["JFK, New YorK, U.S.A", "IGN, Mumbai, India", "KMP, Singapore, Malaysia"]
    var noOfPassenger = ["1", "2", "3", "4", "5"]
    
    //MARK: - VC methods
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerViews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        btnContinue.applyGradient(colors: [Utilities.hexStringToUIColor("104494").cgColor, Utilities.hexStringToUIColor("66D9EF").cgColor])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        applyGradients()
    }
    
    func createPickerViews() {
        // fromAddressPickerView()
    }
    
    func fromAddressPickerView() {
        
        txtSourceAddress.inputView = pickerView
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar(frame:CGRect(x:0, y:0, width:100, height:100))
        toolBar.sizeToFit()
        
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.donAction))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        txtSourceAddress.inputAccessoryView = toolBar
        txtNoOfPassengers.inputAccessoryView = toolBar
    }
    
    func applyGradients() {
        txtSourceAddress.applyGradient(colors: [Utilities.hexStringToUIColor("104494").cgColor, Utilities.hexStringToUIColor("66D9EF").cgColor])
        txtFromDate.applyGradient(colors: [Utilities.hexStringToUIColor("104494").cgColor, Utilities.hexStringToUIColor("66D9EF").cgColor])
        txtToDate.applyGradient(colors: [Utilities.hexStringToUIColor("104494").cgColor, Utilities.hexStringToUIColor("66D9EF").cgColor])
        txtNoOfPassengers.applyGradient(colors: [Utilities.hexStringToUIColor("104494").cgColor, Utilities.hexStringToUIColor("66D9EF").cgColor])
    }
    
    func showDatePicker() {
        //Formate Date
        txtFromDate.inputView = datePicker
        txtToDate.inputView = datePicker
        datePicker.preferredDatePickerStyle = .wheels

        //ToolBar
        let toolbar = UIToolbar(frame:CGRect(x:0, y:0, width:100, height:100))
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
     //   let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,cancelButton], animated: true)
        
        txtFromDate.inputAccessoryView = toolbar
        txtToDate.inputAccessoryView = toolbar
        datePicker.datePickerMode = .date

    }
    
    //MARK: - Selector actions
    @objc func donAction() {
        view.endEditing(true)
    }
    
    @objc func donedatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        txtFromDate.text = formatter.string(from: datePicker.date)
        txtToDate.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker() {
        self.view.endEditing(true)
    }
}

//MARK: - PICKERVIEW DELEGATES & DATA SOURCE
extension BookingViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if currentTextField == txtSourceAddress {
            return self.fromAddressList.count
        } else {
            return self.noOfPassenger.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if currentTextField == txtSourceAddress {
            return self.fromAddressList[row]
        } else {
            return self.noOfPassenger[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if currentTextField == txtSourceAddress {
            self.txtSourceAddress.text = self.fromAddressList[row]
        } else {
            self.txtNoOfPassengers.text = self.noOfPassenger[row]
        }
    }
}

//MARK: - TEXTFIELD DELEGATE
extension BookingViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == txtFromDate || textField == txtToDate {
            showDatePicker()
        } else {
            self.pickerView.delegate = self
            self.pickerView.dataSource = self
            currentTextField = textField
            
            if currentTextField == txtSourceAddress {
                currentTextField.inputView = pickerView
            } else {
                currentTextField.inputView = pickerView
            }
            dismissPickerView()
        }
    }
}
