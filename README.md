`docker build -t wehrly.com .`

`docker run -dit -v "$PWD":/usr/local/apache2/htdocs/ -p 8080:8080 wehrly.com`