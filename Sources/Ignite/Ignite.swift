//
// Ignite.swift
// Ignite
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//
import Foundation

/// The location the the Ignite bundle. Used to access resources.
public let bundle: Bundle = {
    let bundleName = "Ignite_Ignite.bundle"
    let candidates = [Bundle.main.resourceURL, Bundle.main.bundleURL].compactMap { $0 }
    for base in candidates {
        if let found = Bundle(url: base.appendingPathComponent(bundleName)) { return found }
    }
    return Bundle.module
}()

/// The current version. Used to write generator information.
public let version = "Ignite v0.6.0"
