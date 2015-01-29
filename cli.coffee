program = require('commander')
taran = require('../lib')
pkg = require('../package.json')


program
	.version(pkg.version)
	.option('-p, --port <port>', 'Stupid port')
	.option('-m, --mode <mode>', 'Stupid mode')


program
	.command('start')
	.description('Start stupid programm')
	.action ->
		taran.start(program.port, program.mode)


program.parse(process.argv)