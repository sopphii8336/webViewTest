//
//  FileBuilder.swift
//  webViewTest
//
//  Created by etrex kuo on 2015/3/19.
//  Copyright (c) 2015年 etrex. All rights reserved.
//

import UIKit

class FileFunc: NSObject {
    class func CheckFileInDocument(name:String)->Bool{
        var documentsPath:NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)![0] as NSString
        
        var file = documentsPath.stringByAppendingPathComponent(name)
        var fileExists = NSFileManager.defaultManager().fileExistsAtPath(file)
        return fileExists
    }
    
    class func CopyFileToDocument(name:String,ofType:String)->String{
        let filemanager = NSFileManager.defaultManager()
        
        let documentsPath : AnyObject = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask,true)[0]
        let destinationPath:NSString = documentsPath.stringByAppendingString("/\(name).\(ofType)")
        
        if(!filemanager.fileExistsAtPath(destinationPath) ){
            
            let fileForCopy = NSBundle.mainBundle().pathForResource(name,ofType:ofType)
            filemanager.copyItemAtPath(fileForCopy!,toPath:destinationPath, error: nil)
            
            return destinationPath
        }
        else{
            return destinationPath
        }
    }
    
    class func GetUrl(path:String)->NSURL{
        var paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        var documentsDirectory:NSString = paths[0] as? NSString ?? ""
        //println("documentsDirectory = \(documentsDirectory)")
        var filePath = documentsDirectory.stringByAppendingPathComponent(path)
        //println("filePath = \(filePath)")
        var url = NSURL(string:filePath )
        var urlString = url?.absoluteString
        var encodedString = (urlString?.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding))!
        //println("encodedString = \(encodedString)")
        var webUrl = NSURL(fileURLWithPath: encodedString)!
        return webUrl
    }
}
