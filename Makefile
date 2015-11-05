all: build/majbook.pdf

build/majbook.pdf: *.md
	mkdir -p build
	pandoc --toc \
				 -s \
				 -V title="Madison Area Jugglers' Pattern Book" \
				 -V documentclass=book \
				 -V subtitle="Version 2.0: Draft" \
				 -V date="\today" \
				 -V geometry="margin=1in" \
				 -V links-as-notes=True \
				 -f markdown \
				 -t latex \
				 *.md \
				 -o build/majbook.pdf

upload: build/majbook.pdf
	git config user.name "rabbidous"
	git config user.email "mghemke@gmail.com"
	git add build/majbook.pdf
	git commit -m "Travis upload of latest PDF [ci skip]"
	git push
clean:
	rm -rf build
