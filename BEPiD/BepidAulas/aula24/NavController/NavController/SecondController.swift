//
//  SecondController.swift
//  NavController
//
//  Created by Danilo Barros Mendes on 5/19/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

import UIKit

class SecondController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var label2: UILabel!
    init(){
        
        super.init(nibName: "SecondController", bundle: nil)
        
        navigationItem.title = "Alterando"
        
        let doneButton = UIBarButtonItem(title: "Alterar", style: .Plain, target: self, action: "editDone:")
        
        navigationItem.rightBarButtonItem = doneButton
        
        
    }

    @IBAction func editDone(sender: AnyObject){
        NSLog("Alterando")
        
        SingletonController.sharedInstance().nome = self.textField.text
        
        navigationController?.popViewControllerAnimated(true)
        
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
    
    
    override func viewWillAppear(animated: Bool) {
        self.label2.text = SingletonController.sharedInstance().nome
        
        self.textField.text = SingletonController.sharedInstance().nome
        
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
