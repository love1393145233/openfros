#product_list="xiaomi_3gpro  xiaomi_4  xiaomi_r3gv2  xiaomi_r4a  xiaoyu_c5  youku_l2"
#product_list="redmi_ac2100 xiaomi_ac2100 newifi3 xiaomi_660x hiwifi_5962  hiwifi_hc5661  k2p  xiaomi_3g  xiaomi_3gpro  xiaomi_4  xiaomi_r3gv2  xiaomi_r4a  xiaoyu_c5  youku_l2 jdyun_128 jdyun"
product_list="redmi_ac2100 xiaomi_ac2100 newifi3 xiaomi_660x hiwifi_5962 k2p  xiaomi_3g  xiaomi_3gpro  xiaomi_4  xiaomi_r3gv2  xiaomi_r4a  xiaoyu_c5  youku_l2 gehua"
#product_list="xiaomi_3g  xiaomi_3gpro  xiaomi_4  xiaomi_r3gv2  xiaomi_r4a  xiaoyu_c5  youku_l2 "
#product_list="hiwifi_hc5661  k2p  xiaomi_3g  xiaomi_3gpro  xiaomi_4  xiaomi_r3gv2  xiaomi_r4a  xiaoyu_c5  youku_l2"
#product_list="redmi_ac2100 newifi3 xiaomi_ac2100 xiaomi_660x hiwifi_5962 xiaomi_3gpro xiaomi_r4a xiaomi_r3gv2 youku_l2 xiaoyu_c5"
#product_list="xiaomi_3g xiaomi_4"
#product_list="x86_64"
#product_list="xiaomi_ax3600"
#product_list="jdyun jdyun_128"
#product_list="bcm2710_rpi"
#product_list="orange_pi"
#product_list="k3"

rlog(){
    date_str=`date`
    echo "$date_str  $1" >>./build2.log
}
core=1
if [ $# -gt 0 ];then
	core=$1
fi

echo "core num = $core"
for p in $product_list; do
	echo "product=$p"
	rlog "begin build product $p"
	rm tmp -fr
	make product=$p  -j$core
	if [ $? -ne 0 ];then
		rlog "build product $p failed."
		exit

	fi
	rlog "build product $p ok"
done

