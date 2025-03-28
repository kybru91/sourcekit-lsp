//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2018 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

package import Foundation

extension FileManager {
  /// Creates files from a dictionary of path to contents.
  ///
  /// - parameters:
  ///   - root: The root directory that the paths are relative to.
  ///   - files: Dictionary from path (relative to root) to contents.
  package func createFiles(root: URL, files: [String: String]) throws {
    for (path, contents) in files {
      let path = URL(fileURLWithPath: path, relativeTo: root)
      try createDirectory(at: path.deletingLastPathComponent(), withIntermediateDirectories: true)
      try contents.write(to: path, atomically: true, encoding: .utf8)
    }
  }
}
