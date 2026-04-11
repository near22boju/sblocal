//
//  SBTransactionRecord.swift
//  SBLocal
//
//  Created by Sivakumar Boju on 4/10/26.
//  Copyright (c) 2026 Near 22. All rights reserved
//

import Foundation
import SwiftData

@Model
public final class SBTransactionRecord {

    //  MARK: - Properties
    @Attribute(.unique) public var id: String
    public var key: String
    public var transactionType: String
    public var merchantName: String
    public var transactionDescription: String
    public var amountValue: Double
    public var amountCurrency: String
    public var postedDate: String
    public var fromAccount: String
    public var fromCardNumber: String

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
