
PDFFILES=01_maj_pattern_book.md \
02_three_person_patterns.md \
03_four_person_patterns.md \
04_five_person_patterns.md \
05_six_person_patterns.md \
06_seven_person_patterns.md \
07_eight_person_patterns.md \
08_nine_person_patterns.md \
09_ten_person_patterns.md \
10_big_patterns.md \
11_appendix_a_7clubs.md \
12_appendix_b_dual_passing.md \
13_appendix_c_gandini_weaves.md \
14_appendix_d_7club2ct.md \
15_appendix_e_synchronous_passing.md \
16_appendix_f_passing_43.md


pdf: *.md
	mkdir -p build
	pandoc --toc \
				 -s \
				 --template=pdf/template.tex \
				 -V title="Madison Area Jugglers' Pattern Book" \
				 -V documentclass=book \
				 -V subtitle="Version 2.0: Draft" \
				 -V date="\today" \
				 -V geometry="margin=1in" \
				 -V links-as-notes=True \
				 -f markdown \
				 -t latex \
				 $(PDFFILES) \
				 -o build/majbook.pdf
clean:
	rm -rf build
