//
//  ViewController.swift
//  DesafioAutoLayout
//
//  Created by Danilo Barros Mendes on 7/2/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var verdeHeight = NSLayoutConstraint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blackColor()
        
        let amarelo = UIView()
        amarelo.backgroundColor = UIColor.yellowColor()
        amarelo.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addSubview(amarelo)

        let alterar = UIButton()
        alterar.backgroundColor = UIColor.grayColor()
        alterar.setTranslatesAutoresizingMaskIntoConstraints(false)
        alterar.setTitle("Alterar", forState: UIControlState.Normal)
        alterar.addTarget(self, action: "alterar:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(alterar)
        
        let azul = UIView()
        azul.backgroundColor = UIColor.blueColor()
        azul.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addSubview(azul)
        
        let verde = UIView()
        verde.backgroundColor = UIColor.greenColor()
        verde.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addSubview(verde)
        
        let vermelho = UIView()
        vermelho.backgroundColor = UIColor.redColor()
        vermelho.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addSubview(vermelho)
        
        let myViews = ["alterar":alterar, "amarelo":amarelo, "azul":azul, "verde":verde, "vermelho":vermelho]
        
        let verticalLeft = NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[alterar(50)]-27-[azul]-29-[verde]-20-|", options: nil, metrics: nil, views: myViews)
        let verticalRight = NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[amarelo(50)]-27-[azul]-29-[vermelho]-20-|", options: nil, metrics: nil, views: myViews)
        
        let horizontalTop = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[alterar(50)]-28-[amarelo]-|", options: nil, metrics: nil, views: myViews)
        let horizontalMidlle = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[azul]-|", options: nil, metrics: nil, views: myViews)
        let horizontalBottom = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[verde]-33-[vermelho]-|", options: nil, metrics: nil, views: myViews)
        
        verdeHeight = NSLayoutConstraint(item: verde, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 155)
        
        //heightMenor = NSLayoutConstraint(item: verde, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 50)
        //heightMenor.priority = 250;
        //verdeHeight.priority = 900
        
        let vermelhoHeight = NSLayoutConstraint(item: vermelho, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: verde, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        
        let verdeWidth = NSLayoutConstraint(item: verde, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: vermelho, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activateConstraints(verticalLeft)
        NSLayoutConstraint.activateConstraints(verticalRight)
        
        NSLayoutConstraint.activateConstraints(horizontalTop)
        NSLayoutConstraint.activateConstraints(horizontalMidlle)
        NSLayoutConstraint.activateConstraints(horizontalBottom)
        
        let constraints = [verdeHeight, /*heightMenor,*/ vermelhoHeight, verdeWidth]
        
        NSLayoutConstraint.activateConstraints(constraints)
        
        
    }
    
    func alterar(sender:UIButton!){
        
        if verdeHeight.constant == 50{
            verdeHeight.constant = 155
        }else{
            verdeHeight.constant = 50
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

