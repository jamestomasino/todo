%global _hardened_build 1

Summary: A minimalist todo list manager
Name: todo
Version: 2020.07.10
Release: 1%{?dist}
License: GPL
Group: Applications/Productivity

Source0: https://github.com/jamestomasino/todo/archive/v%{version}.tar.gz#/todo-%{version}.tar.gz

BuildArch: noarch
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

%description
todo  is a simple, minimalist todo list manager. Users can add items to a todo list
or delete them. Deleted items are archived and can be reviewed.

%prep

%setup

%build

%install
make PREFIX=%{?buildroot}%{_prefix} install

%clean
rm -rf %{buildroot}

%post

%preun

%postun

%files
%attr(0755,root,root) %{_bindir}/todo
%{_mandir}/man1/todo.1*

%changelog
* Fri Jul 10 2020 Andrew Williams <andy@tensixtyone.com> 2020-07.10-1
- Initial RPM package
