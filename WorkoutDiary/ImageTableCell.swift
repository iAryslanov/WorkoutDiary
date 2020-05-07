//
//  ImageTableCell.swift
//  WorkoutDiary
//
//  Created by Igor Aryslanov on 21.04.2020.
//  Copyright © 2020 Igor Aryslanov. All rights reserved.
//

import UIKit

class ImageTableCell: UITableViewCell {

    @IBOutlet private weak var customImageView: UIImageView!
    
    @IBOutlet private weak var customCellBackgroundImageView: UIImageView!
    
//    func configure(with: [String]) -> String {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: IndexPath)
//        cell.textLabel?.text = with[IndexPath.row]
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        // TODO: Constraints in code.
        
//        customCellBackgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
//        customCellBackgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
//        customCellBackgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 400).isActive = true
//        customCellBackgroundImageView.heightAnchor.constraint(equalToConstant: frame.width / 2).isActive = true
//        customCellBackgroundImageView.topAnchor.constraint(equalTo: , constant: 0).isActive = true
        
        customImageView.image = UIImage(named: "customImage")
        customImageView.contentMode = .scaleAspectFill
        customImageView.layer.cornerRadius = 15

    }
}
