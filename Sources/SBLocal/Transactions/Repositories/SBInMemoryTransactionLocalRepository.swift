//
//  SBInMemoryTransactionLocalRepository.swift
//  SBLocal
//
//  Created by Sivakumar Boju on 4/10/26.
//  Copyright (c) 2026 Near 22. All rights reserved
//

import Foundation
import SBDomain

public actor SBInMemoryTransactionLocalRepository: SBTransactionLocalRepository {

    //  MARK: - Properties
    private var storage: [String: SBTransactionEntity]

    //  MARK: - Initialization
    public init(storage: [String: SBTransactionEntity] = [:]) {
        self.storage = storage
    }

    //  MARK: - Read
    public func fetchAll() async throws -> [SBTransaction] {
        storage.values
            .map { $0.toDomain() }
            .sorted { $0.postedDate > $1.postedDate }
    }

    //  MARK: - Write
    public func save(_ transaction: SBTransaction) async throws {
        let entity = transaction.toEntity()
        storage[entity.id] = entity
    }

    public func save(_ transactions: [SBTransaction]) async throws {
        for transaction in transactions {
            try await save(transaction)
        }
    }

    //  MARK: - Delete
    public func deleteAll() async throws {
        storage.removeAll()
    }
}
