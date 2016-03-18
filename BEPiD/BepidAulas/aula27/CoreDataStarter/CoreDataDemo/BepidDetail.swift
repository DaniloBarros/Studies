//
//  BepidDetail.swift
//  CoreDataDemo
//
//  Created by Gustavo Salles on 30/05/15.
//  Copyright (c) 2015 Gustavo Salles. All rights reserved.
//

import UIKit


class BepidDetail: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var labelInstituicao: UILabel!
    @IBOutlet weak var labelAlunos: UILabel!
    @IBOutlet weak var tableProfessores: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Detalhe BEPiD"
        tableProfessores.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableProfessores.layer.borderWidth = 2.0
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableProfessores.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        
        cell.textLabel!.text = "Professores"
        
        return cell
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
