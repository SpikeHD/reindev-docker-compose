FROM eclipse-temurin:8-jre-noble

# Install curl
RUN apt update && apt install -y curl jq

# Create server/ directory
RUN mkdir -p /usr/local/reindev
WORKDIR /usr/local/reindev

# Copy scripts
COPY scripts/ scripts/

# Fix perms of scripts
RUN chmod +x scripts/bootstrap.sh
RUN chmod +x scripts/start.sh

# Run the server
CMD scripts/bootstrap.sh; scripts/start.sh