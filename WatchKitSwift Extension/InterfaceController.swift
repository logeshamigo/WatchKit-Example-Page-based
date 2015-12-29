//
//  InterfaceController.swift
//  WatchKitSwift Extension
//
//  Created by Logesh K on 12/12/15.
//  Copyright © 2015 innoppl. All rights reserved.
//

import WatchKit
import Foundation
//import FeedsRowController

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var newsTable: WKInterfaceTable!
    
    let news = ["Playing the Aid game", "More grads have Excessive debt", "Fired over a Phallus?", "Mandatory Drug Testing", "Tighter Reins on Accreditor"];
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        loadTableData()
    }
    
    private func loadTableData() {
        
        newsTable.setNumberOfRows(news.count, withRowType: "feedsRowController")
        
        for (index, newsTitle) in news.enumerate() {
            
            let row = newsTable.rowControllerAtIndex(index) as! FeedsRowController
            
            row.feedTitle.setText(newsTitle)
            
            //row.feedImage.setImage(UIImage(named: minionName))
        }
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    override func handleActionWithIdentifier(identifier: String?, forRemoteNotification remoteNotification: [NSObject : AnyObject]) {
        if let notificationIdentifier = identifier {
            if notificationIdentifier == "firstButtonAction" {
                //imageView.setImageNamed("images")
                self.pushControllerWithName("NotificationView", context: nil)
            }
        }
    }

}
