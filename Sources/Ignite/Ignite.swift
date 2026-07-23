//
// Ignite.swift
// Ignite
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//
import Foundation

/// The Ignite resource bundle. Used to access resources.
///
/// `Bundle.module` alone only resolves when the resource bundle sits next to the running
/// binary (`swift run`/`swift test`) or at `Bundle.main.bundleURL`. A host app that wraps
/// Ignite in a signed `.app` must keep resources under `Contents/Resources` to codesign
/// and notarize, so look there first, then fall back to the layouts `Bundle.module`
/// already handles.
public let bundle: Bundle = {
    let bundleName = "Ignite_Ignite.bundle"
    let candidates = [
        Bundle.main.resourceURL,   // Contents/Resources — a signed, notarizable .app
        Bundle.main.bundleURL      // the .app root, or beside a command-line executable
    ].compactMap { $0 }
    for base in candidates {
        if let found = Bundle(url: base.appendingPathComponent(bundleName)) { return found }
    }
    // Development builds, where the bundle sits beside the test/run binary.
    return Bundle.module
}()

/// The current version. Used to write generator information.
public let version = "Ignite v0.6.0"
