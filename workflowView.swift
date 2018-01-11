//
//  workflowView.swift
//  Toro Solutions
//
//  Created by Replica on 7/07/2015.
//  Copyright (c) 2015 Toro Solutions. All rights reserved.
//

import UIKit
import GLKit
import OpenGLES


class workflowView: UIViewController {

   // @IBOutlet weak var glView: portfolioGLView!
    @IBOutlet weak var glView: portfolioGLView!
    override func viewDidLoad() {
        super.viewDidLoad()

        (self.glView).context = EAGLContext(API: .OpenGLES2)
        EAGLContext.setCurrentContext(self.glView.context)
        glView.startAnimation()
        //self.glView.setNeedsDisplay();

// ...
}
}
