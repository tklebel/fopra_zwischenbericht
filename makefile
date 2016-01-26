
all: index.html 
	# self_contained.html

index.html: zwischenbericht.md zwischenbericht.css
	pandoc -t "revealjs"  $(<F) -o $(@F) --smart --standalone --toc --toc-depth=1 \
	-V revealjs-url:reveal.js \
	-V theme=sky \
	--css=zwischenbericht.css \
	-V transition=convex 

# self_contained.html: zwischenbericht.md zwischenbericht.css
# 	pandoc -t "revealjs"  $(<F) -o $(@F) --smart --standalone --toc --toc-depth=1 \
# 	-V revealjs-url:reveal.js \
# 	-V theme=sky \
# 	--css=zwischenbericht.css \
# 	-V transition=convex \
# 	--self-contained

live:
	git push
	git checkout gh-pages
	git merge master
	git push
	git checkout master
