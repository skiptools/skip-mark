// Copyright 2023 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
#if !SKIP
import cmark_gfm
#else
import SkipFFI
#endif

public class CMark {
    public init() {
        #if SKIP
        // cmark-gfm is provided by https://source.skip.tools/skip-cmark.git
        com.sun.jna.Native.register((CMark.self as kotlin.reflect.KClass).java, "cmark-gfm")
        #endif
    }

    // SKIP EXTERN
    public func cmark_version() -> Int32 {
        cmark_gfm.cmark_version()
    }

    // SKIP EXTERN
    public func cmark_markdown_to_html(_ text: String, _ len: Int, _ options: Int32) -> String {
        String(cString: cmark_gfm.cmark_markdown_to_html(text, len, options))
    }

//    // SKIP EXTERN
//    public func cmark_parse_document(_ buffer: String, _ len: Int, _ options: Int32) -> cmark_node_ptr? {
//        cmark_gfm.cmark_parse_document(buffer, len, options)
//    }

    // SKIP EXTERN
    public func cmark_isspace(_ c: CChar) -> Int32 {
        cmark_gfm.cmark_isspace(c)
    }

    // SKIP EXTERN
    public func cmark_ispunct(_ c: CChar) -> Int32 {
        cmark_gfm.cmark_ispunct(c)
    }

    // SKIP EXTERN
    public func cmark_isalnum(_ c: CChar) -> Int32 {
        cmark_gfm.cmark_isalnum(c)
    }

    // SKIP EXTERN
    public func cmark_isdigit(_ c: CChar) -> Int32 {
        cmark_gfm.cmark_isdigit(c)
    }

    // SKIP EXTERN
    public func cmark_isalpha(_ c: CChar) -> Int32 {
        cmark_gfm.cmark_isalpha(c)
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
