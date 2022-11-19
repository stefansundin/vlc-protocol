# Easy bat-only install

This is easy to install, but a command line window will pop up briefly when you click a `vlc://` link. Try this first before you attempt the harder version.

Put the files from the bat directory in your VLC directory (usually `C:\Program Files (x86)\VideoLAN\VLC`), and then run `vlc-protocol-register.bat` as administrator (right-click the file and use _Run as administrator_).

[You can download the repository here.](https://github.com/stefansundin/vlc-protocol/archive/main.zip)

# Harder exe install

[You can download the exe file from the releases.](https://github.com/stefansundin/vlc-protocol/releases/latest)

Here's how to compile it yourself:

1. [Get bash set up](https://msdn.microsoft.com/en-us/commandline/wsl/about) and open a prompt.
2. Install git and the compiler: `sudo apt install git gcc-mingw-w64`
3. Go someplace where you can find the files later: `cd /mnt/c/Users/username/Desktop`
4. Download the files: `git clone https://github.com/stefansundin/vlc-protocol.git`
5. `cd vlc-protocol/windows/exe/`
6. `./build.sh`

Now, if successful, you should see a file named `vlc-protocol.exe`. Copy the exe file and the bat files to your VLC directory and run `vlc-protocol-register.bat` as administrator (right-click the file and use _Run as administrator_).
