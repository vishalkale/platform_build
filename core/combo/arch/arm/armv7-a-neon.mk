# Configuration for Linux on ARM.
# Generating binaries for the ARMv7-a architecture and higher with NEON
#
$(combo_2nd_arch_prefix)ARCH_ARM_HAVE_ARMV7A            := true
$(combo_2nd_arch_prefix)ARCH_ARM_HAVE_VFP               := true
$(combo_2nd_arch_prefix)ARCH_ARM_HAVE_VFP_D32           := true
$(combo_2nd_arch_prefix)ARCH_ARM_HAVE_NEON              := true

ifeq ($(TARGET_CPU_VARIANT),$(filter $(TARGET_CPU_VARIANT),cortex-a15 krait))
	arch_variant_cflags := -mcpu=cortex-a15
else
ifeq ($(strip $(TARGET_CPU_VARIANT)),cortex-a8)
	arch_variant_cflags := -mcpu=cortex-a8
else
ifeq ($(strip $(TARGET_CPU_VARIANT)),cortex-a7)
	arch_variant_cflags := -mcpu=cortex-a7
else
	arch_variant_cflags := -march=armv7-a
endif
endif
endif

arch_variant_cflags += \
    -mfloat-abi=softfp \
    -mfpu=neon

arch_variant_ldflags := \
	-Wl,--fix-cortex-a8
