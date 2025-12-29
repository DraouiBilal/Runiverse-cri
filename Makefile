PROTO_DIR := proto
GOOGLEAPIS_DIR := thirdparties/googleapis
PROTO_FILES := $(wildcard $(PROTO_DIR)/*.proto)
PB_FILES := $(PROTO_DIR)/invoker.proto
PB_OUTPUT := invoker_descriptor

.PHONY: proto

proto: $(PROTO_FILES)
	protoc \
		-I=$(PROTO_DIR) \
		-I=$(GOOGLEAPIS_DIR) \
		--go_out=. \
		--go-grpc_out=. \
		$^

pb_files: $(PB_FILES)
	protoc \
		-I=$(PROTO_DIR) \
		-I=$(GOOGLEAPIS_DIR) \
		--include_imports \
		--include_source_info \
		--descriptor_set_out="$(PB_OUTPUT).pb" \
		$^

