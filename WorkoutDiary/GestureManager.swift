//
//  Gesture.swift
//  WorkoutDiary
//
//  Created by Igor Aryslanov on 02.06.2020.
//  Copyright © 2020 Igor Aryslanov. All rights reserved.
//

import UIKit

class GestureManager: UIGestureRecognizer {
    
}




protocol GestureViewDelegate: class {
    func didTap(_ view: GestureView)
    func didSwipe(_ view: GestureView)
}

class GestureView: UIView {
    
    weak var delegate: GestureViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(GestureView.didTap))
        tapRecognizer.numberOfTapsRequired = 3
        self.addGestureRecognizer(tapRecognizer)
        
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GestureView.didSwipe))
        swipeRecognizer.numberOfTouchesRequired = 2
        swipeRecognizer.direction = .down
        self.addGestureRecognizer(swipeRecognizer)
    }
    
    @objc
    func didTap() -> Void {
        delegate?.didTap(self)
    }
    
    @objc
    func didSwipe() -> Void {
        delegate?.didSwipe(self)
    }
}
