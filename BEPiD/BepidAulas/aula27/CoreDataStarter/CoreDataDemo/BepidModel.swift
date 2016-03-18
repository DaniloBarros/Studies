//
//  BepidModel.swift
//  CoreDataDemo
//
//  Created by Danilo Barros Mendes on 6/2/15.
//  Copyright (c) 2015 Gustavo Salles. All rights reserved.
//

import UIKit
import CoreData

class BepidModel: NSObject {
    
    private let entityName = "BEPiD"
    
    private var privateBepid: Array<Bepid>?
    private var filtredData: Array<Bepid>?
    
    private var context: NSManagedObjectContext?
    
    static private var instance: BepidModel?
    
    var allBepids: Array<Bepid>?{
        get{
            return Array<Bepid>(self.filtredData!)
        }
    }
    
    var minStudents: Int = 0{
        didSet{
            self.filter()
        }
    }
    
    override init(){
        NSException(name: "Singleton", reason: "Use BepidModel.sharedInstance()", userInfo: nil).raise()
    }
    
    
    private init(singleton: Bool!) {
        super.init()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        self.context = appDelegate.managedObjectContext
        
        self.loadAllBepids()
    }
    
    static func sharedInstance() -> BepidModel{
        if instance == nil{
            instance = BepidModel(singleton: true)
        }
        
        return instance!
    }
    
    func createBepid() -> Bepid{
        var bepid = NSEntityDescription.insertNewObjectForEntityForName(self.entityName, inManagedObjectContext: self.context!) as! Bepid
        
        self.privateBepid!.append(bepid)
        
        return bepid
        
    }
    
    private func loadAllBepids(){
        if self.privateBepid == nil{
            
            //SELECT
            let request = NSFetchRequest(entityName: self.entityName)
            
            //ORDENACAO
            let sd = NSSortDescriptor(key: "instituicao", ascending: true)
            
            request.sortDescriptors = [sd]
            
            var error : NSError? = nil
            
            //Se a execucao ocorrer com sucesso
            if let result = self.context?.executeFetchRequest(request, error: &error){
                self.privateBepid = result as? Array<Bepid>
            }else{
                NSException.raise("Exception", format: "Error: %@", arguments: getVaList([error!]))
            }
            
        }
    }
    
    private func filter(){
        let request = NSFetchRequest(entityName: self.entityName)
        
        //WHERE
        request.predicate = NSPredicate(format: "alunos >= \(self.minStudents)", argumentArray: nil)
        
        println(request.predicate)
        
        let sd = NSSortDescriptor(key: "instituicao", ascending: true)
        
        request.sortDescriptors = [sd]
        
        var error : NSError? = nil
        
        if let result = self.context?.executeFetchRequest(request, error: &error){
            self.filtredData = result as? Array<Bepid>
        }else{
            NSException.raise("Exeption", format: "Error: %@", arguments: getVaList([error!]))
        }
        
    }
    
    
}
