PROTO_DIR := proto
GOOGLEAPIS_DIR := thirdparties/googleapis
PROTO_FILES := $(wildcard $(PROTO_DIR)/*.proto)

.PHONY: proto

proto: $(PROTO_FILES)
	protoc \
		-I=$(PROTO_DIR) \
		-I=$(GOOGLEAPIS_DIR) \
		--go_out=. \
		--go-grpc_out=. \
		$^

