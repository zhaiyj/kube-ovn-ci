# kube-ovn-base
- 此仓库对 ovs/ovn 二进制编译、镜像打包，用作 kube-ovn 的基础镜像
- Docker 仓库暂用 etcdnecx
- main 分支版本保持和上游一致
- 考虑到 CX5/CX6 offload 的兼容，ECX ovs/ovn 版本使用 ovs 2.14、ovn 20.06