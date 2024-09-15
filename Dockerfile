FROM container-registry.oracle.com/graalvm/native-image-community:17-ol8

# For SDKMAN to work we need unzip & zip
RUN microdnf install unzip zip findutils

RUN \
    # Install SDKMAN
    curl -s "https://get.sdkman.io" | bash; \
    source "$HOME/.sdkman/bin/sdkman-init.sh"; \
    sdk install maven;
