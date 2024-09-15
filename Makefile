.PHONY: all clean

objects = spinnewiel_vos_oog.png spinnewiel_vos_klem.png \
		spinnewiel_vos_as.png spinnewiel_vos_oog.stl \
		spinnewiel_vos_klem.stl spinnewiel_vos_as.stl \
		spinnewiel_vos_bobbin.png spinnewiel_vos_bobbin.stl \
		spinnewiel_vos_bobbin_small_end.png spinnewiel_vos_bobbin_small_end.stl \
		spinnewiel_vos_bobbin_big_end.png spinnewiel_vos_bobbin_big_end.stl \
		spinnewiel_vos_bobbin_axle.png spinnewiel_vos_bobbin_axle.stl \
		spinnewiel_vos_treadle_fastener.png spinnewiel_vos_treadle_fastener.stl

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

