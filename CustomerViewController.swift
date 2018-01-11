//
//  CustomerViewController.swift
//  Toro Solutions
//
//  Created by Replica on 25/06/2015.
//  Copyright (c) 2015 Toro Solutions. All rights reserved.
//

import UIKit

class CustomerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        //  Set up view size for navigationController; use full bounds minus 60pt at the bottom
        /*
        var navigationControllerFrame:CGRect = self.view.bounds;
        navigationControllerFrame.size.height -= 60;
        self.view.frame = navigationControllerFrame;
        */
        //  Set up view size for bottomView
        /*
        CGRect bottomViewFrame = CGRectMake(0, self.view.bounds.size.height-60, self.view.bounds.size.width, 60);
        bottomView.frame = bottomViewFrame;
        
        //  Enable autoresizing for both the navigationController and the bottomView
        viewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        bottomView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        
        //  Add views as subviews to the current view
        [self.view addSubview:viewController.view];
        [self.view addSubview:bottomView];
*/
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
