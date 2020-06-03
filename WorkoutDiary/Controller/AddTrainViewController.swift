//
//  AddTrainViewController.swift
//  WorkoutDiary
//
//  Created by Igor Aryslanov on 21.05.2020.
//  Copyright © 2020 Igor Aryslanov. All rights reserved.
//

import UIKit

class AddTrainViewController: UIViewController {
    
    weak var delegate: HistoryTrainsViewControllerDelegate?
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var kindOfTrainTextField: UITextField!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
        view.backgroundColor = #colorLiteral(red: 0.8980392157, green: 1, blue: 1, alpha: 1)
    }
    
    func createDatePicker() {
        
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
