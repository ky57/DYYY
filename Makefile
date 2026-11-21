#
#  DYYY
#
#  Copyright (c) 2024 huami. All rights reserved.
#  Channel: @huamidev
#  Created on: 2024/10/04
#

TARGET = iphone:clang:latest:15.1
ARCHS = arm64 arm64e

# 在 GitHub Actions 中运行时的特殊配置
ifeq ($(GITHUB_ACTIONS),true)
    export INSTALL = 0
    export FINALPACKAGE = 1
endif

export DEBUG = 0
INSTALL_TARGET_PROCESSES = Aweme

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DYYY

DYYY_FILES = DYYY.xm DYYYSettingViewController.m CityManager.m DYYYManager.m
DYYY_CFLAGS = -fobjc-arc -w
# 统一 runtime 与最低系统版本，避免混编警告
DYYY_CFLAGS += -fobjc-runtime=ios-15.1
CXXFLAGS += -std=c++11
CCFLAGS += -std=c++11
DYYY_LOGOS_DEFAULT_GENERATOR = internal

export THEOS_STRICT_LOGOS=0
export ERROR_ON_WARNINGS=0
export LOGOS_DEFAULT_GENERATOR=internal

include $(THEOS_MAKE_PATH)/tweak.mk

THEOS_DEVICE_IP = 192.168.31.222
THEOS_DEVICE_PORT = 22