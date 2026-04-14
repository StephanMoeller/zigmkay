
build:
	zig build compile_test

run:
	zig build compile_and_run_test

customtest:
	@find src -name "*.test.zig" | xargs -I{} zig test --test-runner src/custom_test_runner.zig {}

test: build
	zig build compile_and_run_test 



