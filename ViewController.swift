//
//  ViewController.swift
//  Toro Solutions
//
//  Created by Replica on 24/06/2015.
//  Copyright (c) 2015 Toro Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var favItems:[String] = [];
    
    @IBOutlet weak var toroMainText: UITextView!
    @IBOutlet weak var collectionLeading: NSLayoutConstraint!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
   
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat{
        
            
            return 10.0
    }
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return self.favItems.count;
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
    
        var data:String = self.favItems[indexPath.row];
        var cellIdentifier = "itemCell";
    
        var cell:ImageCell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! ImageCell;
        
        cell.technologyImage.image = UIImage(named: data)
        var textToDis:String = "";
        //Getting lazy trying to finish on schedule
        switch (indexPath.row){
        case 0:
            textToDis = "Web";
        case 1: textToDis = "Server"
        case 2: textToDis = "Coding"
        case 3: textToDis = "Apps"
        case 4: textToDis = "CMS"
        case 5: textToDis = "iOS"
        case 6: textToDis = "Windows"
        case 7: textToDis = "MacOSX"
        case 8 :textToDis = "Linux"
        case 9: textToDis = "Plugins"
        case 10: textToDis = "Flash"
        case 11: textToDis = "3D"
  
        default :
            textToDis = "error";
        }
        
        cell.textCell.text = textToDis;
        //[[cell currentDayArrow] setImage:[UIImage imageNamed:@"arrow.png"]];
        //  cell.technologyImage.image = UIImageView.load();
        return cell;
    }
    
    
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    @IBOutlet weak var toolbarContainer: UIView!
    @IBOutlet weak var collapseButton: UIButton!
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIView!
    var initialPoint: CGRect = CGRect();
    
    @IBOutlet weak var collTable: UICollectionView!
    @IBOutlet weak var textWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var textFieldAboutMe: UITextView!
    @IBOutlet weak var scrollViewContainer: UIScrollView!
    @IBOutlet weak var textWidthConstraintB: NSLayoutConstraint!
    
    @IBOutlet weak var leftBorder: NSLayoutConstraint!
    override func viewDidLayoutSubviews() {
        let val = self.scrollViewContainer.bounds.width;
        
        //self.widthConstraint.constant = val;
        self.widthConstraint.constant = val;
        self.textWidthConstraint.constant = val - self.leftBorder.constant;
        self.textWidthConstraintB.constant = val - self.leftBorder.constant;
        
        var fixedWidth:CGFloat = toroMainText.frame.size.width;
        
        var newSize:CGSize = toroMainText.sizeThatFits(CGSizeMake(fixedWidth,  CGFloat.max));
        //Hardcode the height
        toroMainScrollHeight.constant = newSize.height + 280;
        toroMainTextHeight.constant = newSize.height;
        
        if (collTable.frame.size.width >=  716){
            collectionViewHeight.constant = 70;
        } else {
            collectionViewHeight.constant = 140;
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController?.setNavigationBarHidden(true, animated: animated);
        
        let val = self.scrollViewContainer.bounds.width;
        //self.widthConstraint.constant = val;
     
        super.viewWillAppear(animated);
    }
    
    @IBOutlet weak var toroMainScrollHeight: NSLayoutConstraint!
    @IBOutlet weak var toroMainTextHeight: NSLayoutConstraint!
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
        super.viewWillDisappear(animated);
    }

   override func viewDidLoad() {
        super.viewDidLoad()
        collTable.dataSource = self;
        collTable.delegate = self;
    
        var flow:UICollectionViewLayout = collTable.collectionViewLayout;
    
        // Put it off screen
        toolbarContainer.frame.origin.x -= toolbarContainer.frame.width;
        collapseButton.frame.origin.x -= toolbarContainer.frame.width;
        let val = self.scrollViewContainer.frame.width;
    
        favItems.append("html5.png");
        favItems.append("php_logo.png");
        favItems.append("c++.png");
        favItems.append("java.png");
        favItems.append("j.png");
        favItems.append("ios.png");
        favItems.append("w.png");
        favItems.append("apple.png");
        favItems.append("linux.png");
        favItems.append("cslogo.png");
        favItems.append("flashbuilder.jpg")
        favItems.append("opengl.png")
  
        collTable.reloadData();
    
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
     
        if (UIDevice.currentDevice().orientation.isPortrait){
            self.collectionLeading.constant = 0;
            self.view.layoutIfNeeded();
            doAnimate();
        } else {
            self.collectionLeading.constant = 0;
            self.view.layoutIfNeeded()
        }
        //doAnimate();
    }
    
    func doAnimate(){
        return;
        let intVal:NSTimeInterval = 5;
      
            let wCollTable = collTable.frame.width;
        let vCollTable = self.view.frame.width;
        
        UIView.animateKeyframesWithDuration(20.0, delay: 0.0, options: UIViewKeyframeAnimationOptions.Autoreverse | UIViewKeyframeAnimationOptions.Repeat, animations:{
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.5, animations: {
                self.collectionLeading.constant = 200;
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframeWithRelativeStartTime(0.5, relativeDuration: 0.5, animations: {
                self.collectionLeading.constant = -200;
                self.view.layoutIfNeeded();
            })
            /*
            [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.5 animations:^{
            self.collectionLeading.constant = 200;
            self.viewLayoutIfNeeded();
            }];
            [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations:^{
            self.collectionLeading.constant = 0;
            self.viewLayoutIfNeeded();
            }];*/
            }, completion:nil);

    }
    
    override func viewDidAppear(animated: Bool) {
    
       
        /*
        UIView.animateWithDuration(intVal, animations:
            {
                self.view.layoutIfNeeded();
            },completion:{
                
                return true;
            }()
        );
        */
        doAnimate();
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent;
    }
    
    @IBAction func panCollapseMenu(sender: UIPanGestureRecognizer) {

        let state = sender.state;
        
        if (state == UIGestureRecognizerState.Began){
            initialPoint = self.collapseButton.frame;
          
        } else if (state == UIGestureRecognizerState.Changed){
            
            let translatedPoint = sender.translationInView(sender.view!);
            var newFrame:CGRect = self.initialPoint;
            
            
            newFrame.origin.x = newFrame.origin.x + translatedPoint.x;
            toolbarContainer.frame.origin.x = newFrame.origin.x - toolbarContainer.frame.width;
            
            sender.view!.frame = newFrame;
           
        } else if ((state == UIGestureRecognizerState.Ended) || (state == UIGestureRecognizerState.Cancelled)){
            var newFrame:CGRect = sender.view!.frame;
            var originX:Float = Float(newFrame.origin.x);
            
            let velocityX = sender.velocityInView(sender.view!)
            let duration:NSTimeInterval = 0.5;
            let damping:CGFloat = 0.5;
            let delay:NSTimeInterval = 0;
            
            originX = originX + (Float(velocityX.x) / 40)
            
            originX = fmaxf(Float(originX), Float(collapseButton.frame.width-newFrame.size.width));
            originX = fminf(Float(originX), Float(sender.view!.superview!.bounds.size.width - newFrame.size.width));
            
            newFrame.origin.x = CGFloat(originX);
            
            toolbarContainer.frame.origin.x = CGFloat(originX) - toolbarContainer.frame.width;
         
            UIView.animateWithDuration(duration, delay:delay, usingSpringWithDamping:damping, initialSpringVelocity:CGFloat(velocityX.x/320), options: UIViewAnimationOptions.AllowUserInteraction, animations:{
                sender.view!.frame = newFrame
            }, completion: nil);
            
        }
    }
    @IBAction func collapseButtonDown(sender: UIButton) {

    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

