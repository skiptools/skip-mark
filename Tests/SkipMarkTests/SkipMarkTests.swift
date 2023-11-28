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
        }
    }
}
