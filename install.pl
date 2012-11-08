#!/usr/bin/perl -w

# NOTE: this script will download plugins with specific versions
# If some package is unavailable at the time you use the script,
# just find another source and substitute it

use File::Basename;
use Cwd;

$curdir = fileparse(getcwd());

if ($curdir ne ".emacs.d") {
  die ("Please run install.pl in directory ~/.emacs.d");
}

system("mkdir -pv plugins");
chdir("plugins");

#packages in misc
system("mkdir -pv misc");
chdir("misc");

@pkg_misc = (
             "http://nschum.de/src/emacs/window-numbering-mode/window-numbering.el",
             "http://autopair.googlecode.com/svn/trunk/autopair.el",
             "http://users.skynet.be/ppareit/projects/graphviz-dot-mode/graphviz-dot-mode.el",
             "http://www.emacswiki.org/emacs/download/linum+.el",
             "http://www.emacswiki.org/emacs/download/quick-jump.el",
             "http://www.emacswiki.org/emacs/download/dired+.el",
             "http://inst.eecs.berkeley.edu/~cs186/fa05/debugging/xcscope.el",
             "http://www.cmake.org/CMakeDocs/cmake-mode.el",
             "http://jblevins.org/projects/markdown-mode/markdown-mode.el",
             "http://www.neilvandyke.org/quack/quack.el"
            );

foreach $path (@pkg_misc) {
  if ( ! -e fileparse($path)) {
    system("wget $path");
  }
}

chdir("..");


#packages in separating directories

system("mkdir -pv zjl-hl");     #extended c/c++/elisp highlights
chdir("zjl-hl");
@pkg_zjl = (
            "http://www.emacswiki.org/emacs/download/zjl-hl.el",
            "http://www.emacswiki.org/emacs/download/highlight.el",
            "http://www.emacswiki.org/emacs/download/region-list-edit.el"
           );
foreach $path (@pkg_zjl) {
  if ( ! -e fileparse($path)) {
    system("wget $path");
  }
}
chdir("..");

system("mkdir -pv color-theme");
chdir("color-theme");
if (! -e "color-theme-6.6.0.tar.gz") {
  system("wget http://download.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.tar.gz");
  system("tar -zxvf color-theme-6.6.0.tar.gz")
}
if (! -e "color-theme-tangotango") {
  system("git clone https://github.com/juba/color-theme-tangotango.git");
}
chdir("..");

if (! -e "yasnippet") {
  system("git clone https://github.com/capitaomorte/yasnippet");
}

system("mkdir -pv ibus");
chdir("ibus");
if (! -e "ibus-el-0.2.1.tar.gz") {
  system("wget http://launchpad.net/ibus.el/0.2/0.2.1/+download/ibus-el-0.2.1.tar.gz");
  system("tar -zvxf ibus-el-0.2.1.tar.gz");
}
chdir("..");

system("mkdir -pv cedet");
chdir("cedet");
if (! -e "cedet-1.0.1.tar.gz") {
  system("wget http://sourceforge.net/projects/cedet/files/cedet/cedet-1.0.1.tar.gz");
  system("tar -zvxf cedet-1.0.1.tar.gz");
  chdir("cedet-1.0.1");
  system("make");
  chdir("..");
}
chdir("..");

system("mkdir -pv ecb");
chdir("ecb");
if (! -e "ecb-2.40.tar.gz") {
  system("wget http://sourceforge.net/projects/ecb/files/ecb/ECB%202.40/ecb-2.40.tar.gz");
  system("tar -zvxf ecb-2.40.tar.gz");
}
chdir("..");

system("mkdir -pv org-mode");
chdir("org-mode");
if (! -e "org-7.8.03.tar.gz") {
  system("wget http://orgmode.org/org-7.8.03.tar.gz");
  system("tar -zvxf org-7.8.03.tar.gz");
  chdir("org-7.8.03");
  system("make");
  chdir("../../misc");
  if (! -e "plantuml.jar") {
    system("wget http://sourceforge.net/projects/plantuml/files/plantuml.jar/");
  }
  chdir("../org-mode");
}
chdir("..");

if (! -e "hideshow-org") {
  system("git clone git://github.com/secelis/hideshow-org.git");
}

if (! -e "workgroups") {
  system("git clone git://github.com/tlh/workgroups.el workgroups");
  if (! -e "../wg-save") {
          system("touch ../wg-save")
  }
}

chdir("misc");
if (! -e "log4j-mode-1.3.zip") {
  system("wget http://sourceforge.net/projects/log4j-mode/files/latest/download");
  system("unzip log4j-mode-1.3.zip");
}
chdir("..");

system("mkdir -pv slime");
chdir("slime");
if (! -e "slime-current.tgz") {
  system("wget http://common-lisp.net/project/slime/snapshots/slime-current.tgz");
  system("tar -zvxf slime-current.tgz");
}
chdir("..");


system("mkdir -pv doxymacs");
chdir("doxymacs");
if (! -e "doxymacs-1.8.0.tar.gz") {
  system("wget http://sourceforge.net/projects/doxymacs/files/doxymacs/1.8.0/doxymacs-1.8.0.tar.gz");
  system("tar -zvxf doxymacs-1.8.0.tar.gz");
  chdir("doxymacs-1.8.0");
  system("./configure");
  system("make");
  chdir("..");
}
chdir("..");

system("mkdir -pv auctex");
chdir("auctex");
if (! -e "auctex-11.86.tar.gz") {
  system("wget http://ftp.gnu.org/pub/gnu/auctex/auctex-11.86.tar.gz");
  system("tar -zvxf auctex-11.86.tar.gz");
  chdir("auctex-11.86");
  system("./configure");
  system("make");
  chdir("..");
}
chdir("..");

system("mkdir -pv auto-complete");
chdir("auto-complete");
if (! -e "auto-complete-1.3.1.tar.bz2") {
  system("wget http://cx4a.org/pub/auto-complete/auto-complete-1.3.1.tar.bz2");
  system("tar -jvxf auto-complete-1.3.1.tar.bz2");
  chdir("auto-complete-1.3.1");
  system("make byte-compile");
  chdir("..");
}
chdir("..");


chdir("..");                    # now in ~/.emacs.d/


# set patch to "y" if you want to apply patch
$doPatch = "n";
if ($doPatch eq "y") {
  system("patch -p0 < ./patch/xcscope.patch");
  system("patch -p0 < ./patch/color-theme-tangotango.patch");
  system("patch -p0 < ./patch/zjl-hl.patch");
}

print("done\n");
