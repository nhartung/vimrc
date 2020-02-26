# Notes for NVIM
- Updated Ubuntu path to not include Windows paths by following this:  
https://github.com/microsoft/WSL/issues/1493#issuecomment-417639271
Essentially, you need to change HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Lxss\{GUID}\Flags from 7 to 5.

- Installed compilers.

```
sudo apt install gcc  
sudo apt install g++
```

- make was already installed, but installed cmake.

```
sudo apt install cmake
```

- Install dependancies for building nvim. (Some duplicates)

```
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
```

- Build nvim  
https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites

```
git clone https://github.com/neovim/neovim.git  
make CMAKE_BUILD_TYPE=Release  
sudo make install
```

Note that I needed to unmont my c drive in wsl. cmake was finding libraries on the Windows side instead of the Ubuntu side.

- Vim Plugins  
Installed vim-plug
https://github.com/junegunn/vim-plug

```
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \  
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Cloned my init.vim file and copied it to ~/.config/nvim/init.vim
Ran PlugInstall within nvim
One of my plugins relies on a "NERD Font". Need to install and configure one with my terminal (Windows Terminal)
coc requires node which I installed as follows:

```
    curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -  
    sudo apt-get install -y nodejs
```

This follows the instructions here: https://github.com/nodesource/distributions/blob/master/README.md#deb

- Built coc (c/c++ parser server)  
Following the instructions here for Ubuntu 18.04: https://github.com/MaskRay/ccls/wiki/Build

```
wget -c http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz  
tar xf clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz  
cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$PWD/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04  
cmake --build Release
```

I also needed the following libraries in order to link:  
```
sudo apt-get install zlib1g-dev  
sudo apt-get install libtinfo-dev
```

- Updated the coc config file to include the coc server  
This can be accessed via the :CocConfig command in nvim.
See the config file in this repo. You may need to update paths to be consistent with the system you are on.
