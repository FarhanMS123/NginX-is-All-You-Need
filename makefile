test:
	echo "I am here" && \
	pwd && \
	ls -lah
start:
	nginx
	npm start