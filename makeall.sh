#add by haowei.cheng
make distclean
make stm32f749_wifiwatch_config
make
#for debug
arm-none-eabi-objdump -d u-boot>u-boot.s
