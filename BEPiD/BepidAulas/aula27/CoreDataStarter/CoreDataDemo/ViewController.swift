//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Gustavo Salles on 30/05/15.
//  Copyright (c) 2015 Gustavo Salles. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableInstituicoes: UITableView!
    
    var minStudents: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "BEPiD's"
        tableInstituicoes.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        self.tableInstituicoes.reloadData()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.tableInstituicoes.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return BepidModel.sharedInstance().allBepids!.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = "Teste"
        
        return cell
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("showBepidDetail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showBepidDetail" {
            let bvc = segue.destinationViewController as! BepidDetail
            
        }
    }

    @IBAction func filtraInstituicao(sender: AnyObject) {
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

