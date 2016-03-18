//
//  AddBepid.swift
//  CoreDataDemo
//
//  Created by Gustavo Salles on 30/05/15.
//  Copyright (c) 2015 Gustavo Salles. All rights reserved.
//

import UIKit

class AddBepid: UIViewController {

    @IBOutlet weak var campoInstituicao: UITextField!
    @IBOutlet weak var campoAlunos: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Cadastro"
        
        let doneButton = UIBarButtonItem(title: "Salvar",
            style: .Plain, target: self, action: "salvarInstituicao:")
        
        navigationItem.rightBarButtonItem = doneButton
        
    }
    
    @IBAction func salvarInstituicao(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
