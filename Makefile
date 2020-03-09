server:
	hexo server
compile:
	npm install hexo-cli -g
package:
	# static files
	hexo generate
	cp static/* public/

# hexo deploy
# hexo new "my post"
#$ npm install hexo-deployer-git --save

