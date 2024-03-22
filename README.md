chroot-based Klipper host
基于chroot容器的Klipper上位机

设计为用于PostmarketOS, 也可适用于其他Linux发行版, 只要串口能正常使用即可  

使用前准备:  
- 将所需的rootfs解压到本目录下rootfs目录  

自行安装(如使用预装好的rootfs,则跳过):
- 进行以下操作:
```
apt install sudo
useradd klippy
usermod -a -G sudo klippy
mkdir -p /home/klippy/
chown klippy:klippy /home/klippy/
su klippy # 进入klippy用户
cd ~
```
- 然后安装kiauh,安装后将`scripts`文件夹下的脚本复制到`rootfs/home/klippy/scripts`目录下.  


对于PostmarketOS, 如需通过wifi正常访问可能需要以下操作:  
默认开放 80(WebUI), 7125(Moonraker) 端口.如需使用其他端口(如摄像头), 请在`99_klipper.nft`中另外添加(格式参考原有规则), 再运行命令.  
```
sudo cp 99_klipper.nft /etc/nftables.d/ 
sudo service nftables restart
```

如何启动:  
- 先运行`mount.sh`挂载容器所需目录  
- 然后`start_all.sh`进入chroot并启动klipper  

其他脚本:  
- `start_klipperscreen.sh`可用于启动klipperscreen  
- `chroot.sh`用于进入chroot shell,默认为`root`用户  
- `chroot_klippy.sh`用于进入chroot shell并切换到`klippy`用户  
- `umount.sh`用于解除挂载容器  
