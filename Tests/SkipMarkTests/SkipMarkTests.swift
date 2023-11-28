// Copyright 2023 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
import XCTest
import OSLog
import Foundation
@testable import SkipMark

let logger: Logger = Logger(subsystem: "SkipMark", category: "Tests")

@available(macOS 13, macCatalyst 16, iOS 16, tvOS 16, watchOS 8, *)
final class SkipMarkTests: XCTestCase {
    func testSkipMark() throws {
        let cmark = CMark()
        XCTAssertEqual(1900544, cmark.cmark_version())
    }
}
