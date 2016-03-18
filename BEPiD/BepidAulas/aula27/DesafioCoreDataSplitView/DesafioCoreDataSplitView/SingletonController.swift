//
//  SingletonController.swift
//  DesafioCoreDataSplitView
//
//  Created by Danilo Barros Mendes on 6/5/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

import UIKit

class SingletonController: NSObject {
    
    static private var sharedNome: SingletonController!
    
    var marcas: NSMutableArray?
    var carros: NSMutableArray?
    var clientes: NSMutableArray?
    
    var edit: Bool!
    
    private init(singleton: Bool!){
        super.init()
        
        edit = false
        marcas = NSMutableArray()
        carros = NSMutableArray()
        clientes = NSMutableArray()
        
    }
    
    static func sharedInstance()->SingletonController{
        
        if sharedNome == nil {
            sharedNome = SingletonController(singleton: true)
        }
        
        return sharedNome
        
    }
    
    override init() {
        NSException(name: "Singleton", reason: "Use SingletonController.sharedInstance()", userInfo: nil).raise()
    }
    
   
}
