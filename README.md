android_device_acer_swing_pac
=============================

Pac source config for acer swing
How to use ?

goto 
/vendor/pac/products/AndroidProducts.mk

open it and in the end add

ifeq (pac_swing,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/pac_swing.mk
endif


now goto 
vendor/pac/dependencies
and paste the swing.dependencies file inside that folder

now goto 
vendor/pac/products 

and paste pac_swing.mk inside

Now compile like u used to do :D

Special Thanks to:
SpaceCaker
davidevinavil
Vache
Shr3ps