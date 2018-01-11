//
//  PortfolioControllerViewController.swift
//  Toro Solutions
//
//  Created by Replica on 30/06/2015.
//  Copyright (c) 2015 Toro Solutions. All rights reserved.
//

import UIKit

class PortfolioControllerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSURLConnectionDelegate{


    var portfolioItems:[[PortfolioItem]] = [[],[],[]];
    var data = NSMutableData();
    
    @IBOutlet weak var collTable: UITableView!
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0){
            if (self.portfolioItems[0].count > 0){
                return "";
            }
            return "Loading...";
        }
        return ""
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var svc:PortfolioCell = sender as! PortfolioCell;
        var pvc:PortfolioSingleViewController  = segue.destinationViewController as! PortfolioSingleViewController;
        
        pvc.data = svc.data;
        
        
        //svc.viewLabel.text;
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let tableCell:PortfolioCell = tableView.dequeueReusableCellWithIdentifier("portfolioCell", forIndexPath: indexPath) as! PortfolioCell;
       
        var data:PortfolioItem = self.portfolioItems[indexPath.section][indexPath.item];
        
        //cell.technologyImage.image = UIImage(named: data)
        tableCell.viewLabel.text = data.title;
        tableCell.viewText.text = data.text;
        tableCell.viewImage.image = data.thumbImage;
        
        tableCell.data = data;
        
        return tableCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.portfolioItems.isEmpty){
            return 0;
        }
    
        
        return self.portfolioItems[section].count;
       
        
       // return 0;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collTable.dataSource = self;
        collTable.delegate = self;
        
        collTable.reloadData();
        startConnection();
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startConnection(){
        let urlPath: String = "http://torosolutions.com.au/services/getItem.php"
        var url: NSURL = NSURL(string: urlPath)!
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: true)!
        connection.start()
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data);
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        
        let urlRequest:NSURLRequest = connection.originalRequest;
        let urlString =  urlRequest.URL?.absoluteString;
        
        if (urlString == "http://torosolutions.com.au/services/getItem.php"){
            var err: NSError?;
            var str:NSString = NSString(data: self.data, encoding: 4)!;  // throwing an error on the line below (can't figure out where the error message is)
            var json:NSDictionary = NSJSONSerialization.JSONObjectWithData(self.data, options: nil, error: &err) as! NSDictionary;
            var testString:[String] = [];
            
            let tmpArray = json["result"]! as! [[String:AnyObject]];
            
            for arrDict in tmpArray {
                let lTitle = arrDict["title"]! as! String
                let lText = arrDict["text"]! as! String;
                let lType = arrDict["type"]! as! String;
                
                let lFullImage = arrDict["fnFull"]! as! [String];
                let lThumbNail = arrDict["fnThumb"]! as! [String];
                let lThumbText = arrDict["fnTxt"]! as! [String];
                
                
                var theItem:PortfolioItem = PortfolioItem(title:lTitle, text:lText, type:lType, fullImage:lFullImage, thumbNail:lThumbNail, thumbText:lThumbText);
                var indexArr:NSInteger = 0;
                
                if (lType == "WWW"){
                    indexArr = 0;
                }
                
                if (lType == "Client"){
                    indexArr = 1;
                }
                
                if (lType == "Server"){
                    indexArr = 2;
                }
                
                //let url = NSURL(string: lThumbNail[0]);
                //let dataDl = NSData(contentsOfURL: url!);
                
                self.portfolioItems[indexArr].insert(theItem, atIndex:0);
                //self.portfolioItems[lType].insert(theItem, atIndex:0);
            }
            
         //   var theItem:PortfolioItem = self.portfolioItems[currentItem];
          //  let url = NSURL(string: theItem.image);
           // let data = NSData(contentsOfURL: url!);
            //self.pairImage.image = UIImage(data: data!);
            
            collTable.reloadData();
        } else {
            
        }
        
    }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
