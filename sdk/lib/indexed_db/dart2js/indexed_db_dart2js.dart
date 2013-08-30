library dart.dom.indexed_db;

import 'dart:async';
import 'dart:html';
import 'dart:html_common';
import 'dart:typed_data';
import 'dart:_js_helper' show Creates, Returns, JSName, Null;
import 'dart:_foreign_helper' show JS;
import 'dart:_interceptors' show Interceptor, JSExtendableArray;
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// DO NOT EDIT - unless you are editing documentation as per:
// https://code.google.com/p/dart/wiki/ContributingHTMLDocumentation
// Auto-generated dart:svg library.





class _KeyRangeFactoryProvider {

  static KeyRange createKeyRange_only(/*Key*/ value) =>
      _only(_class(), _translateKey(value));

  static KeyRange createKeyRange_lowerBound(
      /*Key*/ bound, [bool open = false]) =>
      _lowerBound(_class(), _translateKey(bound), open);

  static KeyRange createKeyRange_upperBound(
      /*Key*/ bound, [bool open = false]) =>
      _upperBound(_class(), _translateKey(bound), open);

  static KeyRange createKeyRange_bound(/*Key*/ lower, /*Key*/ upper,
      [bool lowerOpen = false, bool upperOpen = false]) =>
      _bound(_class(), _translateKey(lower), _translateKey(upper),
             lowerOpen, upperOpen);

  static var _cachedClass;

  static _class() {
    if (_cachedClass != null) return _cachedClass;
    return _cachedClass = _uncachedClass();
  }

  static _uncachedClass() =>
    JS('var',
       '''window.webkitIDBKeyRange || window.mozIDBKeyRange ||
          window.msIDBKeyRange || window.IDBKeyRange''');

  static _translateKey(idbkey) => idbkey;  // TODO: fixme.

  static KeyRange _only(cls, value) =>
       JS('KeyRange', '#.only(#)', cls, value);

  static KeyRange _lowerBound(cls, bound, open) =>
       JS('KeyRange', '#.lowerBound(#, #)', cls, bound, open);

  static KeyRange _upperBound(cls, bound, open) =>
       JS('KeyRange', '#.upperBound(#, #)', cls, bound, open);

  static KeyRange _bound(cls, lower, upper, lowerOpen, upperOpen) =>
       JS('KeyRange', '#.bound(#, #, #, #)',
          cls, lower, upper, lowerOpen, upperOpen);
}

// Conversions for IDBKey.
//
// Per http://www.w3.org/TR/IndexedDB/#key-construct
//
// "A value is said to be a valid key if it is one of the following types: Array
// JavaScript objects [ECMA-262], DOMString [WEBIDL], Date [ECMA-262] or float
// [WEBIDL]. However Arrays are only valid keys if every item in the array is
// defined and is a valid key (i.e. sparse arrays can not be valid keys) and if
// the Array doesn't directly or indirectly contain itself. Any non-numeric
// properties are ignored, and thus does not affect whether the Array is a valid
// key. Additionally, if the value is of type float, it is only a valid key if
// it is not NaN, and if the value is of type Date it is only a valid key if its
// [[PrimitiveValue]] internal property, as defined by [ECMA-262], is not NaN."

// What is required is to ensure that an Lists in the key are actually
// JavaScript arrays, and any Dates are JavaScript Dates.


/**
 * Converts a native IDBKey into a Dart object.
 *
 * May return the original input.  May mutate the original input (but will be
 * idempotent if mutation occurs).  It is assumed that this conversion happens
 * on native IDBKeys on all paths that return IDBKeys from native DOM calls.
 *
 * If necessary, JavaScript Dates are converted into Dart Dates.
 */
_convertNativeToDart_IDBKey(nativeKey) {
  containsDate(object) {
    if (isJavaScriptDate(object)) return true;
    if (object is List) {
      for (int i = 0; i < object.length; i++) {
        if (containsDate(object[i])) return true;
      }
    }
    return false;  // number, string.
  }
  if (containsDate(nativeKey)) {
    throw new UnimplementedError('Key containing DateTime');
  }
  // TODO: Cache conversion somewhere?
  return nativeKey;
}

/**
 * Converts a Dart object into a valid IDBKey.
 *
 * May return the original input.  Does not mutate input.
 *
 * If necessary, [dartKey] may be copied to ensure all lists are converted into
 * JavaScript Arrays and Dart Dates into JavaScript Dates.
 */
_convertDartToNative_IDBKey(dartKey) {
  // TODO: Implement.
  return dartKey;
}



/// May modify original.  If so, action is idempotent.
_convertNativeToDart_IDBAny(object) {
  return convertNativeToDart_AcceptStructuredClone(object, mustCopy: false);
}

