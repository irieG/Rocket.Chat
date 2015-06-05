Meteor.publish 'room', (rid) ->
	unless this.userId
		return this.ready()

	console.log '[publish] room ->'.green, 'rid:'

	if typeof rid isnt 'string'
		return this.ready()

	if not Meteor.call 'canAccessRoom', rid, this.userId
		return this.ready()

	ChatRoom.find
		_id: rid
	,
		fields:
			name: 1
			t: 1
			cl: 1
			usernames: 1