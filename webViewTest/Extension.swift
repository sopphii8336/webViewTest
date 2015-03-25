//
//  Extension.swift
//  webViewTest
//
//  Created by etrex kuo on 2015/3/25.
//  Copyright (c) 2015年 etrex. All rights reserved.
//

import UIKit

extension String{
    func substringFromIndex(from:Int)->String{
        var nsstring = self as NSString
        return nsstring.substringFromIndex(from)
    }
}
