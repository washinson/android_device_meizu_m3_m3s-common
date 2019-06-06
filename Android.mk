ifneq ($(filter m3 m3s, $(TARGET_DEVICE)),)

include $(call all-makefiles-under,$(call my-dir))

# HACK for prebuilt kernel
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)

endif
