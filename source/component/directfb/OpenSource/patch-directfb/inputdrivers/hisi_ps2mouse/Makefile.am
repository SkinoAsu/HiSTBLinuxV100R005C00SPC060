## Makefile.am for DirectFB/inputdrivers/hisi_ps2mouse

INCLUDES = \
	-I$(top_builddir)/include	\
	-I$(top_builddir)/lib	\
	-I$(top_srcdir)/include	\
	-I$(top_srcdir)/lib	\
	-I$(top_srcdir)/src

ps2mouse_LTLIBRARIES = libdirectfb_hisi_ps2mouse.la

if BUILD_STATIC
ps2mouse_DATA = $(ps2mouse_LTLIBRARIES:.la=.o)
endif

ps2mousedir = $(MODULEDIR)/inputdrivers

libdirectfb_hisi_ps2mouse_la_SOURCES =	\
	ps2mouse.c

libdirectfb_hisi_ps2mouse_la_LDFLAGS = \
	-module			\
	-avoid-version		\
	$(DFB_LDFLAGS)

libdirectfb_hisi_ps2mouse_la_LIBADD = \
	$(top_builddir)/lib/direct/libdirect.la \
	$(top_builddir)/src/libdirectfb.la


include $(top_srcdir)/rules/libobject.make

