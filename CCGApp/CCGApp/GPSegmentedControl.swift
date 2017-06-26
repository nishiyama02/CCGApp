//
//  GPSegmentedControl.swift
//  InteractApp
//
//  Created by Gabriel Alberto de Jesus Preto on 21/09/16.
//  Copyright © 2016 Matheus. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class GPSegmentedControl: UIControl {
    
    private var labels = [UILabel]()
    var thumbView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    var items: [String] = ["Livro", "Capítulo"] {
        didSet {
            setupLabels()
        }
    }
    
    var selectedIndex: Int = 0 {
        didSet {
            displayNewSelectedIndex()
        }
    }
    
    func setupView() {
        self.backgroundColor = UIColor(red: 0.956, green: 0.956, blue: 0.956, alpha: 1.0)
        
        self.setupLabels()
        
        print(self.labels[0].font)
        self.insertSubview(thumbView, at: 0)
    }
    
    func setupLabels() {
        for label in labels {
            label.removeFromSuperview()
        }
        
        labels.removeAll(keepingCapacity: true)
        
        for index in 1...items.count {
            let label = UILabel(frame: CGRect.zero)
            label.text = items[index-1]
            label.textAlignment = .center
            let font = UIFont(name: "Futura-Medium", size: 17)
            label.font = font
            label.textColor = UIColor.black
            self.addSubview(label)
            labels.append(label)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var selectFrame = self.bounds
        let newWidth = selectFrame.width/CGFloat(items.count)
        selectFrame.size.width = newWidth
        thumbView.frame = selectFrame
        thumbView.backgroundColor = UIColor(red: 0.956, green: 0.956, blue: 0.956, alpha: 1.0)
        let rectLine = CGRect(x: 0, y: thumbView.frame.height-3, width: thumbView.frame.size.width, height: 3)
        let bottomLine = UIView(frame: rectLine)
        bottomLine.backgroundColor = UIColor(red: 0.29, green: 0.549, blue: 0.874, alpha: 1.0)
        
        thumbView.addSubview(bottomLine)
        
        let labelHeight = self.bounds.height
        let labelWidth = self.bounds.width/CGFloat(labels.count)
        
        for index in 0...labels.count-1 {
            let label = labels[index]
            let xPosition = CGFloat(index)*labelWidth
            label.frame = CGRect(x: xPosition, y: 0, width: labelWidth, height: labelHeight)
        }
        
        
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        var calculatedIndex: Int?
        
        for(index, item) in labels.enumerated() {
            if item.frame.contains(location) {
                calculatedIndex = index
            }
        }
        
        if calculatedIndex != nil {
            selectedIndex = calculatedIndex!
            sendActions(for: .valueChanged)
        }
        
        return false
    }
    
    func displayNewSelectedIndex() {
        let label = labels[selectedIndex]
        self.thumbView.frame = label.frame
    }
    
    
    
}



