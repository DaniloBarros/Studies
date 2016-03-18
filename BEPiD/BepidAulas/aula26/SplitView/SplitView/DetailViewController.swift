//
//  DetailViewController.swift
//  SplitView
//
//  Created by Danilo Barros Mendes on 6/1/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var interesseLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    
    var professores:Professores!{
        didSet(novoProfessor){
            self.refreshUI()
        }
    }
    
    func refreshUI(){
        label1?.text = professores.nome
        label2?.text = String(professores.idade) + " anos"
        label3?.text = professores.interesse
        image?.image = UIImage(named: professores.nomeFoto);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()

        // Do any additional setup after loading the view.
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


extension DetailViewController: SelecionarProfessoresDelegate{
    func professorSelecionado(novoProfessor: Professores) {
        professores = novoProfessor
    }
}
