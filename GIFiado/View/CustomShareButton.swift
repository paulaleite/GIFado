//
//  CustomShareButton.swift
//  GIFiado
//
//  Created by Paula Leite on 16/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import UIKit

class CustomShareButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    func setupButton() {
        styleButton()
    }
    
    private func setShadow() {
        layer.shadowOpacity = 6
        layer.shadowRadius = 4
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 3, height: 3)
    }
    
    private func styleButton() {
        setShadow()
        backgroundColor = .white
        layer.cornerRadius = 10
        
    }
    
}
