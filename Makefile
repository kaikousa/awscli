build:
	docker build -t kaikousa/awscli:latest .

publish:
	docker push kaikousa/awscli