// TODO(sra): Add DateTime.
const String _idbKey = 'JSExtendableArray|=Object|num|String';
const _annotation_Creates_IDBKey = const Creates(_idbKey);
const _annotation_Returns_IDBKey = const Returns(_idbKey);
// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.


@DomName('IDBCursor')
@Unstable()
class Cursor extends Interceptor native "IDBCursor" {
  @DomName('IDBCursor.delete')
  Future delete() {
   try {
      return _completeRequest(_delete());
    } catch (e, stacktrace) {
      return new Future.error(e, stacktrace);
    }
  }

  @DomName('IDBCursor.value')
  Future update(value) {
   try {
      return _completeRequest(_update(value));
    } catch (e, stacktrace) {
      return new Future.error(e, stacktrace);
    }
  }

  
  @DomName('IDBCursor.direction')
  @DocsEditable()
  final String direction;

  @DomName('IDBCursor.key')
  @DocsEditable()
  @_annotation_Creates_IDBKey
  @_annotation_Returns_IDBKey
  final Object key;

  @DomName('IDBCursor.primaryKey')
  @DocsEditable()
  @_annotation_Creates_IDBKey
  @_annotation_Returns_IDBKey
  final Object primaryKey;

  @DomName('IDBCursor.source')
  @DocsEditable()
  @Creates('Null')
  @Returns('ObjectStore|Index|Null')
  final dynamic source;

  @DomName('IDBCursor.advance')
  @DocsEditable()
  void advance(int count) native;

  @JSName('delete')
  @DomName('IDBCursor.delete')
  @DocsEditable()
  Request _delete() native;

  @JSName('continue')
  @DomName('IDBCursor.continue')
  @DocsEditable()
  void next([Object key]) native;

  @DomName('IDBCursor.update')
  @DocsEditable()
  Request _update(/*any*/ value) {
    var value_1 = convertDartToNative_SerializedScriptValue(value);
    return _update_1(value_1);
  }
  @JSName('update')
  @DomName('IDBCursor.update')
  @DocsEditable()
  Request _update_1(value) native;

}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.


@DocsEditable()
@DomName('IDBCursorWithValue')
@Unstable()
class CursorWithValue extends Cursor native "IDBCursorWithValue" {
  // To suppress missing implicit constructor warnings.
  factory CursorWithValue._() { throw new UnsupportedError("Not supported"); }

  dynamic get value => _convertNativeToDart_IDBAny(this._get_value);
  @JSName('value')
  @DomName('IDBCursorWithValue.value')
  @DocsEditable()
  @annotation_Creates_SerializedScriptValue
  @annotation_Returns_SerializedScriptValue
  final dynamic _get_value;
}
// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.


@DocsEditable()
@DomName('IDBDatabase')
@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX, '15')
@SupportedBrowser(SupportedBrowser.IE, '10')
@Experimental()
@Unstable()
class Database extends EventTarget native "IDBDatabase" {
  @DomName('IDBDatabase.createObjectStore')
  @DocsEditable()
  ObjectStore createObjectStore(String name,
      {String keyPath, bool autoIncrement}) {
    var options = {};
    if (keyPath != null) {
      options['keyPath'] = keyPath;
    }
    if (autoIncrement != null) {
      options['autoIncrement'] = autoIncrement;
    }

    return _createObjectStore(name, options);
  }

  Transaction transaction(storeName_OR_storeNames, String mode) {
    if (mode != 'readonly' && mode != 'readwrite') {
      throw new ArgumentError(mode);
    }

    // TODO(sra): Ensure storeName_OR_storeNames is a string or List<String>,
    // and copy to JavaScript array if necessary.

    // Try and create a transaction with a string mode.  Browsers that expect a
    // numeric mode tend to convert the string into a number.  This fails
    // silently, resulting in zero ('readonly').
    return _transaction(storeName_OR_storeNames, mode);
  }

  Transaction transactionStore(String storeName, String mode) {
    if (mode != 'readonly' && mode != 'readwrite') {
      throw new ArgumentError(mode);
    }
    // Try and create a transaction with a string mode.  Browsers that expect a
    // numeric mode tend to convert the string into a number.  This fails
    // silently, resulting in zero ('readonly').
    return _transaction(storeName, mode);
  }

  Transaction transactionList(List<String> storeNames, String mode) {
    if (mode != 'readonly' && mode != 'readwrite') {
      throw new ArgumentError(mode);
    }
    List storeNames_1 = convertDartToNative_StringArray(storeNames);
    return _transaction(storeNames_1, mode);
  }
  
  Transaction transactionStores(DomStringList storeNames, String mode) {
    if (mode != 'readonly' && mode != 'readwrite') {
      throw new ArgumentError(mode);
    }
    return _transaction(storeNames, mode);
  }

