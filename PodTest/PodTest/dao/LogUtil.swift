//
//  LogUtil.swift
//  PodTest
//
//  Created by Zemise on 2024/10/16.
//

import Foundation

public class LogUtil {
    private static let patternError = "[Test] ERROR %@"
    private static let patternInfo = "[Test] INFO %@"
    
    public class func logInfo(string: String, parameters: String?...) {
        let logcontent = String(format: string, parameters)
        NSLog(patternInfo, logcontent)
    }
   
    public class func logError(string: String, parameters: String?...) {
        let logcontent = String(format: string, parameters)
        NSLog(patternError, logcontent)
    }
}
