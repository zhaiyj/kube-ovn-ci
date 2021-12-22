REGISTRY = etcdnecx
RELEASE_TAG = $(shell cat VERSION)

# ARCH could be amd64,arm64
ARCH = amd64

.PHONY: base-amd64
base-amd64:
	docker buildx build --platform linux/amd64 --build-arg ARCH=amd64 -t $(REGISTRY)/kube-ovn-base:$(RELEASE_TAG)-amd64 -o type=docker -f dist/images/Dockerfile.base dist/images/

.PHONY: base-tar-amd64
base-tar-amd64:
	docker save $(REGISTRY)/kube-ovn-base:$(RELEASE_TAG)-amd64 -o image-amd64.tar

.PHONY: clean
clean:
	$(RM) image-amd64.tar image-arm64.tar
