const express = require('express');

const app = express();

const PORT = process.env.PORT || 3000;

const data = {
	gayley: [true, false, true, false, true]
}

const denise = {
	name: 'denise'
}

app.get('', (request, response) => {
	response.header('Content-Type', 'application/json');
	response.send(JSON.stringify(data));
})

app.get('/denise', (request, response) => {
	response.header('Content-Type', 'application/json');
	response.send(JSON.stringify(denise));
})

app.listen(PORT, () => {
	console.log('Hey what is up');
});