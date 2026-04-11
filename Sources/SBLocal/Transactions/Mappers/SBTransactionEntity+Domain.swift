//
//  SBTransactionEntity+Domain.swift
//  SBLocal
//
//  Created by Sivakumar Boju on 4/10/26.
//  Copyright (c) 2026 Near 22. All rights reserved
//

import Foundation
import SBDomain

public extension SBTransactionEntity {

    //  MARK: - Mapping

    func toDomain() -> SBTransaction {
        SBTransaction(
            id: id,
            key: key,
            type: SBTransactionType(rawValue: transactionType) ?? .debit,
            merchantName: merchantName,
            description: transactionDescription,
            amount: SBMoney(
                value: amountValue,
                currency: amountCurrency
            ),
            postedDate: postedDate,
            fromAccount: fromAccount,
            fromCardNumber: fromCardNumber
        )
    }
}
