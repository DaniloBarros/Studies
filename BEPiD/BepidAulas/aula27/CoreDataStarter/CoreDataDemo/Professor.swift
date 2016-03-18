//
//  Professor.swift
//  CoreDataDemo
//
//  Created by Danilo Barros Mendes on 6/2/15.
//  Copyright (c) 2015 Gustavo Salles. All rights reserved.
//

import CoreData
import UIKit

//Faz funcionar, apenas aceita '-'
@objc(Professor)
class Professor: NSManagedObject {

    @NSManaged var thumbnail: UIImage
    @NSManaged var foto: String?
    @NSManaged var nome: String
    @NSManaged var allocated: Bepid
    
    
    func setThumbnailFromImage(image: UIImage?){
        if let i = image{
            let newRect = CGRect(x: 0, y: 0, width: 70, height: 70)
            
            let ratio = max(newRect.height/i.size.height, newRect.width/i.size.width)
            
            UIGraphicsBeginImageContextWithOptions(newRect.size, false, 0);
            
            let path = UIBezierPath(roundedRect: newRect, cornerRadius: 10)
            path.addClip()
            
            var projectRect = CGRect()
            projectRect.size.width = ratio*i.size.width
            projectRect.size.height = ratio*i.size.height
            
            projectRect.origin.x = (newRect.size.width - projectRect.size.width)/2
            projectRect.origin.y = (newRect.size.height - projectRect.size.height)/2
            
            i.drawInRect(projectRect)
            
            let smallImage = UIGraphicsGetImageFromCurrentImageContext()
            self.thumbnail = smallImage
            
            UIGraphicsEndImageContext()
            
        }
    }

}
