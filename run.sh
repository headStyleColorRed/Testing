# Compile image and run container
docker build -t my-nginx-app .
docker run -it -d -p 80:80 my-nginx-app