  @JSName('transaction')
  Transaction _transaction(stores, mode) native;

  // To suppress missing implicit constructor warnings.
  factory Database._() { throw new UnsupportedError("Not supported"); }

  @DomName('IDBDatabase.abortEvent')
  @DocsEditable()
  static const EventStreamProvider<Event> abortEvent = const EventStreamProvider<Event>('abort');

  @DomName('IDBDatabase.closeEvent')
  @DocsEditable()
  // https://www.w3.org/Bugs/Public/show_bug.cgi?id=22540
  @Experimental()
  static const EventStreamProvider<Event> closeEvent = const EventStreamProvider<Event>('close');

  @DomName('IDBDatabase.errorEvent')
  @DocsEditable()
  static const EventStreamProvider<Event> errorEvent = const EventStreamProvider<Event>('error');

  @DomName('IDBDatabase.versionchangeEvent')
  @DocsEditable()
  static const EventStreamProvider<VersionChangeEvent> versionChangeEvent = const EventStreamProvider<VersionChangeEvent>('versionchange');

  @DomName('IDBDatabase.name')
  @DocsEditable()
  final String name;

  @DomName('IDBDatabase.objectStoreNames')
  @DocsEditable()
  @Returns('DomStringList')
  @Creates('DomStringList')
  final List<String> objectStoreNames;

  @DomName('IDBDatabase.version')
  @DocsEditable()
  @Creates('int|String|Null')
  @Returns('int|String|Null')
  final dynamic version;

  @DomName('IDBDatabase.close')
  @DocsEditable()
  void close() native;

  @DomName('IDBDatabase.createObjectStore')
  @DocsEditable()
  ObjectStore _createObjectStore(String name, [Map options]) {
    if (options != null) {
      var options_1 = convertDartToNative_Dictionary(options);
      return _createObjectStore_1(name, options_1);
    }
    return _createObjectStore_2(name);
  }
  @JSName('createObjectStore')
  @DomName('IDBDatabase.createObjectStore')
  @DocsEditable()
  ObjectStore _createObjectStore_1(name, options) native;
  @JSName('createObjectStore')
  @DomName('IDBDatabase.createObjectStore')
  @DocsEditable()
  ObjectStore _createObjectStore_2(name) native;

  @DomName('IDBDatabase.deleteObjectStore')
  @DocsEditable()
  void deleteObjectStore(String name) native;

  @DomName('IDBDatabase.onabort')
  @DocsEditable()
  Stream<Event> get onAbort => abortEvent.forTarget(this);

  @DomName('IDBDatabase.onclose')
  @DocsEditable()
  // https://www.w3.org/Bugs/Public/show_bug.cgi?id=22540
  @Experimental()
  Stream<Event> get onClose => closeEvent.forTarget(this);

  @DomName('IDBDatabase.onerror')
  @DocsEditable()
  Stream<Event> get onError => errorEvent.forTarget(this);

  @DomName('IDBDatabase.onversionchange')
  @DocsEditable()
  Stream<VersionChangeEvent> get onVersionChange => versionChangeEvent.forTarget(this);
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.


@DomName('IDBFactory')
@SupportedBrowser(SupportedBrowser.CHROME)
@SupportedBrowser(SupportedBrowser.FIREFOX, '15')
@SupportedBrowser(SupportedBrowser.IE, '10')
@Experimental()
@Unstable()
class IdbFactory extends Interceptor native "IDBFactory" {
  /**
   * Checks to see if Indexed DB is supported on the current platform.
   */
  static bool get supported {
    return JS('bool',
        '!!(window.indexedDB || '
        'window.webkitIndexedDB || '
        'window.mozIndexedDB)');
  }

  @DomName('IDBFactory.open')
  Future<Database> open(String name,
      {int version, void onUpgradeNeeded(VersionChangeEvent),
      void onBlocked(Event)}) {
    if ((version == null) != (onUpgradeNeeded == null)) {
      return new Future.error(new ArgumentError(
          'version and onUpgradeNeeded must be specified together'));
    }
    try {
      var request;
      if (version != null) {
        request = _open(name, version);
      } else {
        request = _open(name);
      }

      if (onUpgradeNeeded != null) {
        request.onUpgradeNeeded.listen(onUpgradeNeeded);
      }
      if (onBlocked != null) {
        request.onBlocked.listen(onBlocked);
      }
      return _completeRequest(request);
    } catch (e, stacktrace) {
      return new Future.error(e, stacktrace);
    }
  }

