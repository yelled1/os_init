#export QT_IM_MODULE=ibusjsl
#xhost +local:all  # allows display output of x-app for hyoon by other users
alias cc_mosh='mosh --ssh="/usr/bin/ssh -p 22464 -Y" hyoon@192.168.12.191'
alias ds_mosh='mosh --ssh="/usr/bin/ssh -i ~/.ssh/arthena-ds -Y" hoon@35.239.223.242'
alias ds_ssh='ssh -i ~/.ssh/arthena-ds hoon@35.239.223.242 -Y'
alias mt_sshfs='sshfs -oIdentityFile=/home/hyoon/.ssh/arthena-ds hoon@35.239.223.242:/home/hoon/ /home/hyoon/ds_sshfs/'
alias zzz='systemctl suspend'
alias blue='sudo /etc/init.d/bluetooth restart'
alias h='history'
alias j='jobs -l'
alias rm='rm -i'
alias mv='mv -i'
alias cls='clear'
alias cd..='cd ..'
alias aptuu='sudo apt update && sudo apt upgrade' # sudo apt-get install --install-recommends winehq-devel
alias redoteam='sudo teamviewer --daemon stop start TeamViewer daemon && sudo teamviewer --daemon start start TeamViewer daemon'
alias ianyssh='ssh -p 22461 hyoon@iany.mooo.com -X -C'
alias sithssh='ssh -p 22464 hyoon@iany.mooo.com -X -C'
alias lsith='ssh 192.168.12.191 -p22464'
alias keyssh='ssh -p 22 hyoon@192.168.1.112 -X -C'
alias ipcurl='curl ipinfo.io/`dig @resolver1.opendns.com ANY myip.opendns.com +short`'

#alias ianvnc='ssh -L 12345:localhost:5900 hyoon@24.168.123.151 -p 22460'
#alias wakeupIan='/usr/bin/wakeonlan 00:23:4e:a2:73:1f' ## replace mac with your actual server mac address #
#alias Kakao='env LANG=ko_KR.UTF-8 env WINEPREFIX="$HOME/.wine" wine C:\\\\windows\\\\command\\\\start.exe /Unix $HOME/.wine/dosdevices/c:/users/Public/Desktop/KakaoTalk.lnk'
#alias kkao='pkill -f Kakao && Kakao'
#alias kkao="kill `ps auxww | grep Kakao | awk '{print $2}' | while read line; do echo "$RANDOM $line"; done | sort | cut -d ' ' -f 2 | head -n 1`"
alias diff='colordiff'
alias rotate='for file in *.jpeg; do convert $file -rotate 90 r-$file; done'

if [ $UID -ne 0 ]; then
	alias apt-get='sudo apt-get'
	alias update='sudo apt-get upgrade'
	alias reboot='sudo reboot'
fi

alias fastping='ping -c 100 -s.2'
alias ports='netstat -tulanp'

#alias vi='nvim'
alias nyao='nyaovim'
alias ssc='sbt console'
export BROWSER="gnome-open %s"
alias em='emacs ' #-nw'

alias duB='du -s .[^.]*'
alias ipyQ='ipython qtconsole --pylab&'
#alias ipy='echo "####*env of SPk*#####" && /opt/miniconda/envs/SPk/bin/ipython'

alias hadooper='sudo -i -H -u hadoop'
alias refresh='pcmanfm --desktop-off && pcmanfm --desktop --profile lubuntu'
alias wino='env LANG=ko_KR.UTF-8 wine'
export WINEARCH=win32
alias python2='/usr/bin/python'
alias rmlnk='find ~/.wine32 -iname  "*.*x*.lnk" -exec rm {} \;'

export HADOOP_HOME="/usr/local/hadoop/"
export SPARK_HOME=/opt/spark
export SCALA_HOME=/usr/local/share/scala
#export SCALA_HOME=/home/hyoon/Downloads/scala-2.11.12
#export TERM=xterm-color
export MAVEN_OPTS="-Xmx2g -XX:MaxPermSize=512M -XX:ReservedCodeCacheSize=512m"
export PATH=$SCALA_HOME/bin:$PATH:$SPARK_HOME/bin
#export PATH=$PATH:$HOME/.local/bin:$HOME/bin:$SPARK_HOME/bin

