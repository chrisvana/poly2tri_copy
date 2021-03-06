# Auto-generated by repobuild, do not modify directly.

# Environment flag settings.
ROOT_DIR := $(shell pwd)
# Some compiler specific flag settings.
CXX_GCC := $(shell echo $$($(CXX) --version | egrep '(gcc|g\+\+)' | head -n 1 | wc -l))
CC_GCC := $(shell echo $$($(CC) --version | egrep '(gcc|g\+\+|^cc)' | head -n 1 | wc -l))
ifeq ($(CC_GCC),1)
	CFLAGS= -pthread -g -Wall -Werror -Wno-sign-compare -Wno-unused-local-typedefs -Wno-error=unused-local-typedefs -O3 -flto
	BASIC_CFLAGS= -pthread
else
	CFLAGS= -stdlib=libc++ -pthread -g -Wall -Werror -Wno-sign-compare -O3 -flto -Qunused-arguments -fcolor-diagnostics
	BASIC_CFLAGS= -stdlib=libc++ -pthread -Qunused-arguments
endif
ifeq ($(CXX_GCC),1)
	LD_FORCE_LINK_START := -Wl,--whole-archive
	LD_FORCE_LINK_END := -Wl,--no-whole-archive
	LDFLAGS= -lpthread -g -O3 -flto -L/usr/local/lib -L/opt/local/lib
	CXXFLAGS= -pthread -g -Wall -Werror -Wno-sign-compare -Wno-unused-local-typedefs -Wno-error=unused-local-typedefs -O3 -flto -std=c++11 -DUSE_CXX0X
	BASIC_CXXFLAGS= -pthread -std=c++11
else
	LD_FORCE_LINK_START := -Wl,-force_load
	LD_FORCE_LINK_END := 
	LDFLAGS= -stdlib=libc++ -lpthread -g -O3 -flto -L/usr/local/lib -L/opt/local/lib
	CXXFLAGS= -stdlib=libc++ -pthread -g -Wall -Werror -Wno-sign-compare -O3 -flto -Qunused-arguments -fcolor-diagnostics -std=c++11 -DUSE_CXX0X
	BASIC_CXXFLAGS= -stdlib=libc++ -pthread -Qunused-arguments -std=c++11
endif

# Some platform specific flag settings.
IS_DARWIN := $(shell echo $$(uname | grep 'Darwin' | wc -l))
IS_DARWIN_AND_CLANG := $(shell echo $$((($(IS_DARWIN) == 1 && $(CXX_GCC) == 0))))
ifeq ($(IS_DARWIN_AND_CLANG),1)
	SHARED_LIB_ARGS_R:=awk '{print "-dynamiclib -current_version "$$3" -compatibility_version "$$4}'
	SHARED_LIB_ARGS_MI:=awk '{print "-dynamiclib -current_version "$$3}'
	SHARED_LIB_ARGS_MA:=awk '{print "-dynamiclib"}'
	SHARED_LIB_ARGS:=awk '{print "-dynamiclib"}'
	SHARED_LIB_NAME_R:=awk '{print "lib"$$1"."$$2"."$$3"."$$4".dylib"}'
	SHARED_LIB_NAME_MI:=awk '{print "lib"$$1"."$$2"."$$3".dylib"}'
	SHARED_LIB_NAME_MA:=awk '{print "lib"$$1"."$$2".dylib"}'
	SHARED_LIB_NAME:=awk '{print "lib"$$1".dylib"}'
else
	SHARED_LIB_ARGS_R:=awk '{print "-shared -Wl,-soname,lib"$$1".so."$$2}'
	SHARED_LIB_ARGS_MI:=awk '{print "-shared -Wl,-soname,lib"$$1".so."$$2}'
	SHARED_LIB_ARGS_MA:=awk '{print "-shared -Wl,-soname,lib"$$1".so."$$2}'
	SHARED_LIB_ARGS:=awk '{print "-shared -Wl,-soname,lib"$$1".so"}'
	SHARED_LIB_NAME_R:=awk '{print "lib"$$1".so."$$2"."$$3"."$$4}'
	SHARED_LIB_NAME_MI:=awk '{print "lib"$$1".so."$$2"."$$3}'
	SHARED_LIB_NAME_MA:=awk '{print "lib"$$1".so."$$2}'
	SHARED_LIB_NAME:=awk '{print "lib"$$1".so"}'