  @DomName('IDBFactory.deleteDatabase')
  Future<IdbFactory> deleteDatabase(String name,
      {void onBlocked(Event)}) {
    try {
      var request = _deleteDatabase(name);

      if (onBlocked != null) {
        request.onBlocked.listen(onBlocked);
      }
      var completer = new Completer.sync();
      request.onSuccess.listen((e) {
        completer.complete(this);
      });
      request.onError.listen((e) {
        completer.completeError(e);
      });
      return completer.future;
    } catch (e, stacktrace) {
      return new Future.error(e, stacktrace);
    }
  }

  @DomName('IDBFactory.getDatabaseNames')
  @SupportedBrowser(SupportedBrowser.CHROME)
  @Experimental()
  Future<List<String>> getDatabaseNames() {
    try {
      var request = _webkitGetDatabaseNames();

      return _completeRequest(request);
    } catch (e, stacktrace) {
      return new Future.error(e, stacktrace);
    }
  }

  /**
   * Checks to see if getDatabaseNames is supported by the current platform.
   */
  bool get supportsDatabaseNames {
    return supported && JS('bool',
        '!!(#.getDatabaseNames || #.webkitGetDatabaseNames)', this, this);
  }


  @DomName('IDBFactory.cmp')
  @DocsEditable()
  int cmp(Object first, Object second) native;

  @JSName('deleteDatabase')
  @DomName('IDBFactory.deleteDatabase')
  @DocsEditable()
  OpenDBRequest _deleteDatabase(String name) native;

  @JSName('open')
  @DomName('IDBFactory.open')
  @DocsEditable()
  @Returns('Request')
  @Creates('Request')
  @Creates('Database')
  OpenDBRequest _open(String name, [int version]) native;

  @JSName('webkitGetDatabaseNames')
  @DomName('IDBFactory.webkitGetDatabaseNames')
  @DocsEditable()
  @SupportedBrowser(SupportedBrowser.CHROME)
  @SupportedBrowser(SupportedBrowser.SAFARI)
  @Experimental()
  @Returns('Request')
  @Creates('Request')
  @Creates('DomStringList')
  Request _webkitGetDatabaseNames() native;

}


/**
 * Ties a request to a completer, so the completer is completed when it succeeds
 * and errors out when the request errors.
 */
Future _completeRequest(Request request) {
  var completer = new Completer.sync();
  // TODO: make sure that completer.complete is synchronous as transactions
  // may be committed if the result is not processed immediately.
  request.onSuccess.listen((e) {
    completer.complete(request.result);
  });
  request.onError.listen((e) {
    completer.completeError(e);
  });
  return completer.future;
}
// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.


@DomName('IDBIndex')
@Unstable()
class Index extends Interceptor native "IDBIndex" {
  @DomName('IDBIndex.count')
  Future<int> count([key_OR_range]) {
   try {
      var request = _count(key_OR_range);
      return _completeRequest(request);
    } catch (e, stacktrace) {
      return new Future.error(e, stacktrace);
    }
  }

  @DomName('IDBIndex.get')
  Future get(key) {
    try {
      var request = _get(key);

      return _completeRequest(request);
    } catch (e, stacktrace) {
      return new Future.error(e, stacktrace);
    }
  }

  @DomName('IDBIndex.getKey')
  Future getKey(key) {
    try {
      var request = _getKey(key);

      return _completeRequest(request);
    } catch (e, stacktrace) {
      return new Future.error(e, stacktrace);
    }
  }

  /**
   * Creates a stream of cursors over the records in this object store.
   *
   * See also:
   *
   * * [ObjectStore.openCursor]
   */
  Stream<CursorWithValue> openCursor({key, KeyRange range, String direction,
      bool autoAdvance}) {
    var key_OR_range = null;
    if (key != null) {
      if (range != null) {
        throw new ArgumentError('Cannot specify both key and range.');
      }
      key_OR_range = key;
    } else {
      key_OR_range = range;
    }
    var request = _openCursor(key_OR_range, direction);
    return ObjectStore._cursorStreamFromResult(request, autoAdvance);
  }

  /**
   * Creates a stream of cursors over the records in this object store.
   *
   * See also:
   *
   * * [ObjectStore.openCursor]
   */
  Stream<Cursor> openKeyCursor({key, KeyRange range, String direction,
      bool autoAdvance}) {
    var key_OR_range = null;
    if (key != null) {
      if (range != null) {
        throw new ArgumentError('Cannot specify both key and range.');
      }
      key_OR_range = key;
    } else {
      key_OR_range = range;
    }
    var request = _openKeyCursor(key_OR_range, direction);
    return ObjectStore._cursorStreamFromResult(request, autoAdvance);
  }

  
  @DomName('IDBIndex.keyPath')
  @DocsEditable()
  @annotation_Creates_SerializedScriptValue
  final dynamic keyPath;

  @DomName('IDBIndex.multiEntry')
  @DocsEditable()
  final bool multiEntry;

  @DomName('IDBIndex.name')
  @DocsEditable()
  final String name;

