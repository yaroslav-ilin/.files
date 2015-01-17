#!/usr/bin/env python

import sys
import os
from glob import glob
from argparse import ArgumentParser

VERSION = '0.7'
IGNORED_SYSFILES = set(['.DS_Store', '.git', '.gitignore'])
IGNORED_DOTFILES = set(['.config'])


def main(argv):
    parser = ArgumentParser(description='Install dot-files into system.')
    parser.add_argument('--version', action='version', version=VERSION)
    parser.add_argument('-v', '--verbose', help='verbosity level', action='count', default=0)
    args = parser.parse_args()

    repo = sys.path[0]
    home = os.path.expanduser('~')

    home_dotconfig = os.path.join(home, '.config')
    if not os.path.exists(home_dotconfig):
        os.mkdir(home_dotconfig)
    fish_dotconfig = os.path.join(home_dotconfig, 'fish')
    if not os.path.exists(fish_dotconfig):
        os.mkdir(fish_dotconfig)

    # setup symlinks
    sync(at=os.path.join(repo, '.config', 'fish'),
         to=fish_dotconfig,
         ignore=IGNORED_SYSFILES,
         verbosity=args.verbose)
    sync(at=os.path.join(repo, '.config'),
         to=home_dotconfig,
         ignore=IGNORED_SYSFILES | set(['fish']),
         verbosity=args.verbose)
    sync(at=repo,
         to=home,
         mask='.*',
         ignore=IGNORED_SYSFILES | IGNORED_DOTFILES,
         verbosity=args.verbose)


def sync(at, to, mask=None, ignore=False, verbosity=0):
    for path in glob(os.path.join(at, mask or '*')):
        filename = os.path.basename(path)
        if ignore and filename in ignore:
            if verbosity > 1:
                print >>sys.stderr, filename + ': ignored in', to
            continue
        dest = os.path.join(to, filename)
        try:
            os.symlink(path, dest)
            if verbosity > 0:
                print dest, '->', path
        except OSError as e:
            if 17 == e.errno:
                if path != os.path.realpath(dest):
                    print >>sys.stderr, filename + ': already exists in', to
            else:
                raise e


if __name__ == '__main__':
    main(sys.argv[1:])

