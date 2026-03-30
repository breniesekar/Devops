FROM nginx:latest

# Remove default config
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Create directory inside container
RUN mkdir -p /var/opt/nginx

# Expose port
EXPOSE 80
