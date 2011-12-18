# This file provides "make" rules for the C++ standard library.

ifeq ($(TARGET),ANDROID)
  LIBSTDCXX_CPPFLAGS = -isystem $(ANDROID_NDK)/sources/cxx-stl/gnu-libstdc++/include \
	-isystem $(ANDROID_NDK)/sources/cxx-stl/gnu-libstdc++/libs/$(ANDROID_ABI3)/include
  LIBSTDCXX_LDADD = $(ANDROID_NDK)/sources/cxx-stl/gnu-libstdc++/libs/$(ANDROID_ABI3)/libgnustl_static.a
endif

ifeq ($(TARGET_IS_DARWIN),y)
  LIBSTDCXX_LDADD = $(shell $(CXX) -print-file-name=libstdc++.a)
endif

# Add the C++ standard library to every library and every program
TARGET_CPPFLAGS += $(LIBSTDCXX_CPPFLAGS)
TARGET_LDADD := $(LIBSTDCXX_LDADD) $(TARGET_LDADD)