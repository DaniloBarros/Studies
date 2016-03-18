//
//  AddProfessor.swift
//  CoreDataDemo
//
//  Created by Gustavo Salles on 30/05/15.
//  Copyright (c) 2015 Gustavo Salles. All rights reserved.
//

import UIKit

class AddProfessor: UIViewController,
            UINavigationControllerDelegate, UIImagePickerControllerDelegate,
            UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var campoProfessor: UITextField!
    @IBOutlet weak var pickerInstituicao: UIPickerView!
    @IBOutlet weak var fotoProfessor: UIImageView!
    
    @IBAction func tirarFoto(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            imagePicker.sourceType = .Camera
        } else {
            imagePicker.sourceType = .PhotoLibrary
        }
        
        imagePicker.delegate = self
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        fotoProfessor.image = image
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    @IBAction func salvarProfessor(sender: AnyObject) {

        navigationController?.popViewControllerAnimated(true)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Professor"

        fotoProfessor.layer.borderWidth = 2.0
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        let bepid = " Nenhuma Instituição "
        
        return bepid
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
