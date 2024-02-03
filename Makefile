.PHONY: all clean

all: preview_oog.png preview_klem.png preview_as.png spinnewiel_vos_oog.stl spinnewiel_vos_klem.stl spinnewiel_vos_as.stl

clean:
	rm *.stl

preview_as.png: spinnewiel_vos_as.scad
	openscad -o preview_as.png spinnewiel_vos_as.scad

preview_klem.png: spinnewiel_vos_klem.scad
	openscad -o preview_klem.png spinnewiel_vos_klem.scad

preview_oog.png: spinnewiel_vos_oog.scad
	openscad -o preview_oog.png spinnewiel_vos_oog.scad

spinnewiel_vos_as.stl: spinnewiel_vos_as.scad
	openscad -o spinnewiel_vos_as.stl spinnewiel_vos_as.scad

spinnewiel_vos_klem.stl: spinnewiel_vos_klem.scad
	openscad -o spinnewiel_vos_klem.stl spinnewiel_vos_klem.scad

spinnewiel_vos_oog.stl: spinnewiel_vos_oog.scad
	openscad -o spinnewiel_vos_oog.stl spinnewiel_vos_oog.scad
