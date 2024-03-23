## 一个基于chroot容器的Klipper上位机

设计为用于PostmarketOS, 也可适用于其他Linux发行版, 只要串口在`/dev/ttyACM*`或`/dev/ttyUSB*`可用即可.  

安装:  
1. 将本仓库克隆或下载到你需要安装klipper chroot容器的设备上.  
2. 获取 ubuntu-base rootfs:  
    在 http://mirrors.ustc.edu.cn/ubuntu-cdimage/ubuntu-base/releases/22.04/release 找到符合你设备架构的rootfs,下载到本目录,然后用以下命令解压到`rootfs`文件夹下:
    ```
    mkdir rootfs
    cd rootfs
    tar -xf ubuntu-base-*.tar.gz
    ```
    如有需要,进入`rootfs/etc/apt/sources.list`替换镜像源.
3. 先运行`mount.sh`挂载容器所需目录  
4. 进入容器,在其中创建并进入`klippy`用户,用于运行klipper:  
    ```
    sudo chroot rootfs /bin/bash
    apt update &&
    apt install sudo git -y
    useradd klippy
    usermod -a -G sudo klippy
    mkdir -p /home/klippy/
    chown klippy:klippy /home/klippy/
    su klippy
    cd ~
    ```
5. 在容器内的`klippy`用户,通过[kiauh](https://github.com/dw-0/kiauh)安装klipper, moonraker, klipperscreen和Mainsail/Fluidd  
6. 安装完退出chroot容器命令行, 将`scripts`文件夹下的脚本复制到`rootfs/home/klippy/scripts`目录下.  
7. 对于PostmarketOS, 如需通过wifi正常访问可能需要以下操作:  
    ```
    sudo cp 99_klipper.nft /etc/nftables.d/ 
    sudo service nftables restart
    ```
    默认开放 `80`(WebUI), `7125`(Moonraker) 端口.如需使用其他端口(如摄像头), 请在`99_klipper.nft`中另外添加(格式参考原有规则), 再运行命令.  

使用:  
1. 运行`mount.sh`挂载容器所需目录  
2. 然后`start_all.sh`启动chroot容器中的klipper  

其他脚本:  
- `start_klipperscreen.sh`: 启动klipperscreen  
- `chroot.sh`: 进入chroot shell,默认为`root`用户  
- `chroot_klippy.sh`: 进入chroot shell并切换到`klippy`用户  
- `umount.sh`: 解除挂载容器  

注意: 由于chroot容器中没有systemd,Moonraker的更新检测不可用,必须通过kiauh更新.忽略以下警告.  
```
    [machine]: DBus Connection Not available, systemd service tracking and actions are disabled
    Unable to retrieve Moonraker service info. Service file must be updated manually.
```

## A chroot-based Klipper host

Designed for PostMamarketOS, but also usable on other linux distros as long as the serial port is usable on `/dev/ttyACM*` or `/dev/ttyUSB*`  

Installation:
1. Clone or download this repository to the device you want to install klipper chroot container.  
2. Get ubuntu-base rootfs:  
    Find a rootfs for your device's architecture in http://cdimage.ubuntu.com/ubuntu-base/releases/22.04/release/ , download it to this folder, and unpack it to `rootfs` folder with the following:
    ```
    mkdir rootfs
    cd rootfs
    tar -xf ubuntu-base-*.tar.gz
    ```
    Enter `rootfs/etc/apt/sources.list` and replace repository with a mirror if needed.
3. Run `mount.sh` to mount directories for the container  
4. Enter the container, create and switch to user `klippy` inside it, for running klipper:  
    ```
    sudo chroot rootfs /bin/bash
    apt update &&
    apt install sudo git -y
    useradd klippy
    usermod -a -G sudo klippy
    mkdir -p /home/klippy/
    chown klippy:klippy /home/klippy/
    su klippy
    cd ~
    ```
5. Install klipper, moonraker, klipperscreen and Mainsail/Fluidd with [kiauh](https://github.com/dw-0/kiauh)  
6. Exit the chroot shell, then copy scripts in `scripts` folder to `rootfs/home/klippy/scripts`.  
7. For PostmarketOS, this config is probably needed for accessing via wifi:  
    ```
    sudo cp 99_klipper.nft /etc/nftables.d/ 
    sudo service nftables restart
    ```
    Opens port `80`(WebUI), `7125`(Moonraker) by default. For any additional ports, please add in `99_klipper.nft`, then execute the commands below.  

Usage:  
1. Run `mount.sh` first to mount directories for the container  
2. Run `start_all.sh` to run klipper in the container  

Other scripts:  
- `start_klipperscreen.sh`: Start klipperscreen  
- `chroot.sh`: Enter chroot shell, with `root` user  
- `chroot_klippy.sh`: Enter chroot shell, with `klippy` user  
- `umount.sh`: Unmount the container  

Notice that Moonraker's update checker is unavailable as There is no systemd in chroot. Use kiauh for updates instead. Ignore the following warnings.  
```
    [machine]: DBus Connection Not available, systemd service tracking and actions are disabled
    Unable to retrieve Moonraker service info. Service file must be updated manually.
```
