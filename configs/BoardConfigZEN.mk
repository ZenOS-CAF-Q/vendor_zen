include vendor/zen/configs/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/zen/configs/BoardConfigQcom.mk
endif
