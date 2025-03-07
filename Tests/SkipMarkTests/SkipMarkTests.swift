// Copyright 2023–2025 Skip
// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
import XCTest
import OSLog
import Foundation
@testable import SkipMark

let logger: Logger = Logger(subsystem: "SkipMark", category: "Tests")

@available(macOS 13, macCatalyst 16, iOS 16, tvOS 16, watchOS 8, *)
final class SkipMarkTests: XCTestCase {
    func testSkipMark() throws {
        let cmark = CMarkLibrary.instance
        XCTAssertEqual(1900557, cmark.cmark_version())

        XCTAssertEqual(0, cmark.cmark_isspace(CChar(0x01)))
        XCTAssertEqual(1, cmark.cmark_isspace(CChar(0x20))) // space
        XCTAssertEqual(1, cmark.cmark_ispunct(CChar(0x21))) // exclamation
        XCTAssertEqual(1, cmark.cmark_isalnum(CChar(0x30))) // 0
        XCTAssertEqual(1, cmark.cmark_isalpha(CChar(0x7A))) // z

        do {
            let md = "```somecode```"
            XCTAssertEqual("<p><code>somecode</code></p>\n", cmark.cmark_markdown_to_html(md, md.count, 0))
        }

        do {
            let md = "# Hello, World!"
            XCTAssertEqual("<h1>Hello, World!</h1>\n", cmark.cmark_markdown_to_html(md, md.count, 0))
        }

        do {
            let md = "[Skip](https://skip.tools)"
            XCTAssertEqual("<p><a href=\"https://skip.tools\">Skip</a></p>\n", cmark.cmark_markdown_to_html(md, md.count, 0))
        }

        do {
            let md = "* Item 1\n* Item 2"
            XCTAssertEqual("<ul>\n<li>Item 1</li>\n<li>Item 2</li>\n</ul>\n", cmark.cmark_markdown_to_html(md, md.count, 0))
        }

        do { // no table extensions
//            let md = "| Column 1 | Column 2 |\n| -------- | -------- |\n| Cell 1  | Cell 2  |"
//            XCTAssertEqual("<table><thead><tr><th>Column 1</th><th>Column 2</th></tr></thead><tbody><tr><td>Cell 1</td><td>Cell 2</td></tr></tbody></table>\n", cmark.cmark_markdown_to_html(md, md.count, 0))
        }

        do {
            let md = "> This is a quote."
            XCTAssertEqual("<blockquote>\n<p>This is a quote.</p>\n</blockquote>\n", cmark.cmark_markdown_to_html(md, md.count, 0))
        }

        do {
            let md = "**This is bold text**"
            XCTAssertEqual("<p><strong>This is bold text</strong></p>\n", cmark.cmark_markdown_to_html(md, md.count, 0))

            //XCTAssertNotNil(cmark.cmark_parse_document(md, md.count, 0))
        }
    }
}
