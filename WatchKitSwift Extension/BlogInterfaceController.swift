//
//  BlogInterfaceController.swift
//  WatchKitEx2
//
//  Created by Logesh K on 18/12/15.
//  Copyright © 2015 innoppl. All rights reserved.
//

import WatchKit
import Foundation


class BlogInterfaceController: WKInterfaceController {

    @IBOutlet weak var blogTable: WKInterfaceTable!
    
    var daysClass = FeedModel.init(feedTitle: "The 12 Days of an Online Class", feedImage: "12OC", feedDescription: "Full description")
    
    var mysterySolved = FeedModel.init(feedTitle: "Mystery Solved?", feedImage: "blogs", feedDescription: "Full description")
    
    var gradHacker = FeedModel.init(feedTitle: "2015 GradHacker Holiday Gift Guide", feedImage: "gradhacker", feedDescription: "Full description")
    
    
    
    var blogs:[FeedModel] = []
    
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        blogs.append(daysClass!)
        blogs.append(mysterySolved!)
        blogs.append(gradHacker!)
        
        loadTableData()
    }
    
    private func loadTableData() {
        
        blogTable.setNumberOfRows(blogs.count, withRowType: "feedsRowController")
        
        for (index, feed) in blogs.enumerate() {
            
            let row = blogTable.rowControllerAtIndex(index) as! FeedsTableRow
            
            row.feedTitle.setText(feed.feedTitle)
            row.feedImage.setImage(UIImage(named: feed.feedImage))
        }
        
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let feed = blogs[rowIndex]
        presentControllerWithName("FeedDetailedView", context: feed)
    }
    
    /*override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject?
    {
        
        let feedHeaderTitle = blogs[rowIndex]
        return feedHeaderTitle
    }*/

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
