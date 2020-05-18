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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customImageView.contentMode = .scaleAspectFill
        customImageView.layer.cornerRadius = 15
    }
}
