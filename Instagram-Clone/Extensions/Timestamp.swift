//
//  Timestamp.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 26/01/26.
//

import Firebase

extension Timestamp {
    var timestampString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
    }
}