  @DomName('IDBIndex.objectStore')
  @DocsEditable()
  final ObjectStore objectStore;

  @DomName('IDBIndex.unique')
  @DocsEditable()
  final bool unique;

  @JSName('count')
  @DomName('IDBIndex.count')
  @DocsEditable()
  Request _count(Object key) native;

  @JSName('get')
  @DomName('IDBIndex.get')
  @DocsEditable()
  @Returns('Request')
  @Creates('Request')
  @annotation_Creates_SerializedScriptValue
  Request _get(Object key) native;

  @JSName('getKey')
  @DomName('IDBIndex.getKey')
  @DocsEditable()
  @Returns('Request')
  @Creates('Request')
  @annotation_Creates_SerializedScriptValue
  @Creates('ObjectStore')
  Request _getKey(Object key) native;

  @JSName('openCursor')
  @DomName('IDBIndex.openCursor')
  @DocsEditable()
  @Returns('Request')
  @Creates('Request')
  @Creates('Cursor')
  Request _openCursor(Object key, String direction) native;

  @JSName('openKeyCursor')
  @DomName('IDBIndex.openKeyCursor')
  @DocsEditable()
  @Returns('Request')
  @Creates('Request')
  @Creates('Cursor')
  Request _openKeyCursor(Object key, String direction) native;

}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.


@DomName('IDBKeyRange')
@Unstable()
class KeyRange extends Interceptor native "IDBKeyRange" {
  @DomName('IDBKeyRange.only')
  factory KeyRange.only(/*Key*/ value) =>
      _KeyRangeFactoryProvider.createKeyRange_only(value);

  @DomName('IDBKeyRange.lowerBound')
  factory KeyRange.lowerBound(/*Key*/ bound, [bool open = false]) =>
      _KeyRangeFactoryProvider.createKeyRange_lowerBound(bound, open);

  @DomName('IDBKeyRange.upperBound')
  factory KeyRange.upperBound(/*Key*/ bound, [bool open = false]) =>
      _KeyRangeFactoryProvider.createKeyRange_upperBound(bound, open);

  @DomName('KeyRange.bound')
  factory KeyRange.bound(/*Key*/ lower, /*Key*/ upper,
                            [bool lowerOpen = false, bool upperOpen = false]) =>
      _KeyRangeFactoryProvider.createKeyRange_bound(
          lower, upper, lowerOpen, upperOpen);


  @DomName('IDBKeyRange.lower')
  @DocsEditable()
  @annotation_Creates_SerializedScriptValue
  final Object lower;

  @DomName('IDBKeyRange.lowerOpen')
  @DocsEditable()
  final bool lowerOpen;

  @DomName('IDBKeyRange.upper')
  @DocsEditable()
  @annotation_Creates_SerializedScriptValue
  final Object upper;

  @DomName('IDBKeyRange.upperOpen')
  @DocsEditable()
  final bool upperOpen;

  @JSName('bound')
  @DomName('IDBKeyRange.bound')
  @DocsEditable()
  static KeyRange bound_(Object lower, Object upper, [bool lowerOpen, bool upperOpen]) native;

  @JSName('lowerBound')
  @DomName('IDBKeyRange.lowerBound')
  @DocsEditable()
  static KeyRange lowerBound_(Object bound, [bool open]) native;

  @JSName('only')
  @DomName('IDBKeyRange.only')
  @DocsEditable()
  static KeyRange only_(Object value) native;

  @JSName('upperBound')
  @DomName('IDBKeyRange.upperBound')
  @DocsEditable()
  static KeyRange upperBound_(Object bound, [bool open]) native;

}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.


@DomName('IDBObjectStore')
@Unstable()
class ObjectStore extends Interceptor native "IDBObjectStore" {

  @DomName('IDBObjectStore.add')
  Future add(value, [key]) {
    try {
      var request;
      if (key != null) {
        request = _add(value, key);
      } else {
        request = _add(value);
      }
      return _completeRequest(request);
    } catch (e, stacktrace) {
      return new Future.error(e, stacktrace);
    }
  }

  @DomName('IDBObjectStore.clear')
  Future clear() {
    try {
      return _completeRequest(_clear());
    } catch (e, stacktrace) {
      return new Future.error(e, stacktrace);
    }
  }

  @DomName('IDBObjectStore.delete')
  Future delete(key_OR_keyRange){
    try {
      return _completeRequest(_delete(key_OR_keyRange));
    } catch (e, stacktrace) {
      return new Future.error(e, stacktrace);
    }
  }

  @DomName('IDBObjectStore.count')
  Future<int> count([key_OR_range]) {
   try {
      var request;
      if (key_OR_range != null) {
        request = _count(key_OR_range);
      } else {
        request = _count();
      }
      return _completeRequest(request);
    } catch (e, stacktrace) {
      return new Future.error(e, stacktrace);
    }
  }

