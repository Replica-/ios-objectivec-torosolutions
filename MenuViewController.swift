//
//  MenuViewController.swift
//  Toro Solutions
//
//  Created by Replica on 30/06/2015.
//  Copyright (c) 2015 Toro Solutions. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    
    @IBOutlet var viewMenuContainer: UIView!
    @IBOutlet weak var serverHeight: NSLayoutConstraint!
    @IBOutlet weak var webHeight: NSLayoutConstraint!
    @IBOutlet weak var clientHeight: NSLayoutConstraint!
    @IBOutlet weak var workflowHeight: NSLayoutConstraint!
    @IBOutlet weak var portfolioHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var topLayoutGuideHeight: NSLayoutConstraint!
    override func viewDidLayoutSubviews() {
        let valHeight = (self.viewMenuContainer.bounds.height / 6);
       
        //self.widthConstraint.constant = val;
        self.serverHeight.constant = valHeight;
        self.portfolioHeight.constant = valHeight;
        self.webHeight.constant = valHeight;
        self.clientHeight.constant = valHeight;
        self.workflowHeight.constant = valHeight;
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent;
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