endif
define PythonSetup
aW1wb3J0IG9zCmZyb20gc2V0dXB0b29scyBpbXBvcnQgc2V0dXAKCnNldHVwKAogICAgbmFtZSA9IG9zLmVudmlyb25bJ1BZX05BTUUnXSwKICAgIHZlcnNpb24gPSBvcy5lbnZpcm9uWydQWV9WRVJTSU9OJ10sCiAgICBweV9tb2R1bGVzID0gb3MuZW52aXJvblsnUFlfTU9EVUxFUyddLnNwbGl0KCksCiAgICBpbnN0YWxsX3JlcXVpcmVzID0gb3MuZW52aXJvblsnUFlfU1lTX0RFUFMnXS5zcGxpdCgpLAopCg==
endef
export PythonSetup

.gen-pkg/base_setup.py: 
	@mkdir -p .gen-pkg
	@echo "$$PythonSetup" | base64 --decode > .gen-pkg/base_setup.py
	@chmod 0755 .gen-pkg/base_setup.py

define CCEmbed
IyEvYmluL2Jhc2gKSEVBREVSPSIkMSIKQ1BQPSIkMiIKR1VBUkQ9IiQzIgpOQU1FU1BBQ0VfU1RBUlQ9IiQ0IgpOQU1FU1BBQ0VfRU5EPSIkNSIKZWNobyAiI2lmbmRlZiAkR1VBUkQiID4gJEhFQURFUgplY2hvICIjZGVmaW5lICRHVUFSRCIgPj4gJEhFQURFUgplY2hvICIjaW5jbHVkZSA8Y3N0cmluZz4gIC8vIHNpemVfdCIgPj4gJEhFQURFUgplY2hvICIkTkFNRVNQQUNFX1NUQVJUIiA+PiAkSEVBREVSCmVjaG8gIiNpbmNsdWRlIFwiJChiYXNlbmFtZSAkSEVBREVSKVwiIiA+ICRDUFAKZWNobyAiJE5BTUVTUEFDRV9TVEFSVCIgPj4gJENQUAp3aGlsZSByZWFkIFNPVVJDRSBWQVJJQUJMRTsgZG8gIGVjaG8gIi8vIEF1dG8gZ2VuZXJhdGVkIGZyb20gJFNPVVJDRSIgPj4gJEhFQURFUgogIGVjaG8gImV4dGVybiBjb25zdCBjaGFyKiAiJFZBUklBQkxFIl9kYXRhKCk7IiA+PiAkSEVBREVSCiAgZWNobyAiZXh0ZXJuIHNpemVfdCAiJFZBUklBQkxFIl9zaXplKCk7IiA+PiAkSEVBREVSCiAgZWNobyAiIiA+PiAkSEVBREVSCiAgZWNobyAiY29uc3QgY2hhciogIiRWQVJJQUJMRSJfZGF0YSgpIHsiID4+ICRDUFAKICBwcmludGYgIiAgcmV0dXJuIFwiIiA+PiAkQ1BQCiAgY2F0ICRTT1VSQ0UgICAgIHwgcGVybCAtcGUgJ3N8XFx8XFxcXHxnJyAgICAgfCBwZXJsIC1wZSAnc3xcInxcXCJ8ZycgICAgIHwgcGVybCAtcGUgJ3N8XG58XFxufGcnID4+ICRDUFAKICBlY2hvICJcIjsiID4+ICRDUFAKICBlY2hvICJ9IiA+PiAkQ1BQCiAgZWNobyAic2l6ZV90ICIkVkFSSUFCTEUiX3NpemUoKSIgeyA+PiAkQ1BQCiAgcHJpbnRmICIgIHJldHVybiAiID4+ICRDUFAKICBwcmludGYgJChjYXQgJFNPVVJDRSB8IHdjIC1jKSA+PiAkQ1BQCiAgZWNobyAiOyIgPj4gJENQUAogIGVjaG8gIn0iID4+ICRDUFAKZG9uZQplY2hvICIkTkFNRVNQQUNFX0VORCIgPj4gJEhFQURFUgplY2hvICIjZW5kaWYgIC8vICRHVUFSRCIgPj4gJEhFQURFUgplY2hvICIkTkFNRVNQQUNFX0VORCIgPj4gJENQUAo=
endef
export CCEmbed

.gen-files/cc_embed.sh: 
	@mkdir -p .gen-files
	@echo "$$CCEmbed" | base64 --decode > .gen-files/cc_embed.sh
	@chmod 0755 .gen-files/cc_embed.sh