  @DomName('IDBObjectStore.put')
  Future put(value, [key]) {
    try {
      var request;
      if (key != null) {
        request = _put(value, key);
      } else {
        request = _put(value);
      }
      return _completeRequest(request);
    } catch (e, stacktrace) {
      return new Future.error(e, stacktrace);
    }
  }

  @DomName('IDBObjectStore.get')
  Future getObject(key) {
    try {
      var request = _get(key);

      return _completeRequest(request);
    } catch (e, stacktrace) {
      return new Future.error(e, stacktrace);
    }
  }

  /**
   * Creates a stream of cursors over the records in this object store.
   *
   * **The stream must be manually advanced by calling [Cursor.next] after
   * each item or by specifying autoAdvance to be true.**
   *
   *     var cursors = objectStore.openCursor().listen(
   *       (cursor) {
   *         // ...some processing with the cursor
   *         cursor.next(); // advance onto the next cursor.
   *       },
   *       onDone: () {
   *         // called when there are no more cursors.
   *         print('all done!');
   *       });
   *
   * Asynchronous operations which are not related to the current transaction
   * will cause the transaction to automatically be committed-- all processing
   * must be done synchronously unless they are additional async requests to
   * the current transaction.
   */
  @DomName('IDBObjectStore.openCursor')
  Stream<CursorWithValue> openCursor({key, KeyRange range, String direction,
      bool autoAdvance}) {
    var key_OR_range = null;
    if (key != null) {
      if (range != null) {
        throw new ArgumentError('Cannot specify both key and range.');
      }
      key_OR_range = key;
    } else {
      key_OR_range = range;
    }

    // TODO: try/catch this and return a stream with an immediate error.
    var request;
    if (direction == null) {
      request = _openCursor(key_OR_range);
    } else {
      request = _openCursor(key_OR_range, direction);
    }
    return _cursorStreamFromResult(request, autoAdvance);
  }

  @DomName('IDBObjectStore.createIndex')
  Index createIndex(String name, keyPath, {bool unique, bool multiEntry}) {
    var options = {};
    if (unique != null) {
      options['unique'] = unique;
    }
    if (multiEntry != null) {
      options['multiEntry'] = multiEntry;
    }

    return _createIndex(name, keyPath, options);
  }


  @DomName('IDBObjectStore.autoIncrement')
  @DocsEditable()
  final bool autoIncrement;

  @DomName('IDBObjectStore.indexNames')
  @DocsEditable()
  @Returns('DomStringList')
  @Creates('DomStringList')
  final List<String> indexNames;

  @DomName('IDBObjectStore.keyPath')
  @DocsEditable()
  @annotation_Creates_SerializedScriptValue
  final dynamic keyPath;

  @DomName('IDBObjectStore.name')
  @DocsEditable()
  final String name;

  @DomName('IDBObjectStore.transaction')
  @DocsEditable()
  final Transaction transaction;

  @DomName('IDBObjectStore.add')
  @DocsEditable()
  @Returns('Request')
  @Creates('Request')
  @_annotation_Creates_IDBKey
  Request _add(/*any*/ value, [/*any*/ key]) {
    if (key != null) {
      var value_1 = convertDartToNative_SerializedScriptValue(value);
      var key_2 = convertDartToNative_SerializedScriptValue(key);
      return _add_1(value_1, key_2);
    }
    var value_3 = convertDartToNative_SerializedScriptValue(value);
    return _add_2(value_3);
  }
  @JSName('add')
  @DomName('IDBObjectStore.add')
  @DocsEditable()
  @Returns('Request')
  @Creates('Request')
  @_annotation_Creates_IDBKey
  Request _add_1(value, key) native;
  @JSName('add')
  @DomName('IDBObjectStore.add')
  @DocsEditable()
  @Returns('Request')
  @Creates('Request')
  @_annotation_Creates_IDBKey
  Request _add_2(value) native;

  @JSName('clear')
  @DomName('IDBObjectStore.clear')
  @DocsEditable()
  Request _clear() native;

  @JSName('count')
  @DomName('IDBObjectStore.count')
  @DocsEditable()
  Request _count(Object key) native;

