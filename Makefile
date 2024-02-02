.PHONY: all clean

all: preview.png spinnewiel_oog.stl

clean:
	rm *.png *.stl

preview.png: spinnewiel_oog.scad
	openscad -o preview.png spinnewiel_oog.scad

spinnewiel_oog.stl: spinnewiel_oog.scad
	openscad -o spinnewiel_oog.stl spinnewiel_oog.scad
