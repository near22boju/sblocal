//
//  SBSwiftDataTransactionLocalRepository.swift
//  SBLocal
//
//  Created by Sivakumar Boju on 4/10/26.
//  Copyright (c) 2026 Near 22. All rights reserved
//

import Foundation
import SwiftData
import SBDomain

public actor SBSwiftDataTransactionLocalRepository: SBTransactionLocalRepository {

    //  MARK: - Properties
    private let modelContext: ModelContext

    //  MARK: - Initialization
    public init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    //  MARK: - Read
    public func fetchAll() async throws -> [SBTransaction] {
        let descriptor = FetchDescriptor<SBTransactionRecord>()

        let records = try modelContext.fetch(descriptor)

        return records
            .map { $0.toEntity() }
            .map { $0.toDomain() }
    }

    //  MARK: - Write
    public func save(_ transaction: SBTransaction) async throws {
        let entity = transaction.toEntity()
        let transactionID = entity.id

        let fetchDescriptor = FetchDescriptor<SBTransactionRecord>(
            predicate: #Predicate<SBTransactionRecord> { record in
                record.id == transactionID
            }
        )

        if let existingRecord = try modelContext.fetch(fetchDescriptor).first {
            existingRecord.key = entity.key
            existingRecord.transactionType = entity.transactionType
            existingRecord.merchantName = entity.merchantName
            existingRecord.transactionDescription = entity.transactionDescription
            existingRecord.amountValue = entity.amountValue
            existingRecord.amountCurrency = entity.amountCurrency
            existingRecord.postedDate = entity.postedDate
            existingRecord.fromAccount = entity.fromAccount
            existingRecord.fromCardNumber = entity.fromCardNumber
        } else {
            let record = entity.toRecord()
            modelContext.insert(record)
        }

        try modelContext.save()
    }

    public func save(_ transactions: [SBTransaction]) async throws {
        for transaction in transactions {
            try await save(transaction)
        }
    }

    //  MARK: - Delete
    public func deleteAll() async throws {
        let descriptor = FetchDescriptor<SBTransactionRecord>()
        let records = try modelContext.fetch(descriptor)

        for record in records {
            modelContext.delete(record)
        }

        try modelContext.save()
    }
}
