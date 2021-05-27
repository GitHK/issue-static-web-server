While trying to run https://github.com/joseluisq/static-web-server as none root user there is a Permission denied error.



```shell
git clone ...
cd ...
make build
make run
custom-static-webserver:latest
thread 'main' panicked at 'Io(Os { code: 13, kind: PermissionDenied, message: "Permission denied" })', src/server.rs:72:25
stack backtrace:
   0:     0x7fae3dfd594c - <unknown>
   1:     0x7fae3df5738c - <unknown>
   2:     0x7fae3dfd4e01 - <unknown>
   3:     0x7fae3dfd47c0 - <unknown>
   4:     0x7fae3dfd3fe9 - <unknown>
   5:     0x7fae3dff200d - <unknown>
   6:     0x7fae3dff1f7c - <unknown>
   7:     0x7fae3dff1f2d - <unknown>
   8:     0x7fae3dff1e70 - <unknown>
   9:     0x7fae3dfaaa32 - <unknown>
  10:     0x7fae3df027a7 - <unknown>
  11:     0x7fae3df01233 - <unknown>
  12:     0x7fae3df02ca2 - <unknown>
make: *** [Makefile:18: run] Error 139
make shell
$ ls -lah /public/
total 32K
drwxr-xr-x    1 scu      scu         4.0K Apr 20 07:04 .
drwxr-xr-x    1 root     root        4.0K May 27 07:46 ..
-rw-r--r--    1 scu      scu          152 Apr 20 06:56 404.html
-rw-r--r--    1 scu      scu          175 Apr 20 06:56 50x.html
drwxr-xr-x    1 scu      scu         4.0K Apr 20 06:56 assets
-rw-r--r--    1 scu      scu          483 Apr 20 06:56 index.html
```