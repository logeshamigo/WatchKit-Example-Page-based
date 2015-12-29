//
//  MainInterfaceController.swift
//  WatchKitEx2
//
//  Created by Logesh K on 16/12/15.
//  Copyright © 2015 innoppl. All rights reserved.
//

import WatchKit
import Foundation


class MainInterfaceController: WKInterfaceController {

    @IBOutlet var feedImage: WKInterfaceImage!
    @IBOutlet var feedDate: WKInterfaceDate!
    @IBOutlet var feedTitle: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        self.setTitle("Close")
        if let feed = context as? FeedModel {
            feedTitle.setText(feed.feedTitle)
            feedImage.setImage(UIImage(named: feed.feedImage))
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

}
