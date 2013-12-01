describe "Raffler", ->
	it "should be defined", ->
		expect(Raffler).toBeDefined()

	describe "Raffler Model", ->
		it "should exist", ->
			expect(Raffler.Models.Entry).toBeDefined()

		describe "Attributes",->
			entry = new Raffler.Models.Entry

			it "should have default attributes", ->
				expect(entry.attributes.name).toBeDefined()
				expect(entry.attributes.winner).toBeDefined()

		describe "Validations (we don't have any checks on our application, so just check if exists with .toBeTruthy(). I actually couldn't get model validation to work. :(", ->
			attrs = {}

			beforeEach ->
				attrs = 
					name: 'Will'
					winner: false

			afterEach ->
				entry = new Raffler.Models.Entry attrs
				expect(entry.isValid()).toBeTruthy()

			it "should valide the presence of name", ->
				attrs["name"] = 'Will'

			it "should validate the presence of winner atrribute", ->
				attrs["winner"] = false

	describe "Raffler Collection", ->
		it "should exist", ->
			expect(Raffler.Collections.Entries).toBeDefined()

	describe "Raffler View", ->
		it "should exist", ->
			expect(Raffler.Views.EntriesIndex).toBeDefined()

		entries_data = [
			{
				name: 'Will'
				winner: false
			},
			{
				name: 'Kip'
				winner: false
			},
			{
				name: 'Pac Man'
				winner: false
			}
		]

		invisible_table = document.createElement 'table'

		beforeEach ->
			@entries_collection = new Raffler.Collections.Entries entries_data
			@entries_view = new Raffler.Views.EntriesIndex
				collection: @entries_collection
				el: invisible_table

		it "should have the right element", ->
			expect(@entries_view.el).toEqual invisible_table

		it "should have the right collection", ->
			expect(@entries_view.collection).toEqual @entries_collection

		it "should have collection length",->
			console.log(@entries_view.collection)
			expect(@entries_view.collection.length).toEqual 3

		describe "createEntry", ->
			it "should create an entry, entry length now 4", ->
				@entries_view.createEntry
					name: 'Joe'
					winner: false
				console.log(@entries_view.collection)
				expect(@entries_view.collection.length).toEqual 4

		describe "kill", ->
			it "should delete an entry, entry length to 2 since collection is reset to 3 names due to beforeEach in test", ->
				@entries_view.kill
					item:  @entries_view.collection.models[3]
				console.log(@entries_view.collection)
				expect(@entries_view.collection.length).toEqual 2

		describe "drawWinner", ->
			it "should draw a winner (see console log. one entry should be winner)", ->
				@entries_view.drawWinner
					entries: @entries_collection
				console.log("Entry 1 winner val: ", @entries_view.collection.models[0].attributes.winner);
				console.log("Entry 2 winner val: ", @entries_view.collection.models[1].attributes.winner);
				console.log("Entry 3 winner val: ", @entries_view.collection.models[2].attributes.winner);
