//
//  AddTrainViewController.swift
//  WorkoutDiary
//
//  Created by Igor Aryslanov on 21.05.2020.
//  Copyright © 2020 Igor Aryslanov. All rights reserved.
//

import UIKit

class AddTrainViewController: UIViewController {
    
    let kindOfTrain = ["Technical", "General Physical Preparation", "Climbing Wall"]
        
    weak var delegate: HistoryTrainsViewControllerDelegate?
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var kindOfTrainTextField: UITextField!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
        createKindPickerView()
        view.backgroundColor = #colorLiteral(red: 0.8980392157, green: 1, blue: 1, alpha: 1)
    }
    
    func createDatePicker() {
        dateTextField.placeholder = "Date of train"
        // Assign date picker to the text field.
        dateTextField.inputView = datePicker
        dateTextField.textAlignment = .center
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        datePicker.setValue(#colorLiteral(red: 0, green: 0.714789927, blue: 0.9387854934, alpha: 1), forKeyPath: "textColor")
        
        let localeID =  Locale.preferredLanguages.first
        datePicker.locale = Locale(identifier: localeID!)
        
        // Config format of date.
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "dd MMMM yyyy"
        
        dateTextField.text = formatter.string(from: datePicker.date)
        
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        
        let minDate = Calendar.current.date(byAdding: .year, value: -10, to: Date())
        let maxDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())
        datePicker.minimumDate = minDate
        datePicker.maximumDate = maxDate
        
        // Dismiss datePicker or kindPicker.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDone))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    func dateChanged() {
        getDateFromPicker()
    }
    
    @objc
    func tapGestureDone() {
        view.endEditing(true)
    }
    
    // Config format of date.
    func getDateFromPicker() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "dd MMMM yyyy"
        dateTextField.text = formatter.string(from: datePicker.date)
    }
    
    func createKindPickerView() {
        kindOfTrainTextField.placeholder = "Kind of train"
        
        let kindPickerView = UIPickerView()
        kindPickerView.dataSource = self
        kindPickerView.delegate = self
        
        // Assign picker view to the text field.
        kindOfTrainTextField.inputView = kindPickerView
        
        kindOfTrainTextField.textAlignment = .center
        
        // Customisation.
        kindPickerView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @objc
    func kindDonePressed() {
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func saveButton(_ sender: UIButton) {
        if dateTextField.text!.count > 0 && kindOfTrainTextField.text!.count > 0 {
            let train = Train(dateOfTrain: dateTextField.text ?? "Invalid date.",
                              kindOfTrain: kindOfTrainTextField.text ?? "Invalid kind of train.")
            
            delegate?.update(train)
        }
        
        // MARK: - Navigation
        self.dismiss(animated: true, completion: nil)
    }
}

extension AddTrainViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: Picker View Data Source -
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        kindOfTrain.count
    }
    
    // MARK: Picker View Delegate -
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return kindOfTrain[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerViewLabel = UILabel()
        
        if let currentLabel = view as? UILabel {
            pickerViewLabel = currentLabel
        } else {
            pickerViewLabel = UILabel()
        }

        pickerViewLabel.backgroundColor = #colorLiteral(red: 0.8996260762, green: 0.9990888238, blue: 1, alpha: 1)
        pickerViewLabel.textColor = #colorLiteral(red: 0.3364223838, green: 0.7810961604, blue: 0.9801357388, alpha: 1)
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.font = UIFont(name: "Noteworthy", size: 20)
        pickerViewLabel.text = kindOfTrain[row]
        
        return pickerViewLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        kindOfTrainTextField.text = kindOfTrain[row]
    }
}
