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
}
