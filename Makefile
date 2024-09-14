.PHONY: all clean

objects = spinnewiel_vos_oog.png spinnewiel_vos_klem.png \
		spinnewiel_vos_as.png spinnewiel_vos_oog.stl \
		spinnewiel_vos_klem.stl spinnewiel_vos_as.stl \
		spinnewiel_vos_bobbin.png spinnewiel_vos_bobbin.stl

all: $(objects)

# $(objects): %.stl: %.scad

clean:
	rm -f spinnewiel*.stl spinnewiel*.stl.deps

%.png: %.scad
	openscad -o $@ $<
#%.stl: %.scad
#	openscad -o $@ $<
# explicit wildcard expansion suppresses errors when no files are found
include $(wildcard *.deps)

%.stl: %.scad
	openscad -m make -o $@ -d $@.deps $<

