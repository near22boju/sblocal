//
//  SBSwiftDataTransactionLocalRepositoryTests.swift
//  SBLocal
//
//  Created by Sivakumar Boju on 4/10/26.
//  Copyright (c) 2026 Near 22. All rights reserved
//

import XCTest
import SwiftData
@testable import SBLocal
import SBDomain

final class SBSwiftDataTransactionLocalRepositoryTests: XCTestCase {

    //  MARK: - Read

    func test_fetchAll_returnsEmptyArray_whenStorageIsEmpty() async throws {
        let sut = try makeSUT()

        let transactions = try await sut.fetchAll()

        XCTAssertTrue(transactions.isEmpty)
    }

    func test_fetchAll_returnsSavedTransaction() async throws {
        let sut = try makeSUT()
        let transaction = makeTransaction(id: "txn_1")

        try await sut.save(transaction)

        let transactions = try await sut.fetchAll()

        XCTAssertEqual(transactions.count, 1)
        XCTAssertEqual(transactions.first, transaction)
    }

    //  MARK: - Write

    func test_save_singleTransaction_persistsTransaction() async throws {
        let sut = try makeSUT()
        let transaction = makeTransaction(id: "txn_1")

        try await sut.save(transaction)

        let transactions = try await sut.fetchAll()

        XCTAssertEqual(transactions.count, 1)
        XCTAssertEqual(transactions.first, transaction)
    }

    func test_save_multipleTransactions_persistsAllTransactions() async throws {
        let sut = try makeSUT()
        let first = makeTransaction(id: "txn_1")
        let second = makeTransaction(id: "txn_2")

        try await sut.save([first, second])

        let transactions = try await sut.fetchAll()

        XCTAssertEqual(transactions.count, 2)
        XCTAssertTrue(transactions.contains(first))
        XCTAssertTrue(transactions.contains(second))
    }

    func test_save_updatesExistingTransaction_whenIdsMatch() async throws {
        let sut = try makeSUT()

        let original = makeTransaction(
            id: "txn_1",
            merchantName: "Original Merchant",
            description: "Original Description"
        )

        let updated = makeTransaction(
            id: "txn_1",
            merchantName: "Updated Merchant",
            description: "Updated Description"
        )

        try await sut.save(original)
        try await sut.save(updated)

        let transactions = try await sut.fetchAll()

        XCTAssertEqual(transactions.count, 1)
        XCTAssertEqual(transactions.first, updated)
    }

    //  MARK: - Delete

    func test_deleteAll_removesAllTransactions() async throws {
        let sut = try makeSUT()
        let first = makeTransaction(id: "txn_1")
        let second = makeTransaction(id: "txn_2")

        try await sut.save([first, second])

        try await sut.deleteAll()

        let transactions = try await sut.fetchAll()

        XCTAssertTrue(transactions.isEmpty)
    }
}

// MARK: - Helpers

private extension SBSwiftDataTransactionLocalRepositoryTests {
    func makeSUT() throws -> SBSwiftDataTransactionLocalRepository {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(
            for: SBTransactionRecord.self,
            configurations: configuration
        )
        let context = ModelContext(container)
        return SBSwiftDataTransactionLocalRepository(modelContext: context)
    }

    func makeTransaction(
        id: String = "txn_1",
        key: String? = nil,
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
            key: key ?? id,
            type: type,
            merchantName: merchantName,
            description: description,
            amount: amount,
            postedDate: postedDate,
            fromAccount: fromAccount,
            fromCardNumber: fromCardNumber
        )
    }
}
