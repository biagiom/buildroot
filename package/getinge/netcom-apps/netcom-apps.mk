NETCOM_APPS_SOURCE =
NETCOM_APPS_SITE = $(GETINGE_APPS_TOPDIR)

NETCOM_APPS_DEPENDENCIES = netcom-cgic

define NETCOM_APPS_EXTRACT_CMDS
	cp -a $(NETCOM_APPS_SITE)/* $(@D)/
endef

NETCOM_APPS += $(if $(BR2_PACKAGE_NETCOM_APPS_DATABUFFERD),databufferd)
NETCOM_APPS += $(if $(BR2_PACKAGE_NETCOM_APPS_DEVCOMD),devcomd)
NETCOM_APPS += $(if $(BR2_PACKAGE_NETCOM_APPS_MODBUSD),modbusd)
NETCOM_APPS += $(if $(BR2_PACKAGE_NETCOM_APPS_NCLIC),nclic)
# Disabled, depends on Axis specific things for GPIO
# NETCOM_APPS += $(if $(BR2_PACKAGE_NETCOM_APPS_NCUTILD),ncutild)
NETCOM_APPS += $(if $(BR2_PACKAGE_NETCOM_APPS_NETCOMLOCATOR),netcomlocator)
NETCOM_APPS += $(if $(BR2_PACKAGE_NETCOM_APPS_PACS2000D),pacs2000d)
NETCOM_APPS += $(if $(BR2_PACKAGE_NETCOM_APPS_PACSBUFFERD),pacsbufferd)
NETCOM_APPS += $(if $(BR2_PACKAGE_NETCOM_APPS_PRINTLOGD),printlogd)
NETCOM_APPS += $(if $(BR2_PACKAGE_NETCOM_APPS_PRINTSCAND),printscand)
NETCOM_APPS += $(if $(BR2_PACKAGE_NETCOM_APPS_PRTUTIL),prtutil)
# Disabled, needs AeOSLocal.h, origin unknown
# NETCOM_APPS += $(if $(BR2_PACKAGE_NETCOM_APPS_REMOTEAGENT),remoteAgent)
# Disabled, already packaged separatly. What to do ?
# NETCOM_APPS += $(if $(BR2_PACKAGE_NETCOM_APPS_SERSRVD),sersrvd)
NETCOM_APPS += $(if $(BR2_PACKAGE_NETCOM_APPS_SNTPDATE),sntpdate)
NETCOM_APPS += $(if $(BR2_PACKAGE_NETCOM_APPS_WEBSETUP),websetup)

NETCOM_APPS_BUILD_FLAGS = 		\
	CC="$(TARGET_CC)" 		\
	CXX="$(TARGET_CXX)" 		\
	LD="$(TARGET_LD)" 		\
	CFLAGS="$(TARGET_CFLAGS)" 	\
	CXXFLAGS="$(TARGET_CXXFLAGS)" 	\
	LDFLAGS="$(TARGET_LDFLAGS)"	\
	BUILDROOT=1

define NETCOM_APPS_BUILD_CMDS
	for app in $(NETCOM_APPS) ; do \
		$(MAKE) -C $(@D)/$$app $(NETCOM_APPS_BUILD_FLAGS) clean || exit 1 ; \
		$(MAKE) -C $(@D)/$$app $(NETCOM_APPS_BUILD_FLAGS) || exit 1 ; \
	done
endef

NETCOM_APPS_INSTALL_FLAGS = 		\
	BUILDROOT=1			\
	DESTDIR="$(TARGET_DIR)"		\
	INSTALL="$(INSTALL)"

define NETCOM_APPS_INSTALL_TARGET_CMDS
	for app in $(NETCOM_APPS) ; do \
		$(MAKE) -C $(@D)/$$app $(NETCOM_APPS_INSTALL_FLAGS) install || exit 1 ; \
	done
endef

$(eval $(call GENTARGETS,package/getinge,netcom-apps))