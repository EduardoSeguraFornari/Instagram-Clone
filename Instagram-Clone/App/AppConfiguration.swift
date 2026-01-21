//
//  AppConfiguration.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 21/01/26.
//

import Foundation

struct AppConfiguration {
    static var useMockServices: Bool {
        if isPreview {
            return true
        } else {
            if isDebug {
                if isSimulator { // debug on simulator
                    return true
                } else { // debug on device
                    return false
                }
            } else { // production
                return false
            }
        }
    }
    
    static var isPreview: Bool {
        ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
    
    static var isSimulator: Bool {
        #if targetEnvironment(simulator)
            return true
        #else
            return false
        #endif
    }
    
    static var isDebug: Bool {
        #if DEBUG
            return true
        #else
            return false
        #endif
    }
}
