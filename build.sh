#!/bin/sh

PRG0="47ba60fad332fdea5ae44b7979fe1ee78de1d316ee027fea2ad5fe3c0d86f25a"
PRG1="6ca47e9da206914730895e45fef4f7393e59772c1c80e9b9befc1a01d7ecf724"
SM_USA="c63bacd07cf0d2336e8a4f9b9c556d0758629f102211d989d92495e117a8b3a0"


compareHash() {
	echo $1 $2 | sha256sum --check > /dev/null 2>&1
}

build() {
	tools/asm6f smb2.asm -n -c -L bin/smb2.nes "$@" > bin/assembler.log
}



if [ "$1" = "test" ] ; then

	buildErr=0

	build

	if [ $? -ne 0 ] ; then
		echo 'Failed building PRG0!'
		buildErr=1

	elif ! compareHash $PRG0 'bin/smb2.nes' ; then
		echo 'PRG0 build did not match PRG0!'
		buildErr=1
	fi

	build -dREV_A

	if [ $? -ne 0 ] ; then
		echo 'Failed building PRG1!'
		buildErr=1

	elif ! compareHash $PRG1 'bin/smb2.nes' ; then
		echo 'PRG1 build did not match PRG1!'
		buildErr=1
	fi

	build -dSM_USA

	if [ $? -ne 0 ] ; then
		echo 'Failed building SM_USA!'
		buildErr=1

	elif ! compareHash $SM_USA 'bin/smb2.nes' ; then
		echo 'SM_USA build did not match SM_USA!'
		buildErr=1
	fi

	if [ $buildErr -ne 0 ] ; then
		echo 'Test failed'
		exit $buildErr
	else
		echo 'Test passed: PRG0 and PRG1 built and matched original ROMs'
		exit $buildErr
	fi

fi

echo 'Assembling...'
build $@

if [ $? -ne 0 ] ; then
	echo 'Build failed!'
	exit 1
fi

echo 'Build succeeded.'

if compareHash $PRG0 'bin/smb2.nes' -eq 0 ; then
	echo 'Matched PRG0 ROM'
	exit 0
elif compareHash $PRG1 'bin/smb2.nes' -eq 0 ; then
	echo 'Matched PRG1 ROM'
	exit 0
else
	echo 'Did not match either ROM'
	exit -1
fi



