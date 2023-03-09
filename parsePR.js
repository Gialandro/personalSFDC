const fs = require ('fs');
const readLine = require ('readline')

async function getTests () {
	let testsFile = __dirname + '/testsToRun.txt';
	await fs.promises.writeFile (testsFile, 'all');
	const lines = readLine.createInterface ({
		input: fs.createReadStream (__dirname + '/pr_body.txt'),
		crlfDelay: Infinity
	});
	for await (const line of lines) {
		if (line.includes ('@Tests:')) {
			let tests = line.slice (line.indexOf ('@') + 7);
			await fs.promises.writeFile (testsFile, tests);
			await fs.promises.appendFile (testsFile, '\n');
		}
	}
}
getTests ();