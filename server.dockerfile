FROM eclipse-temurin:8-jre-noble

# Install curl
RUN apt update && apt install -y curl

# Create server/ directory
RUN mkdir -p /usr/local/reindev
WORKDIR /usr/local/reindev

# Copy scripts
COPY scripts/ scripts/

# Download the server (different for FoxLoader and Vanilla)
RUN chmod +x scripts/bootstrap.sh
RUN scripts/bootstrap.sh

# Copy extra files
COPY extra/ extra/

# Change permissions
RUN chmod +x scripts/start.sh

# Run the server
CMD ["scripts/start.sh"]