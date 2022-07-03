//
//  StringExtention.swift
//  AR-Quest
//
//  Created by Madushan Senavirathna on 6/12/22.
//

import Foundation
import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}

