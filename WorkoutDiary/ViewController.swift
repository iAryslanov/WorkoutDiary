//
//  ViewController.swift
//  WorkoutDiary
//
//  Created by Igor Aryslanov on 15.04.2020.
//  Copyright © 2020 Igor Aryslanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var trains = ["Initial train"]

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ImageTableCell", bundle: nil), forCellReuseIdentifier: "imageCell")
//        tableView.register(ImageTableCell.self, forCellReuseIdentifier: "imageCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.8980392157, green: 1, blue: 1, alpha: 1)
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.337254902, green: 0.7803921569, blue: 0.9803921569, alpha: 1)
    }


}


extension ViewController: UITableViewDataSource, UITableViewDelegate {

    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trains.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath)
        cell.textLabel?.text = trains[indexPath.row]
//        print("\(#function) \(indexPath.row)")
        return cell
    }

}
