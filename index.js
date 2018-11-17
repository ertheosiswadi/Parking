const express = require('express');

const app = express();

const PORT = process.env.PORT || 3000;

const data = {
	gayley: [true, false, true, false, true]
}

const data_2 = {
	gayley: ["Yes", "No", "Yes", "No", "Yes"]
}

app.get('', (request, response) => {
	response.header('Content-Type', 'application/json');
	response.send(JSON.stringify(data));
})

app.get('/string', (request, response) => {
	response.header('Content-Type', 'application/json');
	response.send(JSON.stringify(data_2));
})

app.listen(PORT, () => {
	console.log('Hey what is up');
});