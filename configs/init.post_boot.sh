#!/system/bin/sh
# Copyright (c) 2009-2012, Code Aurora Forum. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of Code Aurora nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

target=`getprop ro.board.platform`

case "$target" in
    "msm8960")
         echo 1 > /sys/module/rpm_resources/enable_low_power/L2_cache
         echo 1 > /sys/module/rpm_resources/enable_low_power/pxo
         echo 1 > /sys/module/rpm_resources/enable_low_power/vdd_dig
         echo 1 > /sys/module/rpm_resources/enable_low_power/vdd_mem
         echo 1 > /sys/module/pm_8x60/modes/cpu0/power_collapse/suspend_enabled
         echo 1 > /sys/module/pm_8x60/modes/cpu1/power_collapse/suspend_enabled

         echo 0 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/suspend_enabled
         echo 0 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/suspend_enabled

         echo 0 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/idle_enabled
         echo 0 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/idle_enabled

         echo 1 > /sys/module/pm_8x60/modes/cpu0/power_collapse/idle_enabled
         echo "Lionheart" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
         echo "Lionheart" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor

         echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
         echo 1 > /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
         echo 4 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
         echo 10 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential
         echo 192000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
         echo 192000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
	 echo 1512000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
         echo 1512000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq

         chown system /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
         chown system /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
         chown system /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
         chown system /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq

         chown root.system /sys/devices/system/cpu/mfreq
         chmod 220 /sys/devices/system/cpu/mfreq
         chown root.system /sys/devices/system/cpu/cpu1/online


         echo 1 > /sys/module/msm_show_resume_irq/parameters/debug_mask
         echo 7 > /sys/module/wakelock/parameters/debug_mask
         chown system /sys/acer_input/enable
         start qosmgrd
         soc_id=`cat /sys/devices/system/soc/soc0/id`
         case "$soc_id" in
             "130")
                 echo 230 > /sys/class/gpio/export
                 echo 228 > /sys/class/gpio/export
                 echo 229 > /sys/class/gpio/export
                 echo "in" > /sys/class/gpio/gpio230/direction
                 echo "rising" > /sys/class/gpio/gpio230/edge
                 echo "in" > /sys/class/gpio/gpio228/direction
                 echo "rising" > /sys/class/gpio/gpio228/edge
                 echo "in" > /sys/class/gpio/gpio229/direction
                 echo "rising" > /sys/class/gpio/gpio229/edge
                 echo 253 > /sys/class/gpio/export
                 echo 254 > /sys/class/gpio/export
                 echo 257 > /sys/class/gpio/export
                 echo 258 > /sys/class/gpio/export
                 echo 259 > /sys/class/gpio/export
                 echo "out" > /sys/class/gpio/gpio253/direction
                 echo "out" > /sys/class/gpio/gpio254/direction
                 echo "out" > /sys/class/gpio/gpio257/direction
                 echo "out" > /sys/class/gpio/gpio258/direction
                 echo "out" > /sys/class/gpio/gpio259/direction
                 chown media /sys/class/gpio/gpio253/value
                 chown media /sys/class/gpio/gpio254/value
                 chown media /sys/class/gpio/gpio257/value
                 chown media /sys/class/gpio/gpio258/value
                 chown media /sys/class/gpio/gpio259/value
                 chown media /sys/class/gpio/gpio253/direction
                 chown media /sys/class/gpio/gpio254/direction
                 chown media /sys/class/gpio/gpio257/direction
                 chown media /sys/class/gpio/gpio258/direction
                 chown media /sys/class/gpio/gpio259/direction
                 ;;
         esac
         ;;
esac

chown system /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
chown system /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
chown system /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy

emmc_boot=`getprop ro.boot.emmc`
case "$emmc_boot"
    in "true")
        chown system /sys/devices/platform/rs300000a7.65536/force_sync
        chown system /sys/devices/platform/rs300000a7.65536/sync_sts
        chown system /sys/devices/platform/rs300100a7.65536/force_sync
        chown system /sys/devices/platform/rs300100a7.65536/sync_sts
    ;;
esac

case "$target" in
    "msm8960" | "msm8660" | "msm7630_surf")
        echo 10 > /sys/devices/platform/msm_sdcc.3/idle_timeout
        ;;
    "msm7627a")
        echo 10 > /sys/devices/platform/msm_sdcc.1/idle_timeout
        ;;
esac



# Install AdrenoTest.apk if not already installed
if [ -f /data/prebuilt/AdrenoTest.apk ]; then
    if [ ! -d /data/data/com.qualcomm.adrenotest ]; then
        pm install /data/prebuilt/AdrenoTest.apk
    fi
fi

busybox run-parts /system/etc/init.d/
