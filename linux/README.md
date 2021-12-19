```shell
sudo cp vlc-protocol /usr/local/bin/
xdg-desktop-menu install vlc-protocol.desktop
xdg-open vlc://https://pbs.twimg.com/tweet_video/Cx5L_3FWgAAxzpM.mp4
```

To install using curl:
```
sudo curl -L -o /usr/local/bin/vlc-protocol https://github.com/stefansundin/vlc-protocol/raw/master/linux/vlc-protocol
sudo chmod +x /usr/local/bin/vlc-protocol
curl -L -o vlc-protocol.desktop https://github.com/stefansundin/vlc-protocol/raw/master/linux/vlc-protocol.desktop
xdg-desktop-menu install vlc-protocol.desktop
rm vlc-protocol.desktop
```
