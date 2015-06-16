# Custom Docker image for CoreOS toolbox

Read about it at [https://coreos.com/docs/cluster-management/debugging/install-debugging-tools/]().

Includes:

* [htop](http://hisham.hm/htop/)
* [ps_mem.py](https://github.com/pixelb/ps_mem/)

## Usage

```bash
$ cat ~/.toolboxrc
TOOLBOX_DOCKER_IMAGE=helder/toolbox
TOOLBOX_USER=root
$ toolbox
```
