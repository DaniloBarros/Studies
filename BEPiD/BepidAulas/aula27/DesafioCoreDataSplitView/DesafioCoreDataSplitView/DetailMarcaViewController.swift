//
//  DetailMarcaViewController.swift
//  DesafioCoreDataSplitView
//
//  Created by Danilo Barros Mendes on 6/5/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

import UIKit

class DetailMarcaViewController: UIViewController {
    
    var nome: String?
    
    @IBOutlet weak var marcaNome: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("salvar"))
        
        marcaNome.text = nome
        self.title = nome
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func salvar(){
        
        var array : NSMutableArray?
        
        array = NSMutableArray(array: ["Fiat", "VW", "Ford"])
        
        var index = array?.indexOfObject(self.nome!)
        
        array?.replaceObjectAtIndex(index!, withObject: "OI")
        
        NSLog("%@", array!)
        
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
