//
//  PortfolioItem.swift
//  Toro Solutions
//
//  Created by Replica on 30/06/2015.
//  Copyright (c) 2015 Toro Solutions. All rights reserved.
//

import Foundation
import UIKit

struct PortfolioItem {
    
    var text:String;
    var title:String;
    var fullImage:[String];
    var thumbNail:[String];
    var type:String;
    var thumbText:[String];
    var thumbImage:UIImage?;
    
    init (title:String, text:String, type:String, fullImage:[String], thumbNail:[String], thumbText:[String]){
        self.text = text;
        self.title = title;
        self.fullImage = fullImage;
        self.thumbNail = thumbNail;
        self.type = type;
        self.thumbText = thumbText;
        
        
        let url = NSURL(string: self.thumbNail[0]);
        println(self.thumbNail[0]);
        let dataDl:NSData = NSData(contentsOfURL: url!)!;
        println(dataDl.length)
        println("done");
        
        self.thumbImage = UIImage(data: dataDl)!;
        
    }
    
}