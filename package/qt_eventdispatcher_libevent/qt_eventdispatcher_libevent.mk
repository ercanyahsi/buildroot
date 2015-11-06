################################################################################
#
# qt_eventdispatcher_libevent
#
################################################################################

QT_EVENTDISPATCHER_LIBEVENT_VERSION = 8798b269654730fa179132ad9a44deedd81bb6b6
QT_EVENTDISPATCHER_LIBEVENT_SITE = $(call github,sjinks,qt_eventdispatcher_libevent,$(QT_EVENTDISPATCHER_LIBEVENT_VERSION))
QT_EVENTDISPATCHER_LIBEVENT_INSTALL_STAGING = YES
QT_EVENTDISPATCHER_LIBEVENT_LICENSE = MIT
QT_EVENTDISPATCHER_LIBEVENT_LICENSE_FILES = LICENSE
QT_EVENTDISPATCHER_LIBEVENT_DEPENDENCIES = \
	libevent \
	$(if $(BR2_PACKAGE_QT),qt) \
	$(if $(BR2_PACKAGE_QT5),qt5base)

ifeq ($(BR2_PACKAGE_QT5),y)
QT_EVENTDISPATCHER_LIBEVENT_QMAKE = $(QT5_QMAKE)
else
QT_EVENTDISPATCHER_LIBEVENT_QMAKE = $(QT_QMAKE)
endif

define QT_EVENTDISPATCHER_LIBEVENT_CONFIGURE_CMDS
	(cd $(@D); $(TARGET_MAKE_ENV) $(QT_EVENTDISPATCHER_LIBEVENT_QMAKE) PREFIX=/usr)
endef

define QT_EVENTDISPATCHER_LIBEVENT_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define QT_EVENTDISPATCHER_LIBEVENT_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(STAGING_DIR)
endef

define QT_EVENTDISPATCHER_LIBEVENT_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(TARGET_DIR)
endef

$(eval $(generic-package))
