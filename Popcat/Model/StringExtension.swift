//
//  StringExtension.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/07/05.
//

import Foundation

extension String {
     var localized: String {
           return NSLocalizedString(self, tableName: "Localizable", value: self, comment: "")
        }
}

