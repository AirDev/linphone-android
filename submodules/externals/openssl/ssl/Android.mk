LOCAL_PATH:= $(call my-dir)

MY_LOCAL_SRC_FILES:= \
	s2_meth.c \
	s2_srvr.c \
	s2_clnt.c \
	s2_lib.c \
	s2_enc.c \
	s2_pkt.c \
	s3_meth.c \
	s3_srvr.c \
	s3_clnt.c \
	s3_lib.c \
	s3_enc.c \
	s3_pkt.c \
	s3_both.c \
	s23_meth.c \
	s23_srvr.c \
	s23_clnt.c \
	s23_lib.c \
	s23_pkt.c \
	t1_meth.c \
	t1_srvr.c \
	t1_clnt.c \
	t1_lib.c \
	t1_enc.c \
	ssl_lib.c \
	ssl_err2.c \
	ssl_cert.c \
	ssl_sess.c \
	ssl_ciph.c \
	ssl_stat.c \
	ssl_rsa.c \
	ssl_asn1.c \
	ssl_txt.c \
	ssl_algs.c \
	bio_ssl.c \
	ssl_err.c \
	kssl.c \
	d1_srvr.c \
	d1_clnt.c \
	d1_both.c \
	d1_pkt.c \
	d1_lib.c \
	d1_meth.c \
	d1_enc.c



MY_LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/.. \
	$(LOCAL_PATH)/../include \
	$(LOCAL_PATH)/../crypto


ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
include $(CLEAR_VARS)
LOCAL_SHARED_LIBRARIES += liblincrypto
LOCAL_MODULE:= liblinssl
LOCAL_C_INCLUDES := $(MY_LOCAL_C_INCLUDES)
LOCAL_SRC_FILES := $(MY_LOCAL_SRC_FILES)
include $(LOCAL_PATH)/../android-config.mk
include $(BUILD_SHARED_LIBRARY)

else

include $(CLEAR_VARS)
LOCAL_STATIC_LIBRARIES += libcrypto-static
LOCAL_MODULE:= libssl-static
LOCAL_C_INCLUDES := $(MY_LOCAL_C_INCLUDES)
LOCAL_SRC_FILES := $(MY_LOCAL_SRC_FILES)
include $(LOCAL_PATH)/../android-config.mk
include $(BUILD_STATIC_LIBRARY)
endif

