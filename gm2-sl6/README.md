# gm2-sl6

Muon g-2 development environment. 

* Runs in Scientific Linux 6
* Uses host `/cvmfs`
* Uses host `/pnfs` (use sshfs)
* Has `/gm2` for work
* Has Kerberos
* Has OSG client for `voms-proxy-init`

Run with 
```bash
docker run -it --rm -v $PWD:/gm2 gm2-sl6
```
