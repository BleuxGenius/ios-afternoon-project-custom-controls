//
//  Custom Control.swift
//  StarAppCustomControl
//
//  Created by Lambda_School_Loaner_167 on 10/10/19.
//  Copyright © 2019 Dani. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1 { didSet { updateLabels() } }
    var stars: [UILabel] = []
    
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
        
        //use a loop to create 5 labels
        for i in 1...componentCount {
            //creating the label
            let star = UILabel()
            star.tag = i
            addSubview(star)
//            turn off the autolayout
            star.translatesAutoresizingMaskIntoConstraints = false
//            constrain the label
            star.heightAnchor.constraint(equalToConstant: componentDimension).isActive = true
            star.widthAnchor.constraint(equalToConstant: componentDimension).isActive = true
            let offset = (40 * (i + 1)) + (8 * 1)
            star.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(offset)).isActive = true
            star.font = .boldSystemFont(ofSize: 32)
            star.text = "★"
            star.textAlignment = .center
            star.textColor = i > value ? componentInactiveColor : componentActiveColor
            stars.append(star)
        }
        
    }
    
//    informs compiler how how big custom control should be
    override var intrinsicContentSize: CGSize {
        
        let componentWidth = CGFloat(componentCount) * componentDimension
        let componentSpacing = CGFloat(componentCount + 1) * 8
        let width = componentWidth + componentSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
//    MARK: - Touch Methods
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: .touchDragInside)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        
        guard let touch = touch else {return}
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragOutside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchUpOutside)
        return
    }
//MARK: - Skeleton Methods
    
    func updateValue(at touch: UITouch) {
        for label in stars {
        let touchPoint = touch.location(in: label)
        if label.bounds.contains(touchPoint) {
        value = label.tag
        }
    }
}
    func updateLabels() {
        for i in 1...componentCount {
            stars[i-1].textColor = i > value ? componentInactiveColor : componentActiveColor
        }
    }
}
