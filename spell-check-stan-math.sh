#!/bin/bash

[[ -e spell-check.py ]] || { echo >&2 "Must be run from inside pyspellcode/ directory."; exit 1; }

cd ../math
export path_to_spell_check=../pyspellcode

export files=$(find . -type f \( \( -wholename "./stan/math/*" -o -wholename "./test/*" \) \( -name "*.hpp" -o -name "*.cpp" \) \) )

$path_to_spell_check/spell-check.py -std=c++14 --path-to-tool=$path_to_spell_check --personal-dict=$path_to_spell_check/stan_dictionary --use-tool --extra-clang-arg="-DSTAN_OPENCL" --extra-clang-arg="-DOPENCL_DEVICE_ID=0" --extra-clang-arg="-DOPENCL_PLATFORM_ID=0" --extra-clang-arg="-DCL_HPP_ENABLE_EXCEPTIONS" --extra-clang-arg="-DCL_HPP_TARGET_OPENCL_VERSION=220" --extra-clang-arg='-D_REENTRANT' --include-dir=. --include-dir=lib/boost_1.72.0 --include-dir=lib/opencl_2.2.0 --include-dir=lib/eigen_3.3.3 --include-dir=lib/gtest_1.8.1/include --include-dir=lib/sundials_5.1.0/include --include-dir=lib/tbb_2019_U8/include $files
