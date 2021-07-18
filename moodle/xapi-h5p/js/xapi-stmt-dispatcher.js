$(document).ready(function () {
	ADL.XAPIWrapper.changeConfig({
		'endpoint': 'https://{LRS_URL}:2443/data/xAPI',
		"auth" : "Basic " + toBase64('{LRS_USERNAME_PASSWORD}')
	});
	H5P.externalDispatcher.on('xAPI', function(event) {
		console.log(event.data.statement);
		var stmt = new ADL.XAPIStatement(
			event.data.statement.actor,
			event.data.statement.verb,
			event.data.statement.object,
			event.data.statement.result);
		stmt.generateId();
		stmt.context = event.data.statement.context;
		stmt.generateRegistration();
		console.log(JSON.stringify(stmt));
		ADL.XAPIWrapper.sendStatement(stmt)
	});
});
