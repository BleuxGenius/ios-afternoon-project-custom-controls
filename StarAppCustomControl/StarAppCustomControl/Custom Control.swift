//
//  Custom Control.swift
//  StarAppCustomControl
//
//  Created by Lambda_School_Loaner_167 on 10/10/19.
//  Copyright © 2019 Dani. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    var labels: [UILabel] = []
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
       
    }
    
//    MARK: - Methods
    
    func setUp() {
        
//         use a loop to create 5 labels
        for i in 1...componentCount {
//            creating the label
            let label = UILabel()
            label.tag = i
            addSubview(label)
//            turn off the autolayout
            label.translatesAutoresizingMaskIntoConstraints = false
//            constrain the label
            label.heightAnchor.constraint(equalToConstant: componentDimension).isActive = true
            label.widthAnchor.constraint(equalToConstant: componentDimension).isActive = true
            let offset = (40 * (i - 1)) + (8 * 1)
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(offset)).isActive = true
//
            label.font = .boldSystemFont(ofSize: 32)
            label.text = "★"
            label.textAlignment = .center
            label.textColor = i > value ? componentInactiveColor : componentActiveColor
            labels.append(label)
            
        }
        
    }
    
//    informs compiler how how big custom control should be
    override var intrinsicContentSize: CGSize {
        
        let componentWidth = CGFloat(componentCount) * componentDimension
        let componentSpacing = CGFloat(componentCount + 1) * 8
        let width = componentWidth + componentSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    func updateLabels() {
        for i in 1...componentCount {
            labels[i-1].textColor = i > value ? componentInactiveColor : componentActiveColor
        }
    }
}
