//
//  InterfaceController.swift
//  WatchKitSwift Extension
//
//  Created by Logesh K on 12/12/15.
//  Copyright © 2015 innoppl. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var newsTable: WKInterfaceTable!
    
    var playingAidGame = FeedModel.init(feedTitle: "Playing the Aid game", feedImage: "PAG", feedDescription: "Full description")
    
    var moreGrads = FeedModel.init(feedTitle: "More grads have Excessive debt", feedImage: "news", feedDescription: "Full description")
    
    var firedOver = FeedModel.init(feedTitle: "Fired over a Phallus?", feedImage: "FOP", feedDescription: "Full description")
    
    var mandatoryDrug = FeedModel.init(feedTitle: "Mandatory Drug Testing", feedImage: "news", feedDescription: "Full description")
    
    var tighterReins = FeedModel.init(feedTitle: "Tighter Reins on Accreditor", feedImage: "news", feedDescription: "Full description")
    
    
    var news:[FeedModel] = []
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        news.append(playingAidGame!)
        news.append(moreGrads!)
        news.append(firedOver!)
        news.append(tighterReins!)
        news.append(mandatoryDrug!)
        
        loadTableData()
        
    }
    
    private func loadTableData() {
        
        newsTable.setNumberOfRows(news.count, withRowType: "feedsRowController")
        
        for (index, feeds) in news.enumerate() {
            
            let row = newsTable.rowControllerAtIndex(index) as! FeedsTableRow
            
            row.feedTitle.setText(feeds.feedTitle)
            row.feedImage.setImage(UIImage(named: feeds.feedImage))
        }
        
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let feed = news[rowIndex]
        self.presentControllerWithName("FeedDetailedView", context: feed)
    }
    
   /* override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject?
    {
        
        let feedHeaderTitle = news[rowIndex]
        //return feedHeaderTitle
        //self.presentControllerWithName("Flight", context: feedHeaderTitle)
    }*/

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
                let aps = (remoteNotification["aps"] as? NSDictionary)!
                let alert = (aps["alert"] as? NSDictionary)!
                let feedModel = FeedModel.init(feedTitle: (alert["body"] as? String)!, feedImage: (remoteNotification["image"] as? String)!, feedDescription: "Full description")
                self.presentControllerWithName("FeedDetailedView", context: feedModel)
            }
        }
    }

}
