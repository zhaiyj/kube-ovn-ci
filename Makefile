REGISTRY = etcdnecx
RELEASE_TAG = $(shell cat VERSION)

# ARCH could be amd64,arm64
ARCH = amd64

.PHONY: base-amd64
base-amd64:
	docker buildx build --platform linux/amd64 --build-arg ARCH=amd64 -t $(REGISTRY)/kube-ovn-base:$(RELEASE_TAG)-amd64 -o type=docker -f dist/images/Dockerfile.base dist/images/

.PHONY: base-arm64
base-arm64:
	docker buildx build --platform linux/arm64 --build-arg ARCH=arm64 -t $(REGISTRY)/kube-ovn-base:$(RELEASE_TAG)-arm64 -o type=docker -f dist/images/Dockerfile.base dist/images/

.PHONY: base-tar-amd64
base-tar-amd64:
	docker save $(REGISTRY)/kube-ovn-base:$(RELEASE_TAG)-amd64 -o image-amd64.tar

.PHONY: base-tar-arm64
base-tar-arm64:
	docker save $(REGISTRY)/kube-ovn-base:$(RELEASE_TAG)-arm64 -o image-arm64.tar

.PHONY: base-ovs-arm64
base-ovs-arm64:
	docker buildx build --platform linux/arm64 --build-arg ARCH=arm64 -t $(REGISTRY)/ovs-base:$(RELEASE_TAG)-arm64 -o type=docker -f dist/images/Dockerfile-ovs-arm.base dist/images/

.PHONY: base-tar-ovs-arm64
base-tar-ovs-arm64:
	docker save $(REGISTRY)/ovs-base:$(RELEASE_TAG)-arm64 -o image-ovs-arm64.tar

.PHONY: clean
clean:
	$(RM) image-amd64.tar image-arm64.tar
