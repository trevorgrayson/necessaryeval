server:
	hexo server

install:
	npm install hexo-cli -g

package:
	# static files
	hexo generate
	cp static/* public/

deploy: package
	mkdir dist
	tar cfz --transform s/^public/necessaryeval.com dist/necessaryeval.tar.gz public
	scp dist/necessaryeval.tar.gz necessaryeval.com:/srv/vhosts/

# hexo deploy
# hexo new "my post"
#$ npm install hexo-deployer-git --save

