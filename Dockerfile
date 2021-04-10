FROM ghcr.io/graalvm/graalvm-ce:java11-21.0.0.2

# For SDKMAN to work we need unzip & zip
RUN microdnf install unzip zip

RUN \
    # Install SDKMAN
    curl -s "https://get.sdkman.io" | bash; \
    source "$HOME/.sdkman/bin/sdkman-init.sh"; \
    sdk install maven; \
    # Install GraalVM Native Image
    gu install native-image;
