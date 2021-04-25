// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:kernel/ast.dart';
import 'package:kernel/util/graph.dart';

import 'package:front_end/src/api_unstable/vm.dart' show FileSystem;

/// Compute the strongly connected components for JavaScript compilation.
///
/// Implements a Path-based strong component algorithm.
/// See https://en.wikipedia.org/wiki/Path-based_strong_component_algorithm
///
/// The file URI for each library is used as an identifier for the module
/// name. [moduleAssignment] will be populated with a mapping of library URI to
/// module name, while [modules] will be populated with a mapping of module
/// name to library set.
///
/// JavaScript import semantics do not permit circular imports in the same
/// manner that Dart does. When compiling a set of libraries with circular
/// imports, these must be combined into a single JavaScript module.
///
/// On incremental updates, we completely recompute the strongly connected
/// components, but only for the partial component produced.
class StrongComponents {
  StrongComponents(
    this.component,
    this.loadedLibraries,
    this.mainUri, [
    this.fileSystem,
  ]);

  /// The Component that is being compiled.
  ///
  /// On incremental compiles, this will only contain the invalidated
  /// lbraries.
  final Component component;

  /// The libraries loaded from a dill file that should not be processed.
  final Set<Library> loadedLibraries;

  /// The main URI for thiis application.
  final Uri mainUri;

  /// The filesystem instance for resolving files.
  final FileSystem fileSystem;

  /// The set of libraries for each module URI.
  ///
  /// This is populated after calling [computeModules] once.
  final Map<Uri, List<Library>> modules = <Uri, List<Library>>{};

  /// The module URI for each library file URI.
  ///
  /// This is populated after calling [computeModules] once.
  final Map<Uri, Uri> moduleAssignment = <Uri, Uri>{};

  /// Compute the strongly connected components for the current program.
  ///
  /// Allows providing a set of libraries to replace what is defined in the component
  /// via [patchComponent]. When traversing the import graph, instead of loading
  /// the library defined in a [LibraryDependency], if present the library in
  /// the patch component will replace it.
  ///
  /// Throws an [Exception] if [mainUri] cannot be located in the given
  /// component.
  Future<void> computeModules([Map<Uri, Library> patchComponent]) async {
    assert(modules.isEmpty);
    if (component.libraries.isEmpty) {
      return;
    }
    Library entrypoint = component.libraries.firstWhere(
        (Library library) =>
            library.fileUri == mainUri || library.importUri == mainUri,
        orElse: () => null);

    if (entrypoint == null) {
      throw Exception('Could not find entrypoint ${mainUri} in Component.');
    }

    final List<List<Library>> results = computeStrongComponents(
        _LibraryGraph(entrypoint, loadedLibraries, patchComponent));
    for (List<Library> component in results) {
      assert(component.length > 0);
      final Uri moduleUri = component
          .firstWhere((lib) => lib.importUri == mainUri,
              orElse: () => component.first)
          .importUri;
      modules[moduleUri] = component;
      for (Library componentLibrary in component) {
        moduleAssignment[componentLibrary.importUri] = moduleUri;
      }
    }
  }
}

class _LibraryGraph implements Graph<Library> {
  _LibraryGraph(this.library, this.loadedLibraries, [this._patchComponent]);

  final Map<Uri, Library> _patchComponent;
  final Library library;
  final Set<Library> loadedLibraries;

  @override
  Iterable<Library> neighborsOf(Library vertex) {
    return <Library>[
      for (LibraryDependency dependency in vertex.dependencies)
        if (!loadedLibraries.contains(dependency.targetLibrary) &&
            dependency.targetLibrary.importUri.scheme != 'dart')
          _patchComponent == null
              ? dependency.targetLibrary
              : _patchComponent[dependency.targetLibrary.importUri] ??
                  dependency.targetLibrary,
    ];
  }

  @override
  Iterable<Library> get vertices => <Library>[library];
}
