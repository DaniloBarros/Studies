//
//  CARROS.swift
//  
//
//  Created by Danilo Barros Mendes on 6/10/15.
//
//

import Foundation
import CoreData

class CARROS: NSManagedObject {

    @NSManaged var nome_carro: String
    @NSManaged var modelo: String
    @NSManaged var cor: String
    @NSManaged var anoFabricacao: NSNumber
    @NSManaged var anoModelo: NSNumber
    @NSManaged var tem: MARCA
    @NSManaged var pertence: CLIENTES

}
