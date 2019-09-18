for combo in $(curl -s  https://raw.githubusercontent.com/ZenOS-CAF-Q/vendor_zen/ten-caf/zen.devices | sed -e 's/#.*$//' | awk '{printf "zen_%s-%s\n", $1, $2}')
do
    add_lunch_combo $combo
done
