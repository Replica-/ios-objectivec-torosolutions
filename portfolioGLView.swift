//
//  portfolioGLView.swift
//  Toro Solutions
//
//  Created by Replica on 7/07/2015.
//  Copyright (c) 2015 Toro Solutions. All rights reserved.
//

import UIKit
import GLKit

struct Vertex {
    var Position:[Float];
    var Color:[Float];
    var TexCoord:[Float];
}
/*
    // Front
    [[1, -1, 1], [1, 0, 0, 1], [1, 0]],
    [[1, 1, 1], [0, 1, 0, 1], [1, 1]],
    [[-1, 1, 1], [0, 0, 1, 1], [0, 1]],
    [[-1, -1, 1], [0, 0, 0, 1], [0, 0]],

    // Back

    [[1, 1, -1], [1, 0, 0, 1], [0, 1]],
    [[-1, -1, -1], [0, 1, 0, 1], [1, 0]],
    [[1, -1, -1], [0, 0, 1, 1], [0, 0]],
    [[-1, 1, -1], [0, 0, 0, 1], [1, 1]],
    // Left
    [[-1, -1, 1], [1, 0, 0, 1], [1, 0]],
    [[-1, 1, 1], [0, 1, 0, 1], [1, 1]],
    [[-1, 1, -1], [0, 0, 1, 1], [0, 1]],
    [[-1, -1, -1], [0, 0, 0, 1], [0, 0]],
    // Right
    [[1, -1, -1], [1, 0, 0, 1], [1, 0]],
    [[1, 1, -1], [0, 1, 0, 1], [1, 1]],
    [[1, 1, 1], [0, 0, 1, 1], [0, 1]],
    [[1, -1, 1], [0, 0, 0, 1], [0, 0]],
    // Top
    [[1, 1, 1], [1, 0, 0, 1], [1, 0]],
    [[1, 1, -1], [0, 1, 0, 1], [1, 1]],
    [[-1, 1, -1], [0, 0, 1, 1], [0, 1]],
    [[-1, 1, 1], [0, 0, 0, 1], [0, 0]],
    // Bottom
    [[1, -1, -1], [1, 0, 0, 1], [1, 0]],
    [[1, -1, 1], [0, 1, 0, 1], [1, 1]],
    [[-1, -1, 1], [0, 0, 1, 1], [0, 1]],
    [[-1, -1, -1], [0, 0, 0, 1], [0, 0]]
*/
//];
let Indices:[GLubyte] = [
    0, 1, 2,
    2, 3, 0,
    // Back
    4, 6, 5,
    4, 5, 7,
    // Left
    8, 9, 10,
    10, 11, 8,
    // Right
    12, 13, 14,
    14, 15, 12,
    // Top
    16, 17, 18,
    18, 19, 16,
    // Bottom
    20, 21, 22,
    22, 23, 20
];


class portfolioGLView: GLKView {
    var pic:UIImage = UIImage(named:"logo_single.jpg")!;
    var imageContext:CGContextRef!;
 
    var Vertices:[Vertex] = [];
    var _curRed:GLfloat = 0;
    var _increasing:ObjCBool = false;
    var _vertexBuffer:GLuint = GLuint();
    var _indexBuffer:GLuint = GLuint();
    var _vertexArray:GLuint = GLuint();
    var _rotation:GLfloat = 0;

    var effect:GLKBaseEffect!
    
