//
//  SBTransactionRecord+Entity.swift
//  SBLocal
//
//  Created by Sivakumar Boju on 4/10/26.
//  Copyright (c) 2026 Near 22. All rights reserved
//

import Foundation

public extension SBTransactionRecord {

    //  MARK: - Mapping

    func toEntity() -> SBTransactionEntity {
        SBTransactionEntity(
            id: id,
            key: key,
            transactionType: transactionType,
            merchantName: merchantName,
            transactionDescription: transactionDescription,
            amountValue: amountValue,
            amountCurrency: amountCurrency,
            postedDate: postedDate,
            fromAccount: fromAccount,
            fromCardNumber: fromCardNumber
        )
    }
}
