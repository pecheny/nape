
clean:
	rm -rf __chxdoctmp
	rm -rf haxelib/nape
	rm -rf haxelib/zpp_nape
	rm -f nape.xml

#------------------------------------------------------------------------------------

# docs: pre_compile
# 	haxe -cp haxelib -xml nape.xml --macro "include('nape')" --macro "include('zpp_nape')" -D NAPE_RELEASE_BUILD -dce no \
#          -cp ../nape-hacks/src --macro "include('nape.hacks')" \
#          -cp ../nape-symbolic/src --macro "include('nape.symbolic')" -lib Parsex
# 	./chxdoc/chxdoc -o docs --templateDir=chxdoc/src/templates/default \
# 		-f zpp_nape -f haxe -f flash --ignoreRoot=true -f com \
# 		--title="Nape Physics Library" nape.xml


DUMMYS = $(shell find cx-src -type f -name "Dummy*" -print | sed 's/^/-x /')
pre_compile:
	rm -rf haxelib/nape
	rm -rf haxelib/zpp_nape
	caxe.exe -o haxelib cx-src -tc 2 --times $(DUMMYS)
	# find src -type f -print | xargs sed -i 's~^.*\<null\>\.[_a-zA-Z].*$$~/*silly null. issues*/~g'
