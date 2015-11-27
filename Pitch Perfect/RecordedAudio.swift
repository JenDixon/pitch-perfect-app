//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Jennifer Dixon on 11/17/15.
//  Copyright © 2015 Jennifer Dixon. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    
    var filePathUrl: NSURL!
    var title: String!
    
    init (filePathUrl: NSURL, title: String) {
        self.filePathUrl = filePathUrl
        self.title = title
    }
}
