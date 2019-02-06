################################################################
# BOOT BASH SCRIPT
# this is for setting up the RPI's SD card
#
# 1. SSH
# 2. Sets a wifi connection
# 3. enables LCD screen
#
# run with sudo sh new-rpi-image.sh
#
# make sure all paths are writing to the SD card root path
# !/bin/sh 
############################################################### 

# create and empty SSH file
sudo cat >/Volumes/boot/SSH <<-__END__

__END__



#Create a new file in the same drive with name of “wpa_supplicant.conf” without any extension in the end and paste the following contents in there (Change SSID and Password according to your own network).
sudo cat >/Volumes/boot/wpa_supplicant.conf <<-__END__
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
network={
ssid="goth palace-EXT"
psk="BeAr1019$"
}
__END__

#add LCD screen to config.txt file
cat >/Volumes/boot/config.txt <<EOF

# set current over USB to 1.2A
max_usb_current=1

# overscan to adjust image position
overscan_left=0
overscan_right=0
overscan_top=0
overscan_bottom=0

# HDMI config
hdmi_drive=1
hdmi_ignore_edid=0xa5000080
hdmi_group=2
hdmi_mode=87

# 1024x600 display
hdmi_cvt=1024 600 60 3 0 0 0
EOF