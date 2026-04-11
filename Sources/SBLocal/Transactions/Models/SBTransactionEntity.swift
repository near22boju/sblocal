//
//  SBTransactionEntity.swift
//  SBLocal
//
//  Created by Sivakumar Boju on 4/10/26.
//  Copyright (c) 2026 Near 22. All rights reserved
//

import Foundation

public struct SBTransactionEntity: Sendable, Equatable, Identifiable {

    //  MARK: - Properties
    public let id: String
    public let key: String
    public let transactionType: String
    public let merchantName: String
    public let transactionDescription: String
    public let amountValue: Double
    public let amountCurrency: String
    public let postedDate: String
    public let fromAccount: String
    public let fromCardNumber: String

    //  MARK: - Initialization
    public init(
        id: String,
        key: String,
        transactionType: String,
        merchantName: String,
        transactionDescription: String,
        amountValue: Double,
        amountCurrency: String,
        postedDate: String,
        fromAccount: String,
        fromCardNumber: String
    ) {
        self.id = id
        self.key = key
        self.transactionType = transactionType
        self.merchantName = merchantName
        self.transactionDescription = transactionDescription
        self.amountValue = amountValue
        self.amountCurrency = amountCurrency
        self.postedDate = postedDate
        self.fromAccount = fromAccount
        self.fromCardNumber = fromCardNumber
    }
}
