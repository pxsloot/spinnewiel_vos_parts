.PHONY: all clean

objects = spinnewiel_vos_oog.png spinnewiel_vos_klem.png spinnewiel_vos_as.png spinnewiel_vos_oog.stl spinnewiel_vos_klem.stl spinnewiel_vos_as.stl

all: $(objects)

# $(objects): %.stl: %.scad

clean:
	rm spinnewiel*.stl

%.png: %.scad
	openscad -o $@ $<
%.stl: %.scad
	openscad -o $@ $<
