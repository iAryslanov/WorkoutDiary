//
//  ViewController.swift
//  WorkoutDiary
//
//  Created by Igor Aryslanov on 15.04.2020.
//  Copyright © 2020 Igor Aryslanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var train = ["Initial (first) train",
                 "Second train",
                 "Third train",
                 "Fourth train",
                 "Fifth train",
                 "Sixth train"]
    
    @IBOutlet private weak var tableView: UITableView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = #colorLiteral(red: 0.8980392157, green: 1, blue: 1, alpha: 1)
        
// TODO:       view.backgroundColor = .systemTeal
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.337254902, green: 0.7803921569, blue: 0.9803921569, alpha: 1)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ImageTableCell", bundle: nil), forCellReuseIdentifier: "imageCell")
        //        tableView.register(ImageTableCell.self, forCellReuseIdentifier: "imageCell")
        
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {

    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return train.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath)
        cell.textLabel?.text = train[indexPath.row]
        
//        print("\(#function) \(indexPath.row)")
        return cell
    }

    
    // MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

}
