//
//  HistoryTrainsViewControllerDelegate.swift
//  WorkoutDiary
//
//  Created by Igor Aryslanov on 15.04.2020.
//  Copyright © 2020 Igor Aryslanov. All rights reserved.
//

import UIKit

protocol HistoryTrainsViewControllerDelegate: class {
    func update(_ train: Train)
}

class HistoryTrainsViewController: UIViewController {
    
    private var trains: [Train] = Train.loadTrain() {
        didSet {
            Train.save(trains) // Save in UserDefaults.
        }
    }
    
    @IBOutlet weak private var trainsTableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    // MARK: - Navigation
    @IBAction func goToAddTrainViewController(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: Constants.mainStoryboardID, bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: Constants.addTrainViewControllerID) as? AddTrainViewController else { return }
        
        vc.delegate = self // Delegate to transfer data from the AddTrainViewController.
        
        self.present(vc, animated: true) // Show modal.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trainsTableView.tableFooterView = UIView() // Removes lines in a TableView without cells below.
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.337254902, green: 0.7803921569, blue: 0.9803921569, alpha: 1)
        trainsTableView.backgroundColor = #colorLiteral(red: 0.8980392157, green: 1, blue: 1, alpha: 1)
        
        
        trainsTableView.dataSource = self
        trainsTableView.delegate = self
        
        
        trainsTableView.register(UINib(nibName: "TrainTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.trainTableViewCellID)
    }
}

// MARK: - Configure table

extension HistoryTrainsViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trains.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.trainTableViewCellID, for: indexPath) as! TrainTableViewCell
        
        cell.configure(trains[indexPath.row])
        
        return cell
    }
    
    // Editing table cells.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            trains.remove(at: indexPath.row)
            trainsTableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }
    
    // MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension HistoryTrainsViewController: HistoryTrainsViewControllerDelegate {
    func update(_ train: Train) {
        trains.append(train)
        trainsTableView.reloadData()
    }
}