define FlockScript
IyEvdXNyL2Jpbi9wZXJsIAojIGJhc2ljYWxseSBmbG9jaywgbW9kaWZpZWQgZnJvbSBzb3VyY2Ugb24gdGhlIHdlYi4KCnVzZSB3YXJuaW5nczsKdXNlIHN0cmljdDsKdXNlIEZjbnRsIHF3KDpmbG9jayk7CgpteSAkbG9ja2ZpbGUgPSBzaGlmdDsKbXkgJGNvbW1hbmQgPSBqb2luKCIgIixAQVJHVik7CgppZiAoISRsb2NrZmlsZSB8fCAhJGNvbW1hbmQpIHsKICAgIGRpZSgidXNhZ2U6ICQwIDxmaWxlPiA8Y29tbWFuZD5cbiIpOwp9CgpvcGVuKEZILCRsb2NrZmlsZSkgfHwgZGllKCQhKTsgCmZsb2NrKEZILExPQ0tfRVgpIHx8IGRpZSgkISk7Cm15ICRyZXR2YWwgPSAwOwpzeXN0ZW0oJGNvbW1hbmQpID09IDAgb3IgJHJldHZhbCA9ICQ/ID4+IDg7CmZsb2NrKEZILExPQ0tfVU4pOyAKZXhpdCgkcmV0dmFsKTsK
endef
export FlockScript

.gen-files/flock_script.pl: 
	@mkdir -p .gen-files
	@echo "$$FlockScript" | base64 --decode > .gen-files/flock_script.pl
	@chmod 0755 .gen-files/flock_script.pl


.gen-src/poly2tri: .gen-files/.dummy.prereqs
	@mkdir -p .gen-src; [ -d poly2tri ] || mkdir -p poly2tri; ln -n -f -s ../poly2tri .gen-src/poly2tri


.gen-src/poly2tri/.dummy: .gen-src/poly2tri .gen-files/.dummy.prereqs
	@[ -f .gen-src/poly2tri/.dummy ] || touch .gen-src/poly2tri/.dummy


.gen-src/.gen-pkg/poly2tri: .gen-files/.dummy.prereqs
	@mkdir -p .gen-src/.gen-pkg; [ -d .gen-pkg/poly2tri ] || mkdir -p .gen-pkg/poly2tri; ln -n -f -s ../../.gen-pkg/poly2tri .gen-src/.gen-pkg/poly2tri


.gen-src/.gen-pkg/poly2tri/.dummy: .gen-src/.gen-pkg/poly2tri .gen-files/.dummy.prereqs
	@[ -f .gen-src/.gen-pkg/poly2tri/.dummy ] || touch .gen-src/.gen-pkg/poly2tri/.dummy


.gen-src/.gen-files/poly2tri: .gen-files/.dummy.prereqs
	@mkdir -p .gen-src/.gen-files; [ -d .gen-files/poly2tri ] || mkdir -p .gen-files/poly2tri; ln -n -f -s ../../.gen-files/poly2tri .gen-src/.gen-files/poly2tri


.gen-src/.gen-files/poly2tri/.dummy: .gen-src/.gen-files/poly2tri .gen-files/.dummy.prereqs
	@[ -f .gen-src/.gen-files/poly2tri/.dummy ] || touch .gen-src/.gen-files/poly2tri/.dummy

auto_.0: .gen-src/poly2tri .gen-src/.gen-pkg/poly2tri .gen-src/.gen-files/poly2tri

.PHONY: auto_.0

headers.poly2tri_lib := poly2tri/common/shapes.h poly2tri/common/utils.h poly2tri/sweep/advancing_front.h poly2tri/sweep/cdt.h poly2tri/sweep/sweep.h poly2tri/sweep/sweep_context.h poly2tri/poly2tri.h


.gen-obj/poly2tri/common/shapes.cc.o: .gen-src/poly2tri/.dummy .gen-src/.gen-files/poly2tri/.dummy .gen-src/.gen-pkg/poly2tri/.dummy $(headers.poly2tri_lib) poly2tri/common/shapes.cc .gen-files/.dummy.prereqs
	@mkdir -p .gen-obj/poly2tri/common
	@echo "Compiling:  poly2tri/common/shapes.cc (c++)"
	@$(COMPILE.cc) -I. -I.gen-files -I.gen-src -I.gen-src/.gen-files poly2tri/common/shapes.cc -o .gen-obj/poly2tri/common/shapes.cc.o


