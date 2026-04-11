//
//  SBTransactionRecordMappingTests.swift
//  SBLocal
//
//  Created by Sivakumar Boju on 4/10/26.
//  Copyright (c) 2026 Near 22. All rights reserved
//

import XCTest
@testable import SBLocal

final class SBTransactionRecordMappingTests: XCTestCase {

    //  MARK: - Entity to Record

    func test_toRecord_mapsEntityToRecord() {
        let entity = makeEntity()

        let record = entity.toRecord()

        XCTAssertEqual(record.id, entity.id)
        XCTAssertEqual(record.key, entity.key)
        XCTAssertEqual(record.transactionType, entity.transactionType)
        XCTAssertEqual(record.merchantName, entity.merchantName)
        XCTAssertEqual(record.transactionDescription, entity.transactionDescription)
        XCTAssertEqual(record.amountValue, entity.amountValue)
        XCTAssertEqual(record.amountCurrency, entity.amountCurrency)
        XCTAssertEqual(record.postedDate, entity.postedDate)
        XCTAssertEqual(record.fromAccount, entity.fromAccount)
        XCTAssertEqual(record.fromCardNumber, entity.fromCardNumber)
    }

    //  MARK: - Record to Entity

    func test_toEntity_mapsRecordToEntity() {
        let record = makeRecord()

        let entity = record.toEntity()

        XCTAssertEqual(entity.id, record.id)
        XCTAssertEqual(entity.key, record.key)
        XCTAssertEqual(entity.transactionType, record.transactionType)
        XCTAssertEqual(entity.merchantName, record.merchantName)
        XCTAssertEqual(entity.transactionDescription, record.transactionDescription)
        XCTAssertEqual(entity.amountValue, record.amountValue)
        XCTAssertEqual(entity.amountCurrency, record.amountCurrency)
        XCTAssertEqual(entity.postedDate, record.postedDate)
        XCTAssertEqual(entity.fromAccount, record.fromAccount)
        XCTAssertEqual(entity.fromCardNumber, record.fromCardNumber)
    }

    //  MARK: - Round Trip

    func test_roundTrip_entityToRecordToEntity_preservesValues() {
        let original = makeEntity()

        let mapped = original.toRecord().toEntity()

        XCTAssertEqual(mapped, original)
    }
}

// MARK: - Helpers

private extension SBTransactionRecordMappingTests {
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

    func makeRecord(
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
    ) -> SBTransactionRecord {
        SBTransactionRecord(
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
