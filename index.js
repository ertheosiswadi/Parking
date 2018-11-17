const express = require('express');

const app = express();

const PORT = process.env.PORT || 3000;

const data = {
	gayley: [true, false, true, false, true]
}

app.get('', (request, response) => {
	response.header('Content-Type', 'application/json');
	response.send(JSON.stringify(data));
})

app.listen(PORT, () => {
	console.log('Hey what is up');
});