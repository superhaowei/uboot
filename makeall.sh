#add by haowei.cheng
make distclean
#rm /home/haowei/samba_share/u-boot.bin -rf
#rm /home/haowei/samba_share/u-boot.s -rf
make stm32f746-discovery_config
make
#echo "cp bin start..."
#cp u-boot.bin /home/haowei/samba_share/
#echo "cp bin end!"
#for debug
arm-none-eabi-objdump -d u-boot>u-boot.s
#cp u-boot.s /home/haowei/samba_share/
