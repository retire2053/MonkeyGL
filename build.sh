argNum=$#
source_path=$(pwd)

build_path=${source_path}"/build"

py_build_path=${source_path}"/pybind11_interface/build"

build_type=$2

makesure_folder(){
  if [ ! -d $1 ];then
    mkdir $1
  fi
}

remove_folder(){
  if [ -d $1 ];then
    echo "remove folder: " $1
    rm -rf $1
  fi
}

build_zlib() {
    makesure_folder ${build_path}
    cd ${build_path}
    if [ ${build_type} == "Clean" ]; then
      echo "clean zlib build"
      rm -rf ./zlib-1.2.11
    else
      if [ ! -d "./zlib-1.2.11" ];then
        tar -xvzf ../ThirdPartyDownloads/zlib-1.2.11.tar.gz
      fi
      cd ./zlib-1.2.11

      if [ ! -d "./build" ];then
        mkdir build
        cd ./build
        cmake ../ -DCMAKE_BUILD_TYPE=${build_type}
        make DESTDIR=./install install
      fi
    fi
}

build_webp() {
    makesure_folder ${build_path}
    cd ${build_path}
    if [ ${build_type} == "Clean" ]; then
      echo "clean webp build"
      rm -rf ./libwebp-1.2.2
    else
      if [ ! -d "./libwebp-1.2.2" ];then
        tar -xvzf ../ThirdPartyDownloads/libwebp-1.2.2.tar.gz
      fi
      cd ./libwebp-1.2.2

      if [ ! -d "./build" ];then
        mkdir build
        cd ./build
        cmake ../ -DCMAKE_BUILD_TYPE=${build_type} -DBUILD_SHARED_LIBS=true
        make DESTDIR=./install install
      fi
    fi
}

build_log() {
    makesure_folder ${build_path}
    cd ${build_path}
    if [ ${build_type} == "Clean" ]; then
      echo "clean log build"
      rm -rf ./log4cplus-2.0.7
    else
      if [ ! -d "./log4cplus-2.0.7" ];then
        unzip ../ThirdPartyDownloads/log4cplus-2.0.7.zip
      fi
      cd ./log4cplus-2.0.7

      if [ ! -d "./build" ];then
        mkdir build
        cd ./build
        cmake ../ -DCMAKE_BUILD_TYPE=${build_type}
        make DESTDIR=./install install
      fi
    fi
}

build_cpp() {
    makesure_folder ${build_path}
    cd ${build_path}
    if [ ${build_type} == "Clean" ]; then
      echo "clean cpp build"
      rm -rf ./*
    else
      cmake ../ -DCMAKE_BUILD_TYPE=${build_type} -DSSE=1
      make
    fi
}

build_pybind() {
    makesure_folder ${py_build_path}
    cd ${py_build_path}
    if [ ${build_type} == "Clean" ]; then
      echo "clean pybind build"
      rm -rf ./*
    else
      cmake ../ -DCMAKE_BUILD_TYPE=${build_type}
      make
    fi
}

if [ $1 == "cpp" ]; then
    build_cpp
elif [ $1 == "log" ]; then
    build_log
elif [ $1 == "pybind" ]; then
    build_pybind
elif [ $1 == "all" ]; then
    build_log
    build_cpp
    build_pybind
else
    echo "invalid project"
fi