#tar zcvf /media/hyoon/HitachNTFS/_Wine32MSO2010/wine32_20151129.tar.gz .wine32/
#scp -P 22461 /home/hyoon/.emacs  hyoon@iany.mooo.com:/tmp
#rsync -av --progress --inplace --rsh='ssh -p22461' .  hyoon@iany.mooo.com:/media/Store/_Movies/Transf
#rsync -aHAXxv --numeric-ids --progress -e "ssh -p22461 -T -c arcfour -o Compression=no -x" /home/hyoon/.wine32 hyoon@192.168.0.3:/tmp/.wine32
#alias Transync1='rsync -aHAXxv --numeric-ids --progress -e "ssh -p22461 -T -c arcfour -o Compression=no -x" /media/hyoon/Store/_Movies/Transf hyoon@iany.mooo.com:/opt'

#sudo find / -path /media -prune -o -iname '%1' -print
#grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep @#$#@%  # grep ppa name

export NO_AT_BRIDGE=1 # to fix Emacs port Warning msgs

#export PYSPARK_DRIVER_PYTHON="jupyter"
#export PYSPARK_DRIVER_PYTHON_OPTS="notebook"
#export PYSPARK_DRIVER_PYTHON="/opt/miniconda/envs/SPk/bin/ipython" #/opt/sprk/bin/pyspark
#export PYSPARK_PYTHON=/opt/miniconda/envs/SPk/bin/python   # for SPk pyspark run
#export PYSPARK_PYTHON=/opt/miniconda/envs/toree/bin/python # for Toree pyspark run

#export PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/build:$SPARK_HOME/python/lib/py4j-0.10.1-src.zip:$PYTHONPATH
#export PYTHONPATH=/opt/miniconda2/lib/python2.7/site-packages:$SPARK_HOME/python:$SPARK_HOME/python/build:$SPARK_HOME/python/lib/py4j-0.10.1-src.zip:$PYTHONPATH

#export PYTHONPATH=/opt/miniconda2/lib/python2.7/site-packages:$SPARK_HOME/python:$SPARK_HOME/python/build:$SPARK_HOME/python/lib/py4j-0.10.1-src.zip:$PYTHONPATH
#export ETS_TOOLKIT='qt5'
#export QT_API='pyqt5'
#/opt/miniconda2/envs/toree/lib/python2.7/site-packages
#/opt/miniconda2/lib/python2.7/site-packages

export LD_LIBRARY_PATH="/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64:/usr/lib/x86_64-linux-gnu/gtk-2.0/modules"
#export LD_PRELOAD="$LD_PRELOAD:/opt/miniconda/lib/libmkl_avx2.so:/opt/miniconda/lib/libmkl_core.so:/opt/miniconda/lib/libmkl_sequential.so"
export CUDA_HOME=/usr/local/cuda
export PATH=/usr/local/cuda/bin:$PATH
alias jkpy='cd /opt/Prj/UDacity/AutoAuto/TF/ && source activate keras'
alias j3py='cd /opt/Prj/UDacity/AutoAuto/ && source activate Py3'
alias sprk='cd /opt/Prj/uDemy/pySpark && source activate SPk' # && pyspark'
alias gitcompush='git commit -a -m 'msg'; git push'
alias gitpulldn='git pull origin master'
alias grph='git log --all --decorate --oneline --graph'
alias gitpulldn='git pull origin master'
alias Amm='JAVA_OPTS=-Xmx6G /usr/local/bin/amm' 
export CX_BOTTLE_PATH="/media/BK5/CxBottles"
export BROWSER="/usr/bin/google-chrome-stable %s"
#export BROWSER="gnome-open %s"
# Below is for Theano MKL_THREADING_LAYER=GNU
export MKL_THREADING_LAYER=GNU
alias jlab='pipenv run jupyter lab --ip=0.0.0.0 --no-browser --port=8999'
#smbclient -L //192.168.1.2 
#sudo mkdir /media/hyoon/cifsShare
#sudo mount -t cifs //192.168.1.2/recovery /media/hyoon/cifsShare -o username=hyoon
#sudo mount -t cifs -o username=hyoon,uid=1001,gid=1001,file_mode=0777,dirmode=0777 //192.168.1.2/recovery /media/hyoon/cifsShare
#sudo umount -t cifs /media/hyoon/cifsShare 
#kill `ps -ef | grep blueproxim | grep -v grep | awk '{print $2}'`
# tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PATH="/home/hyoon/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PYTHON_CONFIGURE_OPTS="--enable-shared"
