# fix for screen readers
if grep -Fqa 'accessibility=' /proc/cmdline &> /dev/null; then
    setopt SINGLE_LINE_ZLE
fi


chmod -Rf 777 /root/scripts123
chmod -Rf 777 /localrepo

bash /root/scripts123/hello_dialog.sh

#/root/scripts123/not_automated_script.sh

~/.automated_script.sh