.gen-obj/poly2tri/sweep/advancing_front.cc.o: .gen-src/poly2tri/.dummy .gen-src/.gen-files/poly2tri/.dummy .gen-src/.gen-pkg/poly2tri/.dummy $(headers.poly2tri_lib) poly2tri/sweep/advancing_front.cc .gen-files/.dummy.prereqs
	@mkdir -p .gen-obj/poly2tri/sweep
	@echo "Compiling:  poly2tri/sweep/advancing_front.cc (c++)"
	@$(COMPILE.cc) -I. -I.gen-files -I.gen-src -I.gen-src/.gen-files poly2tri/sweep/advancing_front.cc -o .gen-obj/poly2tri/sweep/advancing_front.cc.o


.gen-obj/poly2tri/sweep/cdt.cc.o: .gen-src/poly2tri/.dummy .gen-src/.gen-files/poly2tri/.dummy .gen-src/.gen-pkg/poly2tri/.dummy $(headers.poly2tri_lib) poly2tri/sweep/cdt.cc .gen-files/.dummy.prereqs
	@mkdir -p .gen-obj/poly2tri/sweep
	@echo "Compiling:  poly2tri/sweep/cdt.cc (c++)"
	@$(COMPILE.cc) -I. -I.gen-files -I.gen-src -I.gen-src/.gen-files poly2tri/sweep/cdt.cc -o .gen-obj/poly2tri/sweep/cdt.cc.o


.gen-obj/poly2tri/sweep/sweep.cc.o: .gen-src/poly2tri/.dummy .gen-src/.gen-files/poly2tri/.dummy .gen-src/.gen-pkg/poly2tri/.dummy $(headers.poly2tri_lib) poly2tri/sweep/sweep.cc .gen-files/.dummy.prereqs
	@mkdir -p .gen-obj/poly2tri/sweep
	@echo "Compiling:  poly2tri/sweep/sweep.cc (c++)"
	@$(COMPILE.cc) -I. -I.gen-files -I.gen-src -I.gen-src/.gen-files poly2tri/sweep/sweep.cc -o .gen-obj/poly2tri/sweep/sweep.cc.o


.gen-obj/poly2tri/sweep/sweep_context.cc.o: .gen-src/poly2tri/.dummy .gen-src/.gen-files/poly2tri/.dummy .gen-src/.gen-pkg/poly2tri/.dummy $(headers.poly2tri_lib) poly2tri/sweep/sweep_context.cc .gen-files/.dummy.prereqs
	@mkdir -p .gen-obj/poly2tri/sweep
	@echo "Compiling:  poly2tri/sweep/sweep_context.cc (c++)"
	@$(COMPILE.cc) -I. -I.gen-files -I.gen-src -I.gen-src/.gen-files poly2tri/sweep/sweep_context.cc -o .gen-obj/poly2tri/sweep/sweep_context.cc.o

poly2tri_lib: .gen-obj/poly2tri/common/shapes.cc.o .gen-obj/poly2tri/sweep/advancing_front.cc.o .gen-obj/poly2tri/sweep/cdt.cc.o .gen-obj/poly2tri/sweep/sweep.cc.o .gen-obj/poly2tri/sweep/sweep_context.cc.o auto_.0

.PHONY: poly2tri_lib


clean: .gen-files/.dummy.prereqs
	@rm -rf .gen-src/poly2tri/.dummy
	@rm -rf .gen-src/.gen-files/poly2tri/.dummy
	@rm -rf .gen-src/.gen-pkg/poly2tri/.dummy
	@rm -rf .gen-obj
	@rm -rf bin
	@rm -rf .gen-files
	@rm -rf .gen-src
	@rm -rf .gen-pkg

# http://www.gnu.org/prep/standards/standards.html
prefix=/usr/local
exec_prefix=$(prefix)
bindir=$(exec_prefix)/bin
includedir=$(prefix)/include
libdir=$(exec_prefix)/lib
INSTALL=install
INSTALL_PROGRAM=$(INSTALL)
INSTALL_DATA=$(INSTALL) -m 644


install: .gen-files/.dummy.prereqs


all: poly2tri_lib .gen-files/.dummy.prereqs


tests: .gen-files/.dummy.prereqs


licenses: 
	@echo "License information."
	@printf "//:poly2tri_lib =>\n\n"

.PHONY: clean all tests install licenses

.DEFAULT_GOAL=all


.gen-files/.dummy.prereqs: 
	@mkdir -p .gen-files
	@touch .gen-files/.dummy.prereqs


prereqs: .gen-files/.dummy.prereqs

.PHONY: prereqs

