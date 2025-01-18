FROM eclipse-temurin:8-alpine

# Install curl
RUN apk add --no-cache curl

# Create server/ directory
RUN mkdir -p /usr/local/reindev
WORKDIR /usr/local/reindev

# Download the ReIndev server from GDrive
RUN curl -L -o server.jar "https://drive.google.com/uc?export=download&id=1iqIQZUnrE2jYAZlCa4gzcjNu5Jp39TxP"
RUN chmod +x server.jar

# "Accept" the EULA
RUN echo "eula=true" > eula.txt

# Run the server
CMD ["java", "-jar", "/usr/local/reindev/server.jar"]