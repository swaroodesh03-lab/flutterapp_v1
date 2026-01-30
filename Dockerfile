# Stage 1: Build
FROM ghcr.io/cirruslabs/flutter:stable AS build

# Set the working directory
WORKDIR /app

# Copy the project files
COPY . .

# Fetch dependencies
RUN flutter pub get

# Build the web application
RUN flutter build web --release

# Stage 2: Serve the application with Nginx
FROM nginx:alpine

# Copy the build artifacts from the build stage
COPY --from=build /app/build/web /usr/share/nginx/html

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose the port (Cloud Run defaults to 8080)
EXPOSE 8080

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
