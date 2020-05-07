//
//  ImageTableCell.swift
//  WorkoutDiary
//
//  Created by Igor Aryslanov on 21.04.2020.
//  Copyright © 2020 Igor Aryslanov. All rights reserved.
//

import UIKit

class ImageTableCell: UITableViewCell {

    @IBOutlet weak var customImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customImageView.image = UIImage(named: "customImage")
        customImageView.contentMode = .scaleAspectFill
        
    }
    
}