  @DomName('IDBObjectStore.createIndex')
  @DocsEditable()
  Index _createIndex(String name, keyPath, [Map options]) {
    if ((keyPath is List<String> || keyPath == null) && options == null) {
      List keyPath_1 = convertDartToNative_StringArray(keyPath);
      return _createIndex_1(name, keyPath_1);
    }
    if (options != null && (keyPath is List<String> || keyPath == null)) {
      List keyPath_2 = convertDartToNative_StringArray(keyPath);
      var options_3 = convertDartToNative_Dictionary(options);
      return _createIndex_2(name, keyPath_2, options_3);
    }
    if ((keyPath is String || keyPath == null) && options == null) {
      return _createIndex_3(name, keyPath);
    }
    if (options != null && (keyPath is String || keyPath == null)) {
      var options_4 = convertDartToNative_Dictionary(options);
      return _createIndex_4(name, keyPath, options_4);
    }
    throw new ArgumentError("Incorrect number or type of arguments");
  }
  @JSName('createIndex')
  @DomName('IDBObjectStore.createIndex')
  @DocsEditable()
  Index _createIndex_1(name, List keyPath) native;
  @JSName('createIndex')
  @DomName('IDBObjectStore.createIndex')
  @DocsEditable()
  Index _createIndex_2(name, List keyPath, options) native;
  @JSName('createIndex')
  @DomName('IDBObjectStore.createIndex')
  @DocsEditable()
  Index _createIndex_3(name, String keyPath) native;
  @JSName('createIndex')
  @DomName('IDBObjectStore.createIndex')
  @DocsEditable()
  Index _createIndex_4(name, String keyPath, options) native;

  @JSName('delete')
  @DomName('IDBObjectStore.delete')
  @DocsEditable()
  Request _delete(Object key) native;

  @DomName('IDBObjectStore.deleteIndex')
  @DocsEditable()
  void deleteIndex(String name) native;

  @JSName('get')
  @DomName('IDBObjectStore.get')
  @DocsEditable()
  @Returns('Request')
  @Creates('Request')
  @annotation_Creates_SerializedScriptValue
  Request _get(Object key) native;

  @DomName('IDBObjectStore.index')
  @DocsEditable()
  Index index(String name) native;

  @JSName('openCursor')
  @DomName('IDBObjectStore.openCursor')
  @DocsEditable()
  @Returns('Request')
  @Creates('Request')
  @Creates('Cursor')
  Request _openCursor(Object key, [String direction]) native;

  @DomName('IDBObjectStore.put')
  @DocsEditable()
  @Returns('Request')
  @Creates('Request')
  @_annotation_Creates_IDBKey
  Request _put(/*any*/ value, [/*any*/ key]) {
    if (key != null) {
      var value_1 = convertDartToNative_SerializedScriptValue(value);
      var key_2 = convertDartToNative_SerializedScriptValue(key);
      return _put_1(value_1, key_2);
    }
    var value_3 = convertDartToNative_SerializedScriptValue(value);
    return _put_2(value_3);
  }
  @JSName('put')
  @DomName('IDBObjectStore.put')
  @DocsEditable()
  @Returns('Request')
  @Creates('Request')
  @_annotation_Creates_IDBKey
  Request _put_1(value, key) native;
  @JSName('put')
  @DomName('IDBObjectStore.put')
  @DocsEditable()
  @Returns('Request')
  @Creates('Request')
  @_annotation_Creates_IDBKey
  Request _put_2(value) native;


  /**
   * Helper for iterating over cursors in a request.
   */
  static Stream<Cursor> _cursorStreamFromResult(Request request,
      bool autoAdvance) {
    // TODO: need to guarantee that the controller provides the values
    // immediately as waiting until the next tick will cause the transaction to
    // close.
    var controller = new StreamController(sync: true);

    request.onError.listen((e) {
      //TODO: Report stacktrace once issue 4061 is resolved.
      controller.addError(e);
    });

    request.onSuccess.listen((e) {
      Cursor cursor = request.result;
      if (cursor == null) {
        controller.close();
      } else {
        controller.add(cursor);
        if (autoAdvance == true && controller.hasListener) {
          cursor.next();
        }
      }
    });
    return controller.stream;
  }
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.


@DocsEditable()
@DomName('IDBOpenDBRequest')
@Unstable()
class OpenDBRequest extends Request native "IDBOpenDBRequest,IDBVersionChangeRequest" {
  // To suppress missing implicit constructor warnings.
  factory OpenDBRequest._() { throw new UnsupportedError("Not supported"); }

  @DomName('IDBOpenDBRequest.blockedEvent')
  @DocsEditable()
  static const EventStreamProvider<Event> blockedEvent = const EventStreamProvider<Event>('blocked');

  @DomName('IDBOpenDBRequest.upgradeneededEvent')
  @DocsEditable()
  static const EventStreamProvider<VersionChangeEvent> upgradeNeededEvent = const EventStreamProvider<VersionChangeEvent>('upgradeneeded');

  @DomName('IDBOpenDBRequest.onblocked')
  @DocsEditable()
  Stream<Event> get onBlocked => blockedEvent.forTarget(this);

