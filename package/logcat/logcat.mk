LOGCAT_SITE_METHOD = git
LOGCAT_SITE = https://github.com/gtxaspec/linux_logcat
LOGCAT_VERSION = $(shell git ls-remote $(LOGCAT_SITE) HEAD | head -1 | cut -f1)

LOGCAT_LICENSE = GPL-2.0
LOGCAT_LICENSE_FILES = COPYING

LOGCAT_INSTALL_STAGING = YES

LOGCAT_DEPENDENCIES = host-upx
define LOGCAT_INSTALL_STAGING_CMDS
        $(HOST_DIR)/bin/upx --best --lzma $(@D)/logcat/logcat
        $(HOST_DIR)/bin/upx --best --lzma $(@D)/logwrapper/logwrapper
endef

$(eval $(cmake-package))
