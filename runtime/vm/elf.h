// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

#ifndef RUNTIME_VM_ELF_H_
#define RUNTIME_VM_ELF_H_

#include "vm/allocation.h"
#include "vm/compiler/runtime_api.h"
#include "vm/datastream.h"
#include "vm/growable_array.h"
#include "vm/zone.h"

namespace dart {

class DynamicSegment;
class DynamicTable;
class ElfWriteStream;
class Section;
class StringTable;
class Symbol;
class SymbolTable;

class Elf : public ZoneAllocated {
 public:
  Elf(Zone* zone, StreamingWriteStream* stream, bool strip = false);

  static const intptr_t kPageSize = 4096;

  intptr_t NextMemoryOffset() const { return memory_offset_; }
  intptr_t NextSectionIndex() const { return sections_.length(); }
  intptr_t AddText(const char* name, const uint8_t* bytes, intptr_t size);
  intptr_t AddROData(const char* name, const uint8_t* bytes, intptr_t size);
  intptr_t AddBSSData(const char* name, intptr_t size);
  void AddDebug(const char* name, const uint8_t* bytes, intptr_t size);
  void AddCodeSymbol(const char* name,
                     intptr_t section,
                     intptr_t address,
                     intptr_t size);

  // Returns whether the symbol was found. If found, sets the contents of
  // offset and size appropriately if either or both are not nullptr.
  bool FindDynamicSymbol(const char* name,
                         intptr_t* offset,
                         intptr_t* size) const;

  void Finalize();

 private:
  void AddSection(Section* section, const char* name);
  intptr_t AddSegmentSymbol(const Section* section, const char* name);
  void AddStaticSymbol(const char* name,
                       intptr_t info,
                       intptr_t section_index,
                       intptr_t address,
                       intptr_t size);
  void AddDynamicSymbol(const char* name,
                        intptr_t info,
                        intptr_t section_index,
                        intptr_t address,
                        intptr_t size);

  void FinalizeProgramTable();
  void ComputeFileOffsets();

  void WriteHeader(ElfWriteStream* stream);
  void WriteSectionTable(ElfWriteStream* stream);
  void WriteProgramTable(ElfWriteStream* stream);
  void WriteSections(ElfWriteStream* stream);

  Zone* const zone_;
  StreamingWriteStream* const unwrapped_stream_;
  // Whether the ELF file should be stripped of static information like
  // the static symbol table (and its corresponding string table).
  const bool strip_;

  // All our strings would fit in a single page. However, we use separate
  // .shstrtab and .dynstr to work around a bug in Android's strip utility.
  StringTable* const shstrtab_;
  StringTable* const dynstrtab_;
  SymbolTable* const dynsym_;

  // Can only be created once the dynamic symbol table is complete.
  DynamicTable* dynamic_ = nullptr;
  DynamicSegment* dynamic_segment_ = nullptr;

  // The static tables are lazily created when static symbols are added.
  StringTable* strtab_ = nullptr;
  SymbolTable* symtab_ = nullptr;

  GrowableArray<Section*> sections_;
  GrowableArray<Section*> segments_;
  intptr_t memory_offset_;
  intptr_t section_table_file_offset_ = -1;
  intptr_t section_table_file_size_ = -1;
  intptr_t program_table_file_offset_ = -1;
  intptr_t program_table_file_size_ = -1;
};

}  // namespace dart

#endif  // RUNTIME_VM_ELF_H_
