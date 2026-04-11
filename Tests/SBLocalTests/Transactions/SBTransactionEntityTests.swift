//
//  SBTransactionEntityTests.swift
//  SBLocal
//
//  Created by Sivakumar Boju on 4/10/26.
//  Copyright (c) 2026 Near 22. All rights reserved
//

import XCTest
@testable import SBLocal

final class SBTransactionEntityTests: XCTestCase {

    func test_init_setsProperties() {
        let entity = makeEntity()

        XCTAssertEqual(entity.id, "txn_1")
        XCTAssertEqual(entity.key, "txn_1")
        XCTAssertEqual(entity.transactionType, "debit")
        XCTAssertEqual(entity.merchantName, "Mb - Cash Advance To - 1785")
        XCTAssertEqual(entity.transactionDescription, "Bill payment")
        XCTAssertEqual(entity.amountValue, 200.20)
        XCTAssertEqual(entity.amountCurrency, "CAD")
        XCTAssertEqual(entity.postedDate, "2021-05-31")
        XCTAssertEqual(entity.fromAccount, "Momentum Regular Visa")
        XCTAssertEqual(entity.fromCardNumber, "4537350001688012")
    }

    func test_equatable_sameValues_areEqual() {
        let lhs = makeEntity()
        let rhs = makeEntity()

        XCTAssertEqual(lhs, rhs)
    }

    func test_equatable_differentIds_areNotEqual() {
        let lhs = makeEntity(id: "txn_1")
        let rhs = makeEntity(id: "txn_2")

        XCTAssertNotEqual(lhs, rhs)
    }

    func test_identifiable_idMatchesExpectedValue() {
        let entity = makeEntity(id: "txn_123")

        XCTAssertEqual(entity.id, "txn_123")
    }

    func test_transactionDescription_canBeEmpty() {
        let entity = makeEntity(transactionDescription: "")

        XCTAssertEqual(entity.transactionDescription, "")
    }
}

// MARK: - Helpers

private extension SBTransactionEntityTests {
    func makeEntity(
        id: String = "txn_1",
        key: String = "txn_1",
        transactionType: String = "debit",
        merchantName: String = "Mb - Cash Advance To - 1785",
        transactionDescription: String = "Bill payment",
        amountValue: Double = 200.20,
        amountCurrency: String = "CAD",
        postedDate: String = "2021-05-31",
        fromAccount: String = "Momentum Regular Visa",
        fromCardNumber: String = "4537350001688012"
    ) -> SBTransactionEntity {
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
