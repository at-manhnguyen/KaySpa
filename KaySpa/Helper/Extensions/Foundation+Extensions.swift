//
//  Foundation+Extensions.swift
//  XinChao
//
//  Created by Nguyen Quang Manh on 11/3/17.
//  Copyright © 2017 Vinmas. All rights reserved.
//

import UIKit

// MARK: - Fundamentals
extension String {
    
    //: ### Base64 encoding a string
    func base64Encoded() -> String? {
        if let data = self.data(using: .utf8) {
            return data.base64EncodedString()
        }
        return nil
    }
    
    //: ### Base64 decoding a string
    func base64Decoded() -> String? {
        if let data = Data(base64Encoded: self) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
    
    func date(formatter: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        return dateFormatter.date(from: self) ?? Date()
    }
}

extension Int {
    var minute: Int {
        return self%60
    }
    var hour: Int {
        return self/60/60
    }
    var second: Int {
        return self
    }
    var day: Int {
        return self/60/60/24
    }
    var usd: Int {
        return self/23000
    }
    var decimalStyle: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value:self)) ?? ""
    }
}

// MARK: - Date
extension Date {
    var yesterday: Date {
        guard let date = Calendar.current.date(byAdding: .day, value: -1, to: self) else { return Date() }
        return date
    }
    var tomorrow: Date {
        guard let date = Calendar.current.date(byAdding: .day, value: 1, to: self) else { return Date() }
        return date
    }
    var noon: Date {
        guard let date = Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self) else { return Date() }
        return date
    }
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    var isLastDayOfMonth: Bool {
        return tomorrow.month != month
    }
    var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }
    var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }
    var second: Int {
        return Calendar.current.component(.second, from: self)
    }
    
    func dateString(formatterString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = formatterString
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        let dateString = formatter.string(from: self)
        return dateString
    }
    
    func durationTime(to endDate: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: Calendar.current.startOfDay(for: self), to: Calendar.current.startOfDay(for: endDate)).day ?? 0
    }
}

// MARK: - App Support

// MARK: - Files and Data Persistence

// MARK: - Networking

// MARK: - Low-Level Utilities



