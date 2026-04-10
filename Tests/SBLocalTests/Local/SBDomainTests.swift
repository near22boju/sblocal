//  SBDomainTests.swift
//  sblocal
//
//  Created by Sivakumar Boju on 4/10/26.
//  Copyright (c) 2026 Near 22. All rights reserved
//

import XCTest
@testable import SBLocal

final class SBLocalTests: XCTestCase {
    func testInitializesSuccessfully() {
        let local = SBLocal()
        XCTAssertNotNil(local)
    }
}
