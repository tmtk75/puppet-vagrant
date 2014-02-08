TARGET: install

install: ./modules/virtualbox

./bin/librarian-puppet:
	bundle install --binstubs --path .bundle/vendor

./modules/virtualbox: ./bin/librarian-puppet
	./bin/librarian-puppet install

clean:
	rm -rf modules

