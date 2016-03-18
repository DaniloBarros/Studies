//
//  ViewController.swift
//  TableViewSwift
//
//  Created by Danilo Barros Mendes on 5/11/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    
    var numbers: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Minha primeira TV"
        
        self.numbers = ["Um", "Dois", "Tres",
        "Quatro", "Cinco", "Seis"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellIdentifier = "Cell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = numbers.objectAtIndex(indexPath.row) as? String
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row;
        
        let alert = UIAlertView()
        
        alert.title = "Simples"
        alert.message = "O valor selecionado foi \(numbers[row])"
        alert.addButtonWithTitle("Ok");
        
        alert.show()
        
    }
    
    
}

