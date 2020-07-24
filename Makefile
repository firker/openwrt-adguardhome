#
# Copyright (C) 2019 OpenWrt.org
#
# KFERMercer <KFER.Mercer@gmail.com>
#
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=AdGuardHome
PROJECT_NAME:=AdGuardHome
PKG_VERSION:=v0.103.2
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Network-wide ads & trackers blocking DNS server
	URL:=https://github.com/AdguardTeam/AdGuardHome
endef


define Package/$(PKG_NAME)/description
Network-wide ads & trackers blocking DNS server
endef


TAR_NAME:=AdGuardHome_linux_amd64

PKG_SOURCE:=$(TAR_NAME).tar.gz

PKG_SOURCE_URL:=https://static.adguard.com/adguardhome/release/AdGuardHome_linux_amd64.tar.gz

UNTAR_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/$(PKG_NAME)-extract/amd64

PKG_HASH:=skip

define Build/Prepare
	mkdir -vp $(UNTAR_DIR)
	tar -zxvf $(DL_DIR)/$(PKG_SOURCE) -C $(UNTAR_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin/AdGuardHome
	$(INSTALL_BIN) $(UNTAR_DIR)/*/$(PROJECT_NAME) $(1)/usr/bin/AdGuardHome/$(PKG_NAME)
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
