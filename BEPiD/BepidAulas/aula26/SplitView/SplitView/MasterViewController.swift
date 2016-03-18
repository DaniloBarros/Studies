//
//  MasterViewController.swift
//  SplitView
//
//  Created by Danilo Barros Mendes on 6/1/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

import UIKit

protocol SelecionarProfessoresDelegate:class{
    func professorSelecionado(novoProfessor: Professores)
}

class MasterViewController: UITableViewController {

    var instrutores = [Professores]()
    weak var delegate: SelecionarProfessoresDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    required init!(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        
        self.instrutores.append(Professores(nome: "Professor1", interesse: "Livros",
            nomeFoto: "01.jpg", idade: 28))
        self.instrutores.append(Professores(nome: "Professor2", interesse: "Jogos",
            nomeFoto: "02.jpg", idade: 36))
        self.instrutores.append(Professores(nome: "Professor3", interesse: "Basketball",
            nomeFoto: "03.jpg", idade: 22))
        self.instrutores.append(Professores(nome: "Professor4", interesse: "Cerveja",
            nomeFoto: "04.jpg", idade: 32))
        self.instrutores.append(Professores(nome: "Professor5", interesse: "Musica",
            nomeFoto: "05.jpg", idade: 30))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.instrutores.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        let professor = self.instrutores[indexPath.row]
        cell.textLabel?.text = professor.nome

        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let professorSelecionado = self.instrutores[indexPath.row]
        self.delegate?.professorSelecionado(professorSelecionado)
        
        if let detailViewController = self.delegate as? DetailViewController{
            splitViewController?.showDetailViewController(detailViewController.navigationController, sender: nil)
        }
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