    func startAnimation(){
     
        //Front
        self.Vertices.append(Vertex(Position: [1,-1,1],Color: [1,0,0,1],TexCoord: [1,0]));
        self.Vertices.append(Vertex(Position: [1,1,1],Color: [0,1,0,1],TexCoord: [1,1]));
        self.Vertices.append(Vertex(Position: [-1,1,1],Color: [0,0,1,1],TexCoord: [0,1]));
        self.Vertices.append(Vertex(Position: [-1,-1,1],Color: [0,0,0,1],TexCoord: [0,0]));
     
        //Back
        self.Vertices.append(Vertex(Position: [1,1,-1],Color: [1,0,0,1],TexCoord: [0,1]));
        self.Vertices.append(Vertex(Position: [-1,-1,-1],Color: [0,1,0,1],TexCoord: [1,0]));
        self.Vertices.append(Vertex(Position: [1,-1,-1],Color: [0,0,1,1],TexCoord: [0,0]));
        self.Vertices.append(Vertex(Position: [-1,1,-1],Color: [0,0,0,1],TexCoord: [1,1]));
        
        //Left
        self.Vertices.append(Vertex(Position: [1,-1,1],Color: [1,0,0,1],TexCoord: [1,0]));
        self.Vertices.append(Vertex(Position: [1,1,1],Color: [0,1,0,1],TexCoord: [1,1]));
        self.Vertices.append(Vertex(Position: [-1,1,1],Color: [0,0,1,1],TexCoord: [0,1]));
        self.Vertices.append(Vertex(Position: [-1,-1,1],Color: [0,0,0,1],TexCoord: [0,0]));
     
        //Right
        self.Vertices.append(Vertex(Position: [1,-1,1],Color: [1,0,0,1],TexCoord: [1,0]));
        self.Vertices.append(Vertex(Position: [1,1,1],Color: [0,1,0,1],TexCoord: [1,1]));
        self.Vertices.append(Vertex(Position: [-1,1,1],Color: [0,0,1,1],TexCoord: [0,1]));
        self.Vertices.append(Vertex(Position: [-1,-1,1],Color: [0,0,0,1],TexCoord: [0,0]));
     
        //Top
        self.Vertices.append(Vertex(Position: [1,-1,1],Color: [1,0,0,1],TexCoord: [1,0]));
        self.Vertices.append(Vertex(Position: [1,1,1],Color: [0,1,0,1],TexCoord: [1,1]));
        self.Vertices.append(Vertex(Position: [-1,1,1],Color: [0,0,1,1],TexCoord: [0,1]));
        self.Vertices.append(Vertex(Position: [-1,-1,1],Color: [0,0,0,1],TexCoord: [0,0]));
        //Bottom
        self.Vertices.append(Vertex(Position: [1,-1,1],Color: [1,0,0,1],TexCoord: [1,0]));
        self.Vertices.append(Vertex(Position: [1,1,1],Color: [0,1,0,1],TexCoord: [1,1]));
        self.Vertices.append(Vertex(Position: [-1,1,1],Color: [0,0,1,1],TexCoord: [0,1]));
        self.Vertices.append(Vertex(Position: [-1,-1,1],Color: [0,0,0,1],TexCoord: [0,0]));
        
        self.setupGL()
        //start timer that fires every second
        NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector:Selector("render"), userInfo: nil, repeats: true)
    }
    
    func render(){
        self.setNeedsDisplay()
    }
    func setupGL() {
    
    glEnable(GLenum(GL_CULL_FACE));
    
    self.effect = GLKBaseEffect()
   // var options:NSDictionary = NSDictionary(objectsAndKeys: N
        
        let options = [GLKTextureLoaderOriginBottomLeft:NSNumber(bool: false)];
        var error:NSErrorPointer = NSErrorPointer();
        
        let path:NSString = NSBundle.mainBundle().pathForResource("cog", ofType: "png")!
        
        var info:GLKTextureInfo = GLKTextureLoader.textureWithContentsOfFile(path as String, options: options, error: error)
       
        
    //GLKTextureInfo * info = [GLKTextureLoader textureWithContentsOfFile:path options:options error:&error];
    //if (info == nil) {
        //NSLog(@"Error loading file: %@", [error localizedDescription]);
    //}
        
    self.effect.texture2d0.name = info.name;
    self.effect.texture2d0.enabled = GLboolean(GL_TRUE)
    
    // New lines
    glGenVertexArraysOES(1, &_vertexArray);
    glBindVertexArrayOES(_vertexArray);
    
    // Old stuff
    glGenBuffers(1, &_vertexBuffer);
    glBindBuffer(GLenum(GL_ARRAY_BUFFER), _vertexBuffer);
    glBufferData(GLenum(GL_ARRAY_BUFFER), sizeof(Float)*9, Vertices, GLenum(GL_STATIC_DRAW));
    
    glGenBuffers(1, &_indexBuffer);
    glBindBuffer(GLenum(GL_ELEMENT_ARRAY_BUFFER), _indexBuffer);
    glBufferData(GLenum(GL_ELEMENT_ARRAY_BUFFER), sizeof(Float) * 36, Indices, GLenum(GL_STATIC_DRAW));
    
    // New lines (were previously in draw)
    
    
    
    glEnableVertexAttribArray(GLuint(GLKVertexAttrib.Position.rawValue))
    glVertexAttribPointer(GLuint(GLKVertexAttrib.Position.rawValue), 3, GLenum(GL_FLOAT), GLboolean(GL_FALSE), 24, unsafeBufferOffset(0));
    glEnableVertexAttribArray(GLuint(GLKVertexAttrib.Color.rawValue));
    glVertexAttribPointer(GLuint(GLKVertexAttrib.Color.rawValue), 4, GLenum(GL_FLOAT), GLboolean(GL_FALSE), 24, unsafeBufferOffset(12));
    glEnableVertexAttribArray(GLuint(GLKVertexAttrib.TexCoord0.rawValue));
    glVertexAttribPointer(GLuint(GLKVertexAttrib.TexCoord0.rawValue), 2, GLenum(GL_FLOAT), GLboolean(GL_FALSE), 24, unsafeBufferOffset(28));
    
    // New line
    glBindVertexArrayOES(0);
    
    }
    private func unsafeBufferOffset(size: size_t) -> UnsafePointer<Void> {
        return UnsafePointer(bitPattern: size)
    }
    
    
    override func drawRect(rect: CGRect) {
        
        glClearColor(_curRed, 6.0, 0.0, 1.0);
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT));
        
        
        
        self.effect?.prepareToDraw()
        
        glBindVertexArrayOES(_vertexArray);
        glDrawElements(GLenum(GL_TRIANGLES), 36, GLenum(GL_UNSIGNED_BYTE), nil);

        super.drawRect(rect)
    }
    
   }