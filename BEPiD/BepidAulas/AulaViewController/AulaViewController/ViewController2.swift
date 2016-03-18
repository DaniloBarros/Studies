//
//  ViewController2.swift
//  AulaViewController
//
//  Created by Danilo Barros Mendes on 5/4/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func addNotification(sender: AnyObject){
        let date = datePicker.date
        println("Agendado notificação para \(date)")
        
//        let today = NSDate()
//        
//        if date.compare(today) == NSComparisonResult.OrderedAscending{
//            
//        }else{
//            
//        }
//        
//        

        let notification = UILocalNotification()
        notification.alertBody = "Minha notificacao"
        notification.fireDate = date
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
        
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tabBarItem.title = "NotificationView"
        tabBarItem.image = UIImage(named: "Time.png")
    }
    
    convenience init (){
        self.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        datePicker.minimumDate = NSDate(timeIntervalSinceNow: 60);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("Carregou view1")
        
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
