# -*- rpm-spec -*-
# 
# libilbc-rfc3951
# 

Summary:	iLBC codec
Name:		libilbc-rfc3951
Version:	0.7
Release:	1
License:	Unknown
Group:		Applications/Communications
URL:		http://www.belledonne-communications.com
Source0:	%{name}-0.7.tar.gz
BuildRoot:	%{_tmppath}/%{name}-%{version}-%{release}-buildroot
%ifarch %ix86
BuildArch:	i686
%endif
Requires: bash >= 2.0

%description
iLBC codec library based on source code in RFC3951.

%package        devel
Summary:        Headers, libraries and docs for the libilc-rfc3951 library
Group:          Development/Libraries
Requires:       %{name} = %{version}-%{release}

%description    devel
iLBC codec library based on source code in RFC3951.

This package contains header files and development libraries needed to
develop programs using the iLBC library.

%prep
%setup -q

%build
%configure 
%{__make} 

# parallel build disabled due to automake libtool random errors
#%{__make} -j$RPM_BUILD_NCPUS 

%install
rm -rf $RPM_BUILD_ROOT
%makeinstall

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%doc AUTHORS COPYING ChangeLog INSTALL NEWS README
%{_libdir}/*
%{_mandir}/*

%files devel
%defattr(-,root,root,-)
%{_libdir}/*.la
%{_libdir}/*.so
%{_libdir}/pkgconfig/*.pc
%{_includedir}
%{_docdir}



%changelog
* Thu Oct 6 2011 Simon Morlat <simon.morlat@belledonne-communications.com>
	- Initial specfile.

