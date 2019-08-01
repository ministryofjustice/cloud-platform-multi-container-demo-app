# If you change the Gemfile, use this to
# update the Gemfile.lock.
Gemfile.lock: Gemfile
	docker build -f Dockerfile.gems -t gem-installer .
	docker run --rm \
		-v $$(pwd):/app \
		-w /app \
		gem-installer bundle install
