//
//  SBTransactionMappingTests.swift
//  SBLocal
//
//  Created by Sivakumar Boju on 4/10/26.
//  Copyright (c) 2026 Near 22. All rights reserved
//

import XCTest
@testable import SBLocal
import SBDomain

final class SBTransactionMappingTests: XCTestCase {

    //  MARK: - Domain to Entity

    func test_toEntity_mapsDomainToEntity() {
        let domain = makeDomain()

        let entity = domain.toEntity()

        XCTAssertEqual(entity.id, domain.id)
        XCTAssertEqual(entity.key, domain.key)
        XCTAssertEqual(entity.transactionType, domain.type.rawValue)
        XCTAssertEqual(entity.merchantName, domain.merchantName)
        XCTAssertEqual(entity.transactionDescription, domain.description)
        XCTAssertEqual(entity.amountValue, domain.amount.value)
        XCTAssertEqual(entity.amountCurrency, domain.amount.currency)
        XCTAssertEqual(entity.postedDate, domain.postedDate)
        XCTAssertEqual(entity.fromAccount, domain.fromAccount)
        XCTAssertEqual(entity.fromCardNumber, domain.fromCardNumber)
    }

    //  MARK: - Entity to Domain

    func test_toDomain_mapsEntityToDomain() {
        let entity = makeEntity()

        let domain = entity.toDomain()

        XCTAssertEqual(domain.id, entity.id)
        XCTAssertEqual(domain.key, entity.key)
        XCTAssertEqual(domain.type, .debit)
        XCTAssertEqual(domain.merchantName, entity.merchantName)
        XCTAssertEqual(domain.description, entity.transactionDescription)
        XCTAssertEqual(domain.amount.value, entity.amountValue)
        XCTAssertEqual(domain.amount.currency, entity.amountCurrency)
        XCTAssertEqual(domain.postedDate, entity.postedDate)
        XCTAssertEqual(domain.fromAccount, entity.fromAccount)
        XCTAssertEqual(domain.fromCardNumber, entity.fromCardNumber)
    }

    func test_toDomain_defaultsToDebit_whenTransactionTypeIsInvalid() {
        let entity = makeEntity(transactionType: "invalid_type")

        let domain = entity.toDomain()

        XCTAssertEqual(domain.type, .debit)
    }

    //  MARK: - Round Trip

    func test_roundTrip_domainToEntityToDomain_preservesValues() {
        let original = makeDomain()

        let mapped = original.toEntity().toDomain()

        XCTAssertEqual(mapped, original)
    }

    func test_roundTrip_entityToDomainToEntity_preservesValues() {
        let original = makeEntity()

        let mapped = original.toDomain().toEntity()

        XCTAssertEqual(mapped, original)
    }
}

// MARK: - Helpers

private extension SBTransactionMappingTests {
    func makeDomain(
        id: String = "txn_1",
        key: String = "txn_1",
        type: SBTransactionType = .debit,
        merchantName: String = "Mb - Cash Advance To - 1785",
        description: String = "Bill payment",
        amount: SBMoney = SBMoney(value: 200.20, currency: "CAD"),
        postedDate: String = "2021-05-31",
        fromAccount: String = "Momentum Regular Visa",
        fromCardNumber: String = "4537350001688012"
    ) -> SBTransaction {
        SBTransaction(
            id: id,
            key: key,
            type: type,
            merchantName: merchantName,
            description: description,
            amount: amount,
            postedDate: postedDate,
            fromAccount: fromAccount,
            fromCardNumber: fromCardNumber
        )
    }

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
