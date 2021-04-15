server:
	hexo server

install:
	npm install hexo-cli -g

package:
	# static files
	mkdir -p public
	cp static/* public/
	hexo generate

deploy: package
	mkdir -p dist
	tar --transform="s/^public/necessaryeval.com/" -czf  dist/necessaryeval.tar.gz public
	scp dist/necessaryeval.tar.gz cribnot.es:/srv/vhosts/

# hexo deploy
# hexo new "my post"
#$ npm install hexo-deployer-git --save

