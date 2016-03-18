//
//  EditController.swift
//  NavController
//
//  Created by Danilo Barros Mendes on 5/19/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

import UIKit

class EditController: UIViewController {
    
    @IBOutlet weak var nomeLabel: UILabel!
    
    init(){
        super.init(nibName: "EditController", bundle: nil)
        
        navigationItem.title = "Navigation Controller"
        
        let editButton = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: "editNome:")
        
        navigationItem.rightBarButtonItem = editButton
        
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func editNome (sender: AnyObject){
        NSLog("clicou")
        
        let secController = SecondController()
        
        navigationController?.pushViewController(secController, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.nomeLabel.text = SingletonController.sharedInstance().nome
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
