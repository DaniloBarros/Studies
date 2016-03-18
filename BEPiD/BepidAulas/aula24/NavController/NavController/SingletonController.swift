//
//  SingletonController.swift
//  NavController
//
//  Created by Danilo Barros Mendes on 5/19/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

import UIKit

class SingletonController: NSObject {
    
    static private var sharedNome: SingletonController!
    
    var nome: String!
    
    private init(singleton: Bool!){
        super.init()
        
        nome = "Nome Default"
        
        
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
