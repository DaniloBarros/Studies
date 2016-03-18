//
//  Bepid.swift
//  CoreDataDemo
//
//  Created by Danilo Barros Mendes on 6/2/15.
//  Copyright (c) 2015 Gustavo Salles. All rights reserved.
//

import UIKit
import CoreData

@objc(Bepid)
class Bepid: NSManagedObject {

    @NSManaged var alunos: NSNumber
    @NSManaged var instituicao: String
    @NSManaged var instructors: NSSet

}
