#!/usr/bin/env bash
wget https://github.com/hubutui/mingw-w64-cpuinfo-git/releases/download/v0.1/mingw-w64-x86_64-cpuinfo-git-r615.728f3e9-1-any.pkg.tar.zst
wget https://github.com/hubutui/mingw-w64-date/releases/download/v3.0.1/mingw-w64-x86_64-date-3.0.1-1-any.pkg.tar.zst
wget https://github.com/hubutui/mingw-w64-dlpack/releases/download/v0.6/mingw-w64-x86_64-dlpack-0.6-1-any.pkg.tar.zst
wget https://github.com/hubutui/mingw-w64-dmlc-core/releases/download/v0.3/mingw-w64-x86_64-dmlc-core-0.3-1-any.pkg.tar.zst
wget https://github.com/hubutui/mingw-w64-json/releases/download/v3.10.4/mingw-w64-x86_64-json-3.10.4-1-any.pkg.tar.zst
wget https://github.com/hubutui/mingw-w64-mimalloc/releases/download/v2.0.3/mingw-w64-x86_64-mimalloc-2.0.3-1-any.pkg.tar.zst
wget https://github.com/hubutui/mingw-w64-mp11/releases/download/v1.77.0/mingw-w64-x86_64-mp11-1.77.0-1-any.pkg.tar.zst
wget https://github.com/hubutui/mingw-w64-onnx/releases/download/v1.10.2/mingw-w64-x86_64-onnx-1.10.2-1-any.pkg.tar.zst

pacman -U --noconfirm \
  mingw-w64-x86_64-cpuinfo-git-r615.728f3e9-1-any.pkg.tar.zst \
  mingw-w64-x86_64-date-3.0.1-1-any.pkg.tar.zst \
  mingw-w64-x86_64-dlpack-0.6-1-any.pkg.tar.zst \
  mingw-w64-x86_64-dmlc-core-0.3-1-any.pkg.tar.zst \
  mingw-w64-x86_64-json-3.10.4-1-any.pkg.tar.zst \
  mingw-w64-x86_64-mimalloc-2.0.3-1-any.pkg.tar.zst \
  mingw-w64-x86_64-mp11-1.77.0-1-any.pkg.tar.zst \
  mingw-w64-x86_64-onnx-1.10.2-1-any.pkg.tar.zst
git clone https://github.com/microsoft/onnxruntime.git
cd onnxruntime
git submodule update --init --recursive

./build.sh --config Release --minimal_build --parallel --compile_no_warning_as_error \
 --skip_submodule_sync --disable_ml_ops --disable_exceptions \
 --disable_rtti --enable_reduced_operator_type_support --skip_tests --cmake_generator "MinGW Makefiles"
