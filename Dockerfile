# Use a lightweight Nginx image as the base
FROM nginx:alpine

# Install git and vim
RUN apk add git vim

# Remove all files in the default Nginx directory
RUN rm -rf /usr/share/nginx/html/*

# Copy your website files to the default Nginx directory
COPY hooker.sh /usr/share/nginx/html

# Expose port 80 for Nginx to listen on
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
