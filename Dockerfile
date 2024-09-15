FROM container-registry.oracle.com/graalvm/native-image-community:17-ol8

# For SDKMAN to work we need unzip & zip
RUN microdnf install unzip zip gzip findutils make

RUN \
    # Install SDKMAN
    curl -s "https://get.sdkman.io" | bash; \
    source "$HOME/.sdkman/bin/sdkman-init.sh"; \
    sdk install maven;
    # install musl.cc
    curl -sSL https://more.musl.cc/10/x86_64-linux-musl/x86_64-linux-musl-native.tgz | tar -xz -C /usr/local; \
    export CC=/usr/local/x86_64-linux-musl-native/bin/gcc; \
    # install zlib-1.2.13
    curl -sSL https://github.com/madler/zlib/releases/download/v1.2.13/zlib-1.2.13.tar.gz | tar -xz -C /tmp; \
    cd /tmp/zlib-1.2.13 && ./configure --prefix=/usr/local/x86_64-linux-musl-native --static && make && make install; \
    export PATH=/usr/local/x86_64-linux-musl-native/bin:PATH
