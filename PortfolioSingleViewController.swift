//
//  PortfolioSingleViewController.swift
//  Toro Solutions
//
//  Created by Replica on 3/07/2015.
//  Copyright (c) 2015 Toro Solutions. All rights reserved.
//

import UIKit

class PortfolioSingleViewController: UIViewController {

    @IBOutlet weak var textWidth: NSLayoutConstraint!
    @IBOutlet weak var textHeight: NSLayoutConstraint!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var textHeightConstraint: NSLayoutConstraint!
   // @IBOutlet weak var textHeightConstraint: NSLayoutConstraint!
   // @IBOutlet weak var constraintHeight: NSLayoutConstraint!
   // @IBOutlet weak var constraintWidth: NSLayoutConstraint!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var lImage: UIImageView!
    @IBOutlet weak var lDescription: UITextView!
    
    var data:PortfolioItem?;
    var currentIndex:Int = 0;
    
    override func viewDidLoad() {
        self.lLabel.text = data!.title;
        showImage();
        layoutView()
    }
    
    var ii:CGFloat = 0
    
    func layoutView(){
        var w:CGFloat = self.lImage.bounds.width;
        var h:CGFloat = self.lImage.bounds.height;
   
        var vH:CGFloat = view.frame.height - 110;
        let vW = view.frame.width;
        //self.constraintWidth.constant = self.view.bounds.width / 4;
        
        var oH:CGFloat = 0;
        var oW:CGFloat = 0;
        
        var ratio:CGFloat = 1;
        /*
        println(w)
        println(h)
        println(vW)
        println(vH)
        println(" ")
*/
        
if ((UIDevice.currentDevice().orientation == UIDeviceOrientation.FaceUp)
            || (UIDevice.currentDevice().orientation == UIDeviceOrientation.Portrait)){
                textWidth.constant = vW;
                textHeight.constant = 110;
                vH = vH - 110;
                /*
                // Check if the current width is larger than the max
                if(w > vW){
                    ratio = vW / w;   // get ratio for scaling image
                    //$(this).css("width", maxWidth); // Set new width
                    //$(this).css("height", height * ratio);  // Scale height based on ratio
                    h = h * ratio;    // Reset height to match scaled image
                    w = w * ratio;    // Reset width to match scaled image
                }
                
                // Check if current height is larger than max
                if(h > vH){
                    ratio = vH / h; // get ratio for scaling image
                    //$(this).css("height", maxHeight);   // Set new height
                    //$(this).css("width", width * ratio);    // Scale width based on ratio
                    w = w * ratio;    // Reset width to match scaled image
                    h = h * ratio;    // Reset height to match scaled image
                }
*/
       
} else {
    textWidth.constant = vW;
    textHeight.constant = 80;
    vH = vH - 80
    
        }
                //imageHeight.constant = view.frame.height - 220;
                //imageWidth.constant = view.frame.width;
                //self.textHeightConstraint.constant = 200;
            //self.view.layoutIfNeeded();
            
        //} else {
            
            //self.imageHeightConstraint.constant = -260;
            //self.textHeightConstraint.constant = 200;
            //self.view.layoutIfNeeded()
        //}
   
        imageWidth.constant = vW;
        imageHeight.constant = vH;
        
       
        
        //if (lImage.bounds.size.height)
        if (UIDevice.currentDevice().orientation.isPortrait){
            
            //self.textHeightConstraint.constant = 150;
            //if (self.lImage.bounds.width > self.lImage.bounds.height){
            //self.constraintHeight.constant = 300; //- self.textHeightConstraint.constant - 110;
            //}
        } else {
            
            //self.textHeightConstraint.constant = 100;
        }
    }
    
    func showImage(){
        self.leftBtn.hidden = false;
        self.rightBtn.hidden = false;
        
        if (self.currentIndex == 0){
            self.leftBtn.hidden = true;
        }
        if (self.currentIndex == data!.fullImage.count - 1) {
            self.rightBtn.hidden = true;
        }
        
        self.lDescription.text = data!.thumbText[currentIndex];
        let url = NSURL(string: self.data!.fullImage[currentIndex]);
        let dataDl:NSData = NSData(contentsOfURL: url!)!;
        self.lImage.image = UIImage(data: dataDl)!;
    }
    override func viewDidLayoutSubviews() {
        layoutView()
            
        
    }
    
    @IBAction func prevBtn(sender: AnyObject) {
        prevImage();
    }
    @IBAction func nextBtn(sender: AnyObject) {
        nextImage();
    }
    func nextImage(){
        currentIndex++;
        showImage();
    }
    
    func prevImage(){
        
        currentIndex--;
        showImage();
    }
    
}
