LOCAL_PATH:= $(call my-dir)

ifneq ($(filter m3 m3s, $(TARGET_DEVICE)),)

include $(call first-makefiles-under,$(LOCAL_PATH))

$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)

endif
