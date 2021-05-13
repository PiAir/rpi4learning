$(document).ready(function () {
	ADL.XAPIWrapper.changeConfig({
		'endpoint': 'https://rpi4learning.duckdns.org:2443/data/xAPI/',
		"auth" : "Basic " + toBase64('98234aa9ba5c56ddefebdb6b45aa1d608fecee5e:84e7cd9e90243f4ed99d19e75829957732b46d64')
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