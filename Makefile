server:
	hexo server

install:
	npm install hexo-cli -g

package:
	# static files
	hexo generate
	cp static/* public/

deploy: package
	mkdir -p dist
	tar --transform="s/^public/necessaryeval.com/" -czf  dist/necessaryeval.tar.gz public
	scp dist/necessaryeval.tar.gz ipsumllc.com:/srv/vhosts/

# hexo deploy
# hexo new "my post"
#$ npm install hexo-deployer-git --save

