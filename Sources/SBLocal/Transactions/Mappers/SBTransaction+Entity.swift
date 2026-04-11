//
//  SBTransaction+Entity.swift
//  SBLocal
//
//  Created by Sivakumar Boju on 4/10/26.
//  Copyright (c) 2026 Near 22. All rights reserved
//

import Foundation
import SBDomain

public extension SBTransaction {

    //  MARK: - Mapping

    func toEntity() -> SBTransactionEntity {
        SBTransactionEntity(
            id: id,
            key: key,
            transactionType: type.rawValue,
            merchantName: merchantName,
            transactionDescription: description,
            amountValue: amount.value,
            amountCurrency: amount.currency,
            postedDate: postedDate,
            fromAccount: fromAccount,
            fromCardNumber: fromCardNumber
        )
    }
}
