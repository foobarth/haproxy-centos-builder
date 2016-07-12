VERSION=1.6.6
RELEASE=1
.PHONY: default setver

default: output/haproxy-$(VERSION)-$(RELEASE).el7.centos.x86_64.rpm

clean:
	rm -f image-built output/haproxy-*.rpm
image-built:
	docker build --tag haproxy-builder .
	touch $@

SOURCES/haproxy-$(VERSION).tar.gz:
	mkdir -p SOURCES && cd SOURCES && curl -O http://www.haproxy.org/download/1.6/src/haproxy-$(VERSION).tar.gz

setver:
	sed -i.bak 's/Version:.*/Version: $(VERSION)/' SPECS/haproxy.spec
	sed -i.bak 's/Release:.*/Release: $(RELEASE)%{?dist}/' SPECS/haproxy.spec

output/haproxy-$(VERSION)-$(RELEASE).el7.centos.x86_64.rpm: image-built SOURCES/haproxy-$(VERSION).tar.gz | setver
	docker run --rm -it -v $(PWD):/build haproxy-builder bash -c "set -x && rpmdev-setuptree && cd / && cp build/SOURCES/* ~/rpmbuild/SOURCES/ && cp build/SPECS/* ~/rpmbuild/SPECS/ && cd ~/rpmbuild/ && rpmbuild -ba SPECS/haproxy.spec && mkdir -p /build/output && cp ~/rpmbuild/SRPMS/* /build/output/ && yes | cp ~/rpmbuild/RPMS/*/* /build/output/"
