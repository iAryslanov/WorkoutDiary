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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.8980392157, green: 1, blue: 1, alpha: 1)
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
