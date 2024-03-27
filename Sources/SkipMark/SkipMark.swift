// Copyright 2023 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org

import SkipFFI
#if !SKIP
import LibCMark
#endif

/// `DemoLibrary` is a Swift encapsulation of the embedded C library's functions and structures.
internal final class CMarkLibrary {
    /// The singleton library instance, registered using JNA to map the Kotlin functions to their native equivalents
    static let instance = registerNatives(CMarkLibrary(), frameworkName: "SkipMark", libraryName: "clibrary")

    // SKIP EXTERN
    public func cmark_version() -> Int32 {
        LibCMark.cmark_version()
    }

    // SKIP EXTERN
    public func cmark_markdown_to_html(_ text: String, _ len: Int, _ options: Int32) -> String {
        String(cString: LibCMark.cmark_markdown_to_html(text, len, options))
    }

//    // SKIP EXTERN
//    public func cmark_parse_document(_ buffer: String, _ len: Int, _ options: Int32) -> cmark_node_ptr? {
//        LibCMark.cmark_parse_document(buffer, len, options)
//    }

    // SKIP EXTERN
    public func cmark_isspace(_ c: CChar) -> Int32 {
        LibCMark.cmark_isspace(c)
    }

    // SKIP EXTERN
    public func cmark_ispunct(_ c: CChar) -> Int32 {
        LibCMark.cmark_ispunct(c)
    }

    // SKIP EXTERN
    public func cmark_isalnum(_ c: CChar) -> Int32 {
        LibCMark.cmark_isalnum(c)
    }

    // SKIP EXTERN
    public func cmark_isdigit(_ c: CChar) -> Int32 {
        LibCMark.cmark_isdigit(c)
    }

    // SKIP EXTERN
    public func cmark_isalpha(_ c: CChar) -> Int32 {
        LibCMark.cmark_isalpha(c)
    }
}

#if !SKIP
public typealias cmark_node_ptr = UnsafeMutablePointer<cmark_node>
#else
public class cmark_node_ptr : com.sun.jna.Structure {
    public init() {
    }
}
#endif
