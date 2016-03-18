//
//  ViewController1.swift
//  AulaViewController
//
//  Created by Danilo Barros Mendes on 5/4/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tabBarItem.title = "View1"
        tabBarItem.image = UIImage(named: "Time.png")
    }
    
    convenience init (){
        self.init(nibName: nil, bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let backgroundView = View1(frame: frame)
        backgroundView.backgroundColor = UIColor.blueColor()
        view = backgroundView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
