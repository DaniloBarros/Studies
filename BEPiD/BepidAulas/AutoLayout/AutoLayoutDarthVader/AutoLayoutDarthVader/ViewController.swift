//
//  ViewController.swift
//  AutoLayoutDarthVader
//
//  Created by Danilo Barros Mendes on 7/1/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton()
        btn.backgroundColor = UIColor.blueColor()
        btn.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addSubview(btn)
        
        let myViews = ["button":btn]
        
        let horizontalContraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[button]-10-|", options: nil, metrics: nil, views: myViews)
        
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-250-[button(100)]", options: nil, metrics: nil, views: myViews)
        
        NSLayoutConstraint.activateConstraints(verticalConstraints)
        NSLayoutConstraint.activateConstraints(horizontalContraints)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

