//
//  String.swift
//  TestChanel
//
//  Created by Yasin Akinci on 09/12/2019.
//  Copyright © 2019 Yasin Akinci. All rights reserved.
//

import Foundation

extension Int {
    
    func getDateFromTimeStamp() -> String {
        let date = NSDate(timeIntervalSince1970: Double(self))
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "HH:mm:ss dd/MM/yyyy"
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
}
