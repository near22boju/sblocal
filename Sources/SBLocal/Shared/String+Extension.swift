//  String+Extension.swift
//  SBLocal
//
//  Created by Sivakumar Boju on 4/10/26.
//  Copyright (c) 2026 Near 22. All rights reserved
//

import Foundation

public extension String {
    var localizedLocal: String {
        NSLocalizedString(self, bundle: Bundle.module, comment: "")
    }

    func localizedLocal(with arguments:CVarArg...)->String {
        return String(format: localizedLocal, arguments: arguments)
    }
    
    func localized(with arguments: [CVarArg]) -> String {
        String(format: self.localizedLocal, arguments: arguments)
    }
}
