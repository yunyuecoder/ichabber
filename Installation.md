Download and unzip the application, copy iChabber.app to the device using your preferred method.

In OSX and linux systems you can copy it with ssh, for example. Type the following commands in console:
```
$ cd <Directory with iChabber.app>
$ scp -rp iChabber.app root@ipod:/Applications/
```

Perhaps, Windows users will like to use [iphonedisk](http://code.google.com/p/iphonedisk/) for access to device file system.
If the application is copied with iphonedisk, you will need to change the application attribute. Use ssh or [mobile terminal](http://code.google.com/p/mobileterminal) to change the attribute.

SSH way:
```
$ ssh root@ipod chmod +x /Applications/iChabber.app/iChabber
```

Mobile terminal:
```
$ chmod +x /Applications/iChabber.app/iChabber
```

Reboot the device to display the application icon.