  @DomName('IDBOpenDBRequest.onupgradeneeded')
  @DocsEditable()
  Stream<VersionChangeEvent> get onUpgradeNeeded => upgradeNeededEvent.forTarget(this);
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.


@DocsEditable()
@DomName('IDBRequest')
@Unstable()
class Request extends EventTarget native "IDBRequest" {
  // To suppress missing implicit constructor warnings.
  factory Request._() { throw new UnsupportedError("Not supported"); }

  @DomName('IDBRequest.errorEvent')
  @DocsEditable()
  static const EventStreamProvider<Event> errorEvent = const EventStreamProvider<Event>('error');

  @DomName('IDBRequest.successEvent')
  @DocsEditable()
  static const EventStreamProvider<Event> successEvent = const EventStreamProvider<Event>('success');

  @DomName('IDBRequest.error')
  @DocsEditable()
  final DomError error;

  @DomName('IDBRequest.readyState')
  @DocsEditable()
  final String readyState;

  dynamic get result => _convertNativeToDart_IDBAny(this._get_result);
  @JSName('result')
  @DomName('IDBRequest.result')
  @DocsEditable()
  @Creates('Null')
  final dynamic _get_result;

  @DomName('IDBRequest.source')
  @DocsEditable()
  @Creates('Null')
  final dynamic source;

  @DomName('IDBRequest.transaction')
  @DocsEditable()
  final Transaction transaction;

  @DomName('IDBRequest.onerror')
  @DocsEditable()
  Stream<Event> get onError => errorEvent.forTarget(this);

  @DomName('IDBRequest.onsuccess')
  @DocsEditable()
  Stream<Event> get onSuccess => successEvent.forTarget(this);
}
// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.


@DomName('IDBTransaction')
@Unstable()
class Transaction extends EventTarget native "IDBTransaction" {

  /**
   * Provides a Future which will be completed once the transaction has
   * completed.
   *
   * The future will error if an error occurrs on the transaction or if the
   * transaction is aborted.
   */
  Future<Database> get completed {
    var completer = new Completer<Database>();

    this.onComplete.first.then((_) {
      completer.complete(db);
    });

    this.onError.first.then((e) {
      completer.completeError(e);
    });

    this.onAbort.first.then((e) {
      completer.completeError(e);
    });

    return completer.future;
  }

  // To suppress missing implicit constructor warnings.
  factory Transaction._() { throw new UnsupportedError("Not supported"); }

  @DomName('IDBTransaction.abortEvent')
  @DocsEditable()
  static const EventStreamProvider<Event> abortEvent = const EventStreamProvider<Event>('abort');

  @DomName('IDBTransaction.completeEvent')
  @DocsEditable()
  static const EventStreamProvider<Event> completeEvent = const EventStreamProvider<Event>('complete');

  @DomName('IDBTransaction.errorEvent')
  @DocsEditable()
  static const EventStreamProvider<Event> errorEvent = const EventStreamProvider<Event>('error');

  @DomName('IDBTransaction.db')
  @DocsEditable()
  final Database db;

  @DomName('IDBTransaction.error')
  @DocsEditable()
  final DomError error;

  @DomName('IDBTransaction.mode')
  @DocsEditable()
  final String mode;

  @DomName('IDBTransaction.abort')
  @DocsEditable()
  void abort() native;

  @DomName('IDBTransaction.objectStore')
  @DocsEditable()
  ObjectStore objectStore(String name) native;

  @DomName('IDBTransaction.onabort')
  @DocsEditable()
  Stream<Event> get onAbort => abortEvent.forTarget(this);

  @DomName('IDBTransaction.oncomplete')
  @DocsEditable()
  Stream<Event> get onComplete => completeEvent.forTarget(this);

  @DomName('IDBTransaction.onerror')
  @DocsEditable()
  Stream<Event> get onError => errorEvent.forTarget(this);

}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.


@DocsEditable()
@DomName('IDBVersionChangeEvent')
@Unstable()
class VersionChangeEvent extends Event native "IDBVersionChangeEvent" {
  // To suppress missing implicit constructor warnings.
  factory VersionChangeEvent._() { throw new UnsupportedError("Not supported"); }

  @DomName('IDBVersionChangeEvent.dataLoss')
  @DocsEditable()
  @Experimental() // untriaged
  final String dataLoss;

  @DomName('IDBVersionChangeEvent.newVersion')
  @DocsEditable()
  @Creates('int|String|Null')
  @Returns('int|String|Null')
  final dynamic newVersion;

  @DomName('IDBVersionChangeEvent.oldVersion')
  @DocsEditable()
  @Creates('int|String|Null')
  @Returns('int|String|Null')
  final dynamic oldVersion;
}
// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.


@DocsEditable()
@DomName('IDBAny')
@deprecated // nonstandard
abstract class _IDBAny extends Interceptor native "IDBAny" {
